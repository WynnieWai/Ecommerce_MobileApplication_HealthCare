import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/onboarding.dart';
import 'package:testing_asg1/utils/theme/theme.dart';

// -- Use this Class to setup themes, initial Bindings, any animations and much more using Material Widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
