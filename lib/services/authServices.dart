import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sing_in_with_firebase/utils/notification.dart';
import 'package:google_sing_in_with_firebase/view/homescreenview.dart';

class AuthServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );
  signInWithGoolge() async {
    try {
      final GoogleSignInAccount? guser = await _googleSignIn.signIn();
      if (guser == null) return null;

      final gAuth = await guser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // Step 1: Get the email that caused the issue
        final email = e.email;
        final pendingCred = e.credential;

        // Step 2: Ask the user to log in with their original method (email/password)
        final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email!,
          password: "theUserPassword", // you'd prompt the user for it
        );

        // Step 3: Link the Google credential to this account
        await userCredential.user?.linkWithCredential(pendingCred!);

        print("✅ Google account linked to existing email/password account");
      } else {
        print("Firebase error: ${e.message}");
      }
    }
  }

  signOut() async {
    print("object");
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    print('sign out');
  }

  signUpWithEmailPassword(
      BuildContext context, String email, String password, String name) async {
    try {
      //create user in firebase auth
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      //update user profile with name
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.sendEmailVerification().then(
        (value) {
          ShowNotification.customNotifcation(
              context, 'Verification Link Send to your email');
        },
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      handleResponse(context, e.message.toString());
    }
  }

  signInWithEmailPassword(
      BuildContext context, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = userCredential.user;
      if (!user!.emailVerified) {
        handleResponse(context, 'not verified');
      } else {
        ShowNotification.customNotifcation(
            context, 'Welcom ${user.displayName}');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreenView(
                  userid: user.uid.toString(),
                  name: user.displayName.toString(),
                  email: user.email.toString(),
                  dp: user.photoURL.toString(),
                  isEmailVerified: user.emailVerified.toString()),
            ));
      }
    } on FirebaseAuthException catch (e) {
      print('${e}');
      handleResponse(context, e.message.toString());
    }
  }

  handleResponse(BuildContext context, String message) {
    if (message.toString() ==
        'The supplied auth credential is incorrect, malformed or has expired.') {
      ShowNotification.customNotifcation(
          context, 'Check Your Email or Password');
    } else if (message.toString() == 'not verified') {
      ShowNotification.customNotifcation(
          context, 'Your Account is not verified yet');
    } else if (message.toString() ==
        'The email address is already in use by another account.') {
      ShowNotification.customNotifcation(
          context, 'Email is already used you can try continue with google');
    } else {
      ShowNotification.customNotifcation(context, message.toString());
    }
  }
}
