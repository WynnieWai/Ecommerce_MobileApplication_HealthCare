import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/data/repositories/user/user_repository.dart';
import 'package:testing_asg1/features/personalization/controllers/user_controller.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/helpers/network_manager.dart';
import 'package:testing_asg1/utils/popups/full_screen_loader.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

/// Controller to manage user related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears 
  @override 
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
    userName.text = userController.user.value.userName;
  }

  Future<void> updateUserName() async {
    try {
      // Start loading 
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.docerAnimation);

      // Check Internet Connectivity 
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation 
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first and last name in the Firebase Firestore 
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      Map<String, dynamic> usernamedata={'Username': userName.text.trim()};
      await userRepository.updateSingleField(usernamedata);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.value.userName = userName.text.trim();

      // Fetch latest user data from Firestore
      await userController.fetchUserRecord();


      // Remove Loader 
      TFullScreenLoader.stopLoading();

      // Show Success Message 
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

      // Move to previous screen after a short delay
      await Future.delayed(const Duration(milliseconds: 900));
      // Move to previous screen 
      Get.back();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}