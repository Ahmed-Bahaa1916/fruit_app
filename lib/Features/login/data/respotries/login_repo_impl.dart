import 'package:untitled2/Features/login/domain/respotries/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<dynamic> CompleteInformation({
    required String name,
    required String phone,
    required String address,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> loginWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> loginWithGoogle() {
    throw UnimplementedError();
  }
}
