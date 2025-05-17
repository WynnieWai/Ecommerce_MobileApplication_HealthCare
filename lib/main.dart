import 'package:flutter/material.dart';
import 'package:testing_asg1/app.dart';
import 'package:testing_asg1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// ------ Entry point of Flutter App ------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Todo: Add Widgets Binding
  // Todo: Init Local Storage 
  // Todo: Await Native Splash

  // Todo: Initialize Firebase 
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //   (FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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