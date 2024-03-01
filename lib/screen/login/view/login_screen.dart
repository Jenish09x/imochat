import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imochat/utils/fire_helper/fire_auth_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "imoChat",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  "Connect\nfriends\neasily &\nquickly",
                  style: TextStyle(fontSize: 68, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Our chat app is the perfect way to stay\nconnected with friends and family",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconTile("assets/image/Facebook.png"),
                    InkWell(onTap: () async {
                      String? msg = await FireAuthHelper.fireAuthHelper.googleLogin();
                      if(msg=="succsess")
                        {
                          Get.offAllNamed("dash");
                        }
                    },child: iconTile("assets/image/Google.png")),
                    iconTile("assets/image/Iphone.png"),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Sign up within main"),
                  ),
                ),
                const Center(
                  child: Text(
                    "Existing account? Log in",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
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
