import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testing_asg1/features/authentication/screens/login/login.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/onboarding.dart';
import 'package:testing_asg1/features/authentication/screens/signup/verify_email.dart';
import 'package:testing_asg1/navigation_menu.dart';
import 'package:testing_asg1/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/firebase_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/format_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables 
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance; 

  /// Get Authenticated User Data 
  User? get authUser => _auth.currentUser;
  
  /// Called from main.dart on app launch
  @override 
  void onReady() {
    // Remove the native splash screen 
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen 
    screenRedirect();
  }

  /// Function to determine relevant screen and redirect accordingly 
  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if(user.emailVerified) {
        Get.offAll(()=> const NavigationMenu());
      } 
      else {
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } 
    else {
        // Loacl Storage 
        deviceStorage.writeIfNull('IsFirstTime', true);

        // Check if it's the first time launching the app
        deviceStorage.read('IsFirstTime') != true 
          ? Get.offAll(() => const LoginScreen())  // Redirect to Login Screen if not the first time 
          : Get.offAll(const OnBoardingScreen());  // Redirect to OnBoarding Screen if it's the first time
    }
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
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - Forget Password
  
  /* --------------- Federated identity & social sign in ---------------*/
  
  /// [GoogleAuthentication] - Google 
  /// [FacebookAuthentication] - Facebook
  
  /* --------------- ./end Federated identity & social sign in ---------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
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

  /// Delete User - Remove user auth and Firestore Account
}