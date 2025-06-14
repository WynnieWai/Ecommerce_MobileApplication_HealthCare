import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  
  /// Called from main.dart on app launch
  @override 
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null){
      if(user.emailVerified){
        Get.offAll(()=> const NavigationMenu());
      }else{
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else{
          // Local Storage 
        // if (kDebugMode) {
        //   print('===================== GET STORAGE Auth Repo =====================');
        //   print(deviceStorage.read('IsFirstTime'));
        // }

        deviceStorage.writeIfNull('IsFirstTime', true);
        
        deviceStorage.read('IsFirstTime') != true 
          ? Get.offAll(() => const LoginScreen()) 
          : Get.offAll(const OnBoardingScreen());

        }
    }

  

  /* --------------- Email & Password sign in --------------- */

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  /// [EmailAuthentication] - REGISTER
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
  /// [EmailVerification] - Mail Verification
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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
  
  /* --------------- Federated identity & social sign in ---------------*/
  
  /// [GoogleAuthentication] - Google 
   Future<UserCredential?> signInWithGoogle() async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

    // Create a new credential
    final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);

    //Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credentials);
    
    // await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    if (kDebugMode) print('Something went wrong: $e');
    return null;
  }
}

  /// [FacebookAuthentication] - Facebook
  
  /* --------------- ./end Federated identity & social sign in ---------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
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