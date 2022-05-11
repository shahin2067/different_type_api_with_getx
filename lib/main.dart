import 'package:different_type_api_with_getx/views/create_user_screen.dart';
import 'package:different_type_api_with_getx/views/home_screen.dart';
import 'package:different_type_api_with_getx/views/splash_screen.dart';
import 'package:different_type_api_with_getx/views/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx and Different API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: HomeScreen(),
      builder: EasyLoading.init(),
      getPages: [
        GetPage(name: '/', page: ()=> SplashScreen()),
        GetPage(name: HomeScreen.routeName, page: ()=> HomeScreen()),
        GetPage(name: CreateUserScreen.routeName, page: ()=> CreateUserScreen()),
        GetPage(name: UserListScreen.routeName, page: ()=> UserListScreen()),
      ],
    );
  }

}

