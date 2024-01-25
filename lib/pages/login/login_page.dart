import 'package:flutter/material.dart';

/// 登录页
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        alignment: const Alignment(0.0, 0.8),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
              alignment: Alignment.center,
              margin:
                  EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(120),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "通过Apple继续",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
