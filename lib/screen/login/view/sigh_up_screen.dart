import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("sign up Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                "Sign up with Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Get chatting with friends and family today by\nsigning up for our chat app!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(
                width: 390,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      "Your name",
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
              SizedBox(
                width: 390,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      "Confirm Password",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              const Text(
                "Create an account",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
