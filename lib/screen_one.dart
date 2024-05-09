import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/favourite_controller.dart';
import 'package:get_x_tutorial/image_picker_controller.dart';
import 'package:get_x_tutorial/slider_controller.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key,});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  
  SliderController sliderController = Get.put(SliderController());
  ImagePickerController imagePickerController = Get.put(ImagePickerController());
  FavouriteController favouriteController = Get.put(FavouriteController());
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text('Get X Tutorials'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: (){
                  // Navigator.pop(context);
                  Get.back();
                },child: const Text('Get Back'),
              ),
            ),
            Text(Get.arguments[0]),
            Text(Get.arguments[1]),

            Obx(() => Container(
              height: 100,
              width: 100,
              color: Colors.red.withOpacity(sliderController.opacity.value),
            )),
            Obx(() => Slider(value: sliderController.opacity.value, onChanged: (value) {
              //print(value);
              sliderController.setValue(value);
              })
            ),
            Center(
              child: Obx(() => CircleAvatar(
                  radius: 40,
                  backgroundImage: imagePickerController.imagePath.isNotEmpty ?      FileImage(File(imagePickerController.imagePath.value)) : null,
                ),
              )
            ),
            TextButton(onPressed: (){
                imagePickerController.getImage();
              }, child: const Text("Get Image")
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: favouriteController.favouriteFruits.length,
                  itemBuilder: ((context, index) => ListTile(
                  onTap: (){
                    if(favouriteController.tempList.contains(favouriteController.favouriteFruits[index].toString())){
                      favouriteController.removeFromFavourite(favouriteController.favouriteFruits[index].toString());
                    } else {
                      favouriteController.addToFavourite(favouriteController.favouriteFruits[index].toString());
                    }
                  },
                  title: Text(favouriteController.favouriteFruits[index]),
                  trailing: Obx(() => Icon(
                      Icons.favorite, 
                      color: favouriteController.tempList.contains(favouriteController.favouriteFruits[index].toString()) ? Colors.red : Colors.white,
                    ),
                  )
                ))
              ),
            )
          ],
        ),
      ),
    );
  }
}