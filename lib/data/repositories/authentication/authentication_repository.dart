import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testing_asg1/features/authentication/screens/login/login.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/onboarding.dart';
import 'package:testing_asg1/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/firebase_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/format_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables 
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance; 
  
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
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - Mail Verification
  
  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - Forget Password
  
  /* --------------- Federated identity & social sign in ---------------*/
  
  /// [GoogleAuthentication] - Google 
  /// [FacebookAuthentication] - Facebook
  
  /* --------------- ./end Federated identity & social sign in ---------------*/

  /// [LogoutUser] - Valid for any authentication 
  /// Delete User - Remove user auth and Firestore Account
}