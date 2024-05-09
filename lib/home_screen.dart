import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/counter_controller.dart';
import 'package:get_x_tutorial/login_controller.dart';
import 'package:get_x_tutorial/notification_controller.dart';
import 'package:get_x_tutorial/screen_one.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CounterControlller controller = Get.put(CounterControlller());
  final NotificationController notificationController = Get.put(NotificationController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text('Get X Tutorials'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('Get X State Management'),
              subtitle: const Text('State Management in Flutter using Get X'),
              onTap: (){
                Get.defaultDialog(
                  title: "Delete Card",
                  middleText: "Are you sure you want to delete this card?",
                  confirm: TextButton(
                    onPressed: (){
                      Get.back();
                    },
                    child: const Text('Yes'),
                  ),
                  cancel: TextButton(
                    onPressed: (){
                      Get.back();
                    },
                    child: const Text('No'),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Get X State Management'),
              subtitle:const Text('Bottom Sheet in Flutter using Get X'),
              onTap: (){
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Light Theme'),
                          leading: Icon(Icons.light_mode),
                          onTap: (){
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.dark_mode),
                          title: const Text('Dark Theme'),
                          onTap: (){
                            Get.changeTheme(ThemeData.dark());
                          },
                        ),

                      ],
                    ),
                  )
                );
              },
            ),
          ),
          TextButton(onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenOne()));
            // Get.to(ScreenOne());
            Get.to( const ScreenOne(), arguments: [
              'Hello',
              'World',
            ]);
          }, child: const Text("To the next screen")),
          Obx(() => Text(
            controller.counter.toString(),
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Notification", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                const SizedBox(width: 10),
                Obx(() => Switch(value: notificationController.isTurnedOn.value, onChanged: (value){
                  notificationController.ToggleNotification();
                  // print(value);
                }))
              ],
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: loginController.usernameController,
              decoration: const InputDecoration(
                labelText: 'Enter your username',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: loginController.passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Obx(() => Container(
              padding: const EdgeInsets.all(8.0),
              child: loginController.loading.value ? const CircularProgressIndicator() : ElevatedButton(
                onPressed: (){
                  loginController.loginApi();
                },
                child: const Text('Login'),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.incrementController();
        },
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}