import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_asg1/bindings/general_bindings.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
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
      initialBinding: GeneralBindings(),
      // debugShowCheckedModeBanner: false,
      // Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
