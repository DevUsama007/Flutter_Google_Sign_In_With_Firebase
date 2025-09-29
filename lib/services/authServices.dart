import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );
  signInWithGoolge() async {
    //begin interactive sign in process
    final GoogleSignInAccount? guser = await _googleSignIn.signIn();
    if (guser == null) {
      return null;
    }
    //obtain auth detail from request
    final GoogleSignInAuthentication gAuth = await guser!.authentication;

    //creat a new cradential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    //sign in
    return userCredential.user;
  }

  signOut() async {
    print("object");
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    print('sign out');
  }
}
