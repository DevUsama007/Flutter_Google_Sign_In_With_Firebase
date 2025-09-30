import 'package:flutter/material.dart';
import 'package:google_sing_in_with_firebase/services/authServices.dart';
import 'package:google_sing_in_with_firebase/utils/notification.dart';
import 'package:google_sing_in_with_firebase/widgets/customButtonWidget.dart';
import 'package:google_sing_in_with_firebase/widgets/customTextField.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
  AuthServices _authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 188, 188),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 70,
                      color: const Color.fromARGB(255, 62, 62, 62)
                          .withOpacity(0.8),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    CustomTextField(
                        hintText: 'enter email',
                        icon: Icons.email,
                        controller: email),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: CustomButtonWidget(
                          ontap: () {
                            email.text.isEmpty
                                ? ShowNotification.customNotifcation(
                                    context, 'Field is empty')
                                : _authServices.forgotPassword(
                                    context, email.text.toString());
                          },
                          title: 'Forgot Password'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
