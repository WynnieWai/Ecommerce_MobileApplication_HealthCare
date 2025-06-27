import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testing_asg1/data/repositories/user/user_repository.dart';
import 'package:testing_asg1/features/authentication/screens/login/login.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/onboarding.dart';
import 'package:testing_asg1/features/authentication/screens/signup/verify_email.dart';
import 'package:testing_asg1/navigation_menu.dart';
import 'package:testing_asg1/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/firebase_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/format_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/platform_exceptions.dart';
import 'package:testing_asg1/utils/local_storage/storage_utility.dart';

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
  // void screenRedirect() async {
  //   final user = _auth.currentUser;

  //   if (user != null) {
  //     if(user.emailVerified) {
  //       // Initialise user specific storage
  //       await TLocalStorage.init(user.uid);

  //       Get.offAll(()=> const NavigationMenu());
  //     } 
  //     else {
  //       Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
  //     }
  //   } 
  //   else {
  //       // Loacl Storage 
  //       deviceStorage.writeIfNull('IsFirstTime', true);

  //       // Check if it's the first time launching the app
  //       deviceStorage.read('IsFirstTime') != true 
  //         ? Get.offAll(() => const LoginScreen())  // Redirect to Login Screen if not the first time 
  //         : Get.offAll(const OnBoardingScreen());  // Redirect to OnBoarding Screen if it's the first time
  //   }
  // }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // Check if user signed in with Google
      final providers = user.providerData.map((info) => info.providerId);
      if (providers.contains('google.com')) {
        // Google user: skip email verification
        await TLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else if (user.emailVerified) {
        // Non-Google user, email verified
        await TLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        // Non-Google user, not verified
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
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

  /// [EmailAuthentication] - FORGET PASSWORD
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
  
  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential 
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate 
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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
//    Future<UserCredential?> signInWithGoogle() async {
//   try {
//     // Trigger the authentication flow
//     // final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//     final GoogleSignInAccount? userAccount = await GoogleSignIn(
//       scopes: ['email', 'profile'],
//     ).signIn();
    
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

//     // Create a new credential
//     final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);

//     //Once signed in, return the UserCredential
//     return await _auth.signInWithCredential(credentials);
    
//     // await _auth.currentUser?.sendEmailVerification();
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     if (kDebugMode) print('Something went wrong: $e');
//     return null;
//   }
// }

// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? userAccount = await GoogleSignIn(
//       scopes: ['email', 'profile'],
//     ).signIn();

//     if (userAccount == null) {
//       // User cancelled the sign-in
//       return null;
//     }

//     final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

//     final credentials = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     final userCredential = await _auth.signInWithCredential(credentials);

//     // No need to call updateEmail for Google users!
//     // Save userAccount.email to Firestore in your user controller

//     return userCredential;
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     if (kDebugMode) print('Something went wrong: $e');
//     return null;
//   }
// }

Future<Map<String, dynamic>?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? userAccount = await GoogleSignIn(
      scopes: ['email', 'profile'],
    ).signIn();

    if (userAccount == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credentials);

    // Return both for saving
    return {
      'userCredential': userCredential,
      'googleAccount': userAccount,
    };
  } catch (e) {
    // ...existing error handling...
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
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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
}