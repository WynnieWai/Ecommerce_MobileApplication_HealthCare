import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testing_asg1/data/repositories/authentication/authentication_repository.dart';
import 'package:testing_asg1/features/authentication/controllers/login/login_controller.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/popups/full_screen_loader.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () =>controller.googleSignIn(), 
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.google),
            )
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){}, 
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebook),
            )
          ),
        ),
      ],
    );
  }
}



  
