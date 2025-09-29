import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  String userid;
  String name;
  String email;
  String dp;
  String isEmailVerified;

  HomeScreenView(
      {super.key,
      required this.userid,
      required this.name,
      required this.email,
      required this.dp,
      required this.isEmailVerified});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 188, 188),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        title: Text(
          'WELLCOME TO hOMEsCREEN',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.dp),
                      backgroundColor: Colors.grey,
                      radius: 60,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "UserID:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            widget.userid,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          widget.email,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Email Verified:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          widget.isEmailVerified,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
