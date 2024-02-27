import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                "Log in to Chatbox",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome back! Sign in using your social\naccount or email to continue us",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconTile("assets/image/Facebook.png"),
                  iconTile("assets/image/Google.png"),
                  iconTile("assets/image/Iphone.png"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 390,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      "Your email",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 390,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      "Password",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.toNamed("signup");
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Forgot password?",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container iconTile(String img) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
      child: Image.asset(
        img,
        height: 30,
      ),
    );
  }
}
