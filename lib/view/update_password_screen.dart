import 'package:flutter/material.dart';
import 'package:google_sing_in_with_firebase/services/authServices.dart';
import 'package:google_sing_in_with_firebase/utils/notification.dart';
import 'package:google_sing_in_with_firebase/widgets/customButtonWidget.dart';
import 'package:google_sing_in_with_firebase/widgets/customTextField.dart';

class UpdatePasswordScreen extends StatefulWidget {
  String email;
  UpdatePasswordScreen({super.key, required this.email});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  AuthServices _authServices = AuthServices();
  updateEmail() {
    email.text = widget.email.toString();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateEmail();
  }

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
                    Card(
                      color: Colors.white.withOpacity(0.4),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.lock,
                          size: 50,
                          color: const Color.fromARGB(255, 62, 62, 62)
                              .withOpacity(0.8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomTextField(
                        hintText: 'enter email',
                        icon: Icons.email,
                        controller: email),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hintText: 'enter old password',
                        icon: Icons.lock,
                        controller: oldPassword),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hintText: 'enter new password',
                        icon: Icons.lock_outline,
                        controller: newPassword),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: CustomButtonWidget(
                          ontap: () {
                            email.text.isEmpty ||
                                    oldPassword.text.isEmpty ||
                                    newPassword.text.isEmpty
                                ? ShowNotification.customNotifcation(
                                    context, 'Field is empty')
                                : _authServices.updatePassword(
                                    context,
                                    email.text.toString(),
                                    oldPassword.text.toString(),
                                    newPassword.text.toString());
                          },
                          title: 'Update Password'),
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
