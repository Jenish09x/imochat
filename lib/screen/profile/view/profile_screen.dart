import 'package:flutter/material.dart';

import '../../../utils/fire_helper/fire_helper.dart';
import '../model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                ),
                TextField(
                  controller: txtName,
                  decoration: const InputDecoration(label: Text("Name"),),
                ),
                TextField(
                  controller: txtMobile,
                  decoration: const InputDecoration(label: Text("Mobile"),),
                ),
                TextField(
                  controller: txtBio,
                  decoration: const InputDecoration(label: Text("Bio"),),
                ),
                TextField(
                  controller: txtEmail,
                  decoration: const InputDecoration(label: Text("Email"),),
                ),
                TextField(
                  controller: txtAddress,
                  decoration: const InputDecoration(label: Text("Address"),),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    ProfileModel p1 = ProfileModel(
                      name: txtName.text,
                      mobile: txtMobile.text,
                      bio: txtBio.text,
                      email: txtEmail.text,
                      address: txtAddress.text,
                      image: txtImage.text,
                    );
                    FireDbHelper.fireDbHelper.addProfileData(p1);
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
