import 'package:get/get.dart';

class SliderController extends GetxController {
  RxDouble opacity = .5.obs;

  setValue(double value) {
    opacity.value = value;
  }
}