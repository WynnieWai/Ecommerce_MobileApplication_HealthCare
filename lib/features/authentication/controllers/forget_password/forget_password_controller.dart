import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/data/repositories/authentication/authentication_repository.dart';
import 'package:testing_asg1/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/helpers/network_manager.dart';
import 'package:testing_asg1/utils/popups/full_screen_loader.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///Send reset password email
  sendPasswordResetEmail()async {
    try {
      // Start loading dialog
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Password to reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove loading dialog
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

      // Redirect 
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    }catch (e) {

      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start loading dialog
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Password to reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loading dialog
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

    }catch (e) {

      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}