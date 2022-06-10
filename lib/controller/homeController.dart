import 'package:flutter_application_1/models/homeModel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final homeModel = HomeModel().obs;
  updateWater() {
    homeModel.update((val) {
      if (val!.water >= 4) {
        val.water = 0;
      } else {
        val.water = val.water + 1;
      }
    });
  }

  updateCal() {
    homeModel.update((val) {
      if (val!.cal >= 10) {
        val.cal = 0;
      } else {
        val.cal = val.cal + 1;
      }
    });
  }
}
