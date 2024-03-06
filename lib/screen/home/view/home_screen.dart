import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imochat/screen/home/controller/home_controller.dart';
import 'package:imochat/utils/fire_helper/fire_auth_helper.dart';

import '../../../utils/fire_helper/fire_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  Future<void> getProfileData() async {
    FireDbHelper.fireDbHelper.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed("profile");
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/image/profile.jpg"),
              ),
            ),
            IconButton(
              onPressed: () {
                FireAuthHelper.fireAuthHelper.logOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.img.length,
                  itemExtent: 90,
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.red,
                          Colors.yellow,
                          Colors.blue
                        ],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage:
                          AssetImage("assets/image/${controller.img[index]}"),
                    ),
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: double.infinity,
            //     width: double.infinity,
            //     decoration: const BoxDecoration(
            //       color: Colors.grey,
            //       borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(30),
            //         topLeft: Radius.circular(30),
            //       ),
            //     ),
            //     child: const Column(
            //       children: [
            //         Icon(
            //           Icons.drag_handle,
            //           color: Colors.white,
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: StreamBuilder(
              stream: FireDbHelper.fireDbHelper.getProfileData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  DocumentSnapshot ds = snapshot.data!;
                  Map m1 = ds.data() as Map;
                  return Column(
                    children: [
                      m1['image'] == null
                          ? const CircleAvatar(
                              radius: 50,
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage("${m1['image']}"),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("${m1['name']}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${m1['bio']}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${m1['email']}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${m1['mobile']}"),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
