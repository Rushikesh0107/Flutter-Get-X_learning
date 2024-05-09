import 'package:get/get.dart';

class NotificationController extends GetxController{
  RxBool isTurnedOn = false.obs;

  ToggleNotification(){
    isTurnedOn.value = !isTurnedOn.value;
  }
}