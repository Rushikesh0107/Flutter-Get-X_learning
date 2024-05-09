import 'package:get/get.dart';

class CounterControlller extends GetxController {
  RxInt counter = 0.obs;

  incrementController(){
    counter.value++;
  }
}