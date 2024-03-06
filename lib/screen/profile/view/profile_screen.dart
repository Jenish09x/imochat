import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imochat/utils/fire_helper/fire_auth_helper.dart';

import '../../../utils/fire_helper/fire_helper.dart';
import '../controller/profile_controller.dart';
import '../model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtImage = TextEditingController();

  ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    await controller.getProfileData();
    if (controller.data.value != null) {
      txtName.text = controller.data.value!['name'];
      txtBio.text = controller.data.value!['bio'];
      txtMobile.text = controller.data.value!['mobile'];
      txtEmail.text = controller.data.value!['email'];
      txtAddress.text = controller.data.value!['address'];
      txtImage.text = controller.data.value!['image'];
    }
  }

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
            child: Obx(
              () => controller.data.value == null
                  ? Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                        ),
                        TextField(
                          controller: txtName,
                          decoration: const InputDecoration(
                            label: Text("Name"),
                          ),
                        ),
                        TextField(
                          controller: txtMobile,
                          decoration: const InputDecoration(
                            label: Text("Mobile"),
                          ),
                        ),
                        TextField(
                          controller: txtBio,
                          decoration: const InputDecoration(
                            label: Text("Bio"),
                          ),
                        ),
                        TextField(
                          controller: txtEmail,
                          decoration: const InputDecoration(
                            label: Text("Email"),
                          ),
                        ),
                        TextField(
                          controller: txtAddress,
                          decoration: const InputDecoration(
                            label: Text("Address"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ProfileModel p1 = ProfileModel(
                              uid: FireAuthHelper.fireAuthHelper.user!.uid,
                              name: txtName.text,
                              mobile: txtMobile.text,
                              bio: txtBio.text,
                              email: txtEmail.text,
                              address: txtAddress.text,
                              image: txtImage.text,
                            );
                            FireDbHelper.fireDbHelper.addProfileData(p1);
                            Get.offAllNamed("dash");
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                        ),
                        TextField(
                          controller: txtName,
                          decoration: const InputDecoration(
                            label: Text("Name"),
                          ),
                        ),
                        TextField(
                          controller: txtMobile,
                          decoration: const InputDecoration(
                            label: Text("Mobile"),
                          ),
                        ),
                        TextField(
                          controller: txtBio,
                          decoration: const InputDecoration(
                            label: Text("Bio"),
                          ),
                        ),
                        TextField(
                          controller: txtEmail,
                          decoration: const InputDecoration(
                            label: Text("Email"),
                          ),
                        ),
                        TextField(
                          controller: txtAddress,
                          decoration: const InputDecoration(
                            label: Text("Address"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ProfileModel p1 = ProfileModel(
                              uid: FireAuthHelper.fireAuthHelper.user!.uid,
                              name: txtName.text,
                              mobile: txtMobile.text,
                              bio: txtBio.text,
                              email: txtEmail.text,
                              address: txtAddress.text,
                              image: txtImage.text,
                            );
                            FireDbHelper.fireDbHelper.addProfileData(p1);
                            Get.offAllNamed("dash");
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
