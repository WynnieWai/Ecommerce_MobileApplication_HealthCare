import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_asg1/features/authentication/screens/login/login.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/onboarding.dart';
import 'package:testing_asg1/utils/theme/theme.dart';

// ------ Entry point of Flutter App ------
void main() {

  // Todo: Add Widgets Binding
  // Todo: Init Local Storage 
  // Todo: Await Native Splash
  // Todo: Initialize Firebase 
  // Todo: Initialize Authentication 

  runApp(const App());
}

// -- Use this Class to setup themes, initial Bindings, any animations and much --
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // home: Scaffold(
      //   appBar: AppBar(title: Text("Welcome")),
      //   body: Center(child: Text("App Loaded")),
      // ),
      home: OnBoardingScreen()
    );
  }
}