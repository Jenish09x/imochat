import 'package:get/get.dart';

import '../../../utils/fire_helper/fire_helper.dart';

class ProfileController extends GetxController
{
  Rxn<Map> data = Rxn();

  Future<void> getProfileData() async {
    data.value = await FireDbHelper.fireDbHelper.getProfile();
  }
}