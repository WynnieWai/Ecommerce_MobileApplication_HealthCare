
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/images/t_circular_image.dart';
import 'package:testing_asg1/common/widgets/shimmers/shimmer.dart';
import 'package:testing_asg1/features/personalization/controllers/user_controller.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  // @override
  // Widget build(BuildContext context) {
  //   final controller = UserController.instance;
  //   controller.fetchUserRecord();
  //   return ListTile(
  //     // leading: TCircularImage(image: controller.user.value.profilePicture, width:50, height:50, padding:0, isNetworkImage: true,),
  //     leading: Obx(() {
  //       final networkImage = controller.user.value.profilePicture;
  //       final image = networkImage.isNotEmpty
  //           ? networkImage
  //           : TImages.user; // Fallback to default image if empty
  //           return controller.imageUploading.value
  //           ? const TShimmerEffect(width: 50, height: 50, radius: 50)
  //           : TCircularImage(
  //               image: image,
  //               width: 50,
  //               height: 50,
  //               isNetworkImage: networkImage.isNotEmpty,
  //             );
  //     }),
  //     title:Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color:TColors.white)),
  //     subtitle: Text(controller.user.value.email,style:Theme.of(context).textTheme.bodyMedium!.apply(color:TColors.white)),
  //     trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit,color:TColors.white)),
  //   );
  // }
  @override
Widget build(BuildContext context) {
  final controller = UserController.instance;
  return ListTile(
    // leading: Obx(() {
    //   final networkImage = controller.user.value.profilePicture;
    //   final image = networkImage.isNotEmpty
    //       ? networkImage
    //       : TImages.user; // Fallback to default image if empty
    //   return controller.imageUploading.value
    //       ? const TShimmerEffect(width: 50, height: 50, radius: 50)
    //       : TCircularImage(
    //           image: image,
    //           width: 50,
    //           height: 50,
    //           isNetworkImage: networkImage.isNotEmpty,
    //         );
    // }),
    leading: Obx(() {
      final profileUrl = controller.user.value.profilePicture;
      final hasProfile = profileUrl.isNotEmpty;
      final cacheBustedUrl = profileUrl.isNotEmpty
        ? '${profileUrl}?v=${DateTime.now().millisecondsSinceEpoch}'
        : TImages.user;
      return controller.imageUploading.value
          ? const TShimmerEffect(width: 50, height: 50, radius: 50)
          // : TCircularImage(
          //   image: hasProfile ? cacheBustedUrl : TImages.user,
          //   width: 50,
          //   height: 50,
          //   isNetworkImage: hasProfile,
          // );
          : ClipOval(
            child: hasProfile
              ? Image.network(
                  cacheBustedUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    TImages.user,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  TImages.user,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
          );
    }),
    title: Obx(() => Text(
      controller.user.value.fullName,
      style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
    )),
    subtitle: Obx(() => Text(
      controller.user.value.email,
      style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
    )),
    trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
  );
}
}