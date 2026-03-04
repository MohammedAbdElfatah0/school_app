import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


  class AuthRepo {
  AuthRepo(this._client);

  final SupabaseClient _client;

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

      final userId = response.user?.id;

      if (userId == null) {
        return const Left("User creation failed");
      }

      final result = await savingUserData(userId, fullName, email);

      return result;
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return const Left("Unexpected error occurred");
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

  Future<Either<String, void>> savingUserData(
    String userId,
    String fullName,
    String email,
  ) async {
    try {
      await _client.from('profiles').insert({
        'id': userId,
        'full_name': fullName,
        'email': email,
      });
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
