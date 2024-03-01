import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/fire_helper/fire_helper.dart';
import '../../profile/model/profile_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ADD More Friends"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FireDbHelper.fireDbHelper.getAllProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<ProfileModel> userData = [];
              QuerySnapshot qs = snapshot.data!;
              List<QueryDocumentSnapshot> list = qs.docs;

              for (var x in list) {
                Map m1 = x.data() as Map;
                ProfileModel p1 = ProfileModel(
                  uid: x.id,
                  image: m1['image'],
                  name: m1['name'],
                  bio: m1['bio'],
                  email: m1['email'],
                  mobile: m1['mobile'],
                  address: m1['address'],
                );

                userData.add(p1);
              }
              return ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: userData[index].image != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage("${userData[index].image}"),
                          )
                        : CircleAvatar(
                            radius: 30,
                            child: Text(
                              userData[index].name!.substring(0, 1),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                    title: Text(
                      "${userData[index].name}",
                    ),
                    subtitle: Text(
                      "${userData[index].mobile}",
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
