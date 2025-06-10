import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testing_asg1/features/authentication/screens/login/login.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables 
  final deviceStorage = GetStorage();
  
  /// Called from main.dart on app launch
  @override 
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    // Loacl Storage 
    if (kDebugMode) {
      print('===================== GET STORAGE Auth Repo =====================');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }

  /* --------------- Email & Password sign in --------------- */

  /// [EmailAuthentication] - Sign In
  /// [EmailAuthentication] - Register 
  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - Mail Verification 
  /// [EmailVerification] - Forget Password
  
  /* --------------- Federated identity & social sign in ---------------*/
  
  /// [GoogleAuthentication] - Google 
  /// [FacebookAuthentication] - Facebook
  
  /* --------------- ./end Federated identity & social sign in ---------------*/

  /// [LogoutUser] - Valid for any authentication 
  /// Delete User - Remove user auth and Firestore Account
}