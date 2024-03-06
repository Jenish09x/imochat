import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/fire_helper/fire_helper.dart';
import '../../profile/model/profile_model.dart';
import '../model/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ProfileModel profileModel = Get.arguments;
  TextEditingController txtMsg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${profileModel.name}"),
          leading: CircleAvatar(
            radius: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.call_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.videocam_outlined),
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: txtMsg,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        FireDbHelper.fireDbHelper.sendMassage(
                          fuid: profileModel.uid!,
                          chatModel: ChatModel(
                            date: "${DateTime.now()}",
                            msg: "${txtMsg.text}",
                            name: "${profileModel.name}",
                            time: "${TimeOfDay.now()}",
                          ),
                        );
                        txtMsg.clear();
                      },
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}