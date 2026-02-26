abstract class LoginRepo {
  Future loginWithGoogle();

  Future loginWithFacebook();

  Future CompleteInformation({
    required String name,
    required String phone,
    required String address,
  });
}
