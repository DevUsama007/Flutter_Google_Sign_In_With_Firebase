import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sing_in_with_firebase/view/google_sign_in.dart';
import 'package:google_sing_in_with_firebase/widgets/customButtonWidget.dart';
import 'package:google_sing_in_with_firebase/widgets/customTextField.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
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
                  child: CustomButtonWidget(ontap: () {}, title: 'Sign Up'),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () async {},
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
