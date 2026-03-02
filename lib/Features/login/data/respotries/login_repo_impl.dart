import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  Future<dynamic> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status != LoginStatus.success ||
        loginResult.accessToken == null) {
      return;
    }

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    );
  }

  @override
  Future<dynamic> loginWithGoogle() async {
    // الإصدار الجديد من google_sign_in يستخدم singleton + authenticate
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize();

    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    if (googleAuth.idToken == null) {
      return null;
    }

    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
