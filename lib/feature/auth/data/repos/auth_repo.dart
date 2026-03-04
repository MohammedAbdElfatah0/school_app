import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/networks/supabase_service.dart';

class AuthRepo {
  final _client = SupabaseService.instance.client;

  //sign up
  Future<Either<String, void>> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      //in database we have a table called profiles
      //and in that table we have a column called id and full_name
      //so when the user sign up
      //we will insert the user id and full name in the profiles table
      final userId = response.user?.id;

      if (userId != null) {
        await _client.from('profiles').insert({
          'id': userId,
          'full_name': fullName,
        });
      }
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  //sign in
  Future<Either<String, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _client.auth.signInWithPassword(email: email, password: password);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
