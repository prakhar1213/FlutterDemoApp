import 'package:flutter_application_1/models/navigation.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final navigation = Navigation().obs;
  updateIndex(int index) {
    navigation.update((val) {
      val?.index = index;
    });
  }
}
