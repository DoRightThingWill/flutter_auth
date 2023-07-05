import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    // show google sign in request to user
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from google
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create credential for this user

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // sign user in via firebase

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
