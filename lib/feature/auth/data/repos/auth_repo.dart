import 'dart:developer';

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
      log('Signing up with email: $email');
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      final userId = response.user?.id;

      if (userId == null) {
        return const Left("User creation failed");
      }

      log('User created with ID: $userId');
      final result = await savingUserData(userId, fullName, email);
      log('Result: $result');
      return result;
    } on AuthException catch (e) {
      log(e.toString());
      return Left(e.message);
    } catch (e) {
      log(e.toString());
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
      return Left('sss=>${e.toString()}');
    } catch (e) {
      return Left('sss0=>${e.toString()}');
    }
  }

  //sign out
  Future<Either<String, void>> signOut() async {
    try {
      await _client.auth.signOut();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left('Unexpected error occurred during logout');
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
      log('User data saved successfully');
      return const Right(null);
    } catch (e) {
      log('Error saving user data: $e');
      return Left(e.toString());
    }
  }
}
