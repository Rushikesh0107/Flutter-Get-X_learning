import 'package:get/get.dart';

class FavouriteController extends GetxController{
  RxList<String> favouriteFruits = ["Orange", "Banana", "Apple", "Mango"].obs;
  RxList tempList = [].obs;

  addToFavourite(String fruit){
    tempList.add(fruit);
  }

  removeFromFavourite(String fruit){
    tempList.remove(fruit);
  }
}