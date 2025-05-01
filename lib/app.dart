import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_asg1/utils/constants/text_strings.dart';
import 'package:testing_asg1/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: const Scaffold(
        body: Center(
          child: Text('Awesome! 🎊 Project Structure is set up and running. \n Happy T Coding 🎊', textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
