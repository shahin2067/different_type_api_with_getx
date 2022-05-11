import 'package:different_type_api_with_getx/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    goHomeScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/splash_screen.png'),
            ),
          )
        ],
      ),
    );
  }

  void goHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offNamedUntil(HomeScreen.routeName, (route) => false);
    //Get.off(HomeScreen()); /// Same things
  }

}
