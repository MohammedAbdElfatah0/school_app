import 'package:dartz/dartz.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/feature/profile/data/model/user_model.dart';

class ProfileRepo {
  final sup = SupabaseService.instance.client;

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final user = await sup.from('profiles').select().single();
      final userModel = UserModel.fromJson(user);
      return Right(userModel);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
