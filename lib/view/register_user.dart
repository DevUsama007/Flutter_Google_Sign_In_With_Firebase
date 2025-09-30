import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sing_in_with_firebase/services/authServices.dart';
import 'package:google_sing_in_with_firebase/utils/notification.dart';
import 'package:google_sing_in_with_firebase/view/google_sign_in.dart';
import 'package:google_sing_in_with_firebase/view/homescreenview.dart';
import 'package:google_sing_in_with_firebase/widgets/customButtonWidget.dart';
import 'package:google_sing_in_with_firebase/widgets/customTextField.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  AuthServices _authServices = AuthServices();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
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
                Card(
                  color: Colors.white.withOpacity(0.4),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      Icons.lock_open,
                      color: const Color.fromARGB(255, 62, 62, 62)
                          .withOpacity(0.8),
                      size: 45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Text(
                    "Welcome!, Join Us Now",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 113, 113, 113),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                    hintText: 'Enter Your Name',
                    icon: Icons.person_2,
                    controller: name),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    hintText: 'Enter Your Email',
                    icon: Icons.email,
                    controller: email),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    hintText: 'Enter Password',
                    icon: Icons.lock,
                    controller: password),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButtonWidget(
                      ontap: () async {
                        final User? authuser =
                            await _authServices.signUpWithEmailPassword(
                                context,
                                email.text.toString(),
                                password.text.toString(),
                                name.text.toString());
                        final user = FirebaseAuth.instance.currentUser;
                        if (!user!.emailVerified) {
                          ShowNotification.customNotifcation(context,
                              'You Account is not verified yet check email');
                        } else {
                          if (authuser == null) {
                            ShowNotification.customNotifcation(
                                context, 'error in register');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreenView(
                                      userid: authuser.uid.toString(),
                                      name: 'Not Available',
                                      email: authuser.email.toString(),
                                      dp: "notAvailable",
                                      isEmailVerified: 'true'),
                                ));
                          }
                        }
                      },
                      title: 'Sign Up'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an Account?'),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GoogleSingInWithFlutter(),
                                ));
                          },
                          child: Text('Sign In'))
                    ],
                  ),
                ),
                Card(
                  color: Colors.white.withOpacity(0.4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () async {
                        final User? user =
                            await _authServices.signInWithGoolge();

                        if (user != null) {
                          ShowNotification.customNotifcation(
                              context, 'Register User');
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
