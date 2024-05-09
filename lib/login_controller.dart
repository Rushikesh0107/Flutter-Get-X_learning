import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController{

  final usernameController =  TextEditingController();
  final passwordController =  TextEditingController();

  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
      try{
        final response  = await post(Uri.parse('https://reqres.in/api/login'),
        body: {
        'email': usernameController.value.text,
        'password': passwordController.value.text, 
      });
      
      var data = jsonDecode(response.body);

      // print(response.statusCode);
      // print(data);

      if(response.statusCode == 200){
        Get.snackbar('Login Success', 'Welcome');
      }else {
        Get.snackbar('Error in login', 'error');
      }

      loading.value = false;
    }catch(e){
      print(e);
      Get.snackbar('Error', 'Error in login');
    }
  }

}