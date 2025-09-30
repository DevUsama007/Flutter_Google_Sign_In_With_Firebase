import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sing_in_with_firebase/services/authServices.dart';
import 'package:google_sing_in_with_firebase/utils/notification.dart';
import 'package:google_sing_in_with_firebase/view/forgot_password_screen.dart';
import 'package:google_sing_in_with_firebase/view/homescreenview.dart';
import 'package:google_sing_in_with_firebase/view/register_user.dart';
import 'package:google_sing_in_with_firebase/widgets/customButtonWidget.dart';
import 'package:google_sing_in_with_firebase/widgets/customTextField.dart';

class GoogleSingInWithFlutter extends StatefulWidget {
  const GoogleSingInWithFlutter({super.key});

  @override
  State<GoogleSingInWithFlutter> createState() =>
      _GoogleSingInWithFlutterState();
}

class _GoogleSingInWithFlutterState extends State<GoogleSingInWithFlutter> {
  AuthServices _authServices = AuthServices();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 188, 188),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                Icon(
                  Icons.lock_open,
                  color: const Color.fromARGB(255, 62, 62, 62).withOpacity(0.8),
                  size: 45,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Text(
                    "Welcome Back, You've been missed!",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 113, 113, 113),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                    hintText: 'e.g uuusama0026@gmail.com ',
                    icon: Icons.email,
                    controller: email),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    hintText: 'Usama123',
                    icon: Icons.lock,
                    controller: password),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButtonWidget(
                      ontap: () async {
                        await _authServices.signInWithEmailPassword(context,
                            email.text.toString(), password.text.toString());
                      },
                      title: 'Sign In'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ));
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 113, 113, 113),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterUser(),
                                    ));
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () async {
                      final User? user = await _authServices.signInWithGoolge();
                      ShowNotification.customNotifcation(
                          context, 'Register User');
                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreenView(
                                  userid: user!.uid,
                                  name: user!.displayName.toString(),
                                  email: user!.email.toString(),
                                  dp: user!.photoURL.toString(),
                                  isEmailVerified:
                                      user!.emailVerified.toString()),
                            ));
                      } else {
                        ShowNotification.customNotifcation(
                            context, 'Sign In Canceled');
                      }
                    },
                    child: Container(
                      // width: 240,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.grey,
                          )),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            height: 30,
                            decoration: BoxDecoration(),
                          ),
                          Text(' Continue With Google'),
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
