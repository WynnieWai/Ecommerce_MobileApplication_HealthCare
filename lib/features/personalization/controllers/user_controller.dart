import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing_asg1/data/repositories/user/user_repository.dart';
import 'package:testing_asg1/features/personalization/models/user_model.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user?.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        //Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save User Record
        await userRepository.saveUserRecord(user);

      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }


  // Upload Profile Image
  uploadUserProfilePicture(String imagePath) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxWidth: 512, maxHeight: 512);
    try {
      await userRepository.uploadProfileImage(imagePath);
      TLoaders.successSnackBar(
        title: 'Profile Image Updated',
        message: 'Your profile image has been successfully updated.',
      );
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Image Upload Failed',
        message: 'Failed to upload profile image. Please try again.',
      );
    }
  }


}
