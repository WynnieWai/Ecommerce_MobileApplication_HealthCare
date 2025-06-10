import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testing_asg1/app.dart';
import 'package:testing_asg1/data/repositories/authentication/authentication_repository.dart';
import 'package:testing_asg1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// ------ Entry point of Flutter App ------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // GetX Local Storage 
  await GetStorage.init();

  // Await Splash until other items load 
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase and Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Todo: Initialize Authentication 

  // Load all the Material Design / Themes / Localizations / Bindings 
  runApp(const App());
}

// // -- Use this Class to setup themes, initial Bindings, any animations and much --
// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       themeMode: ThemeMode.system,
//       theme: TAppTheme.lightTheme,
//       darkTheme: TAppTheme.darkTheme,
//       // home: Scaffold(
//       //   appBar: AppBar(title: Text("Welcome")),
//       //   body: Center(child: Text("App Loaded")),
//       // ),
//       home: OnBoardingScreen()
//     );
//   }
// }