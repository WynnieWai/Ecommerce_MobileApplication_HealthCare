import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/device/device_utility.dart';

// class TSearchContainer extends StatelessWidget {
//   const TSearchContainer({
//     super.key, required this.text, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true, this.onTap,
//     this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
//   });

//   final String text;
//   final IconData? icon;
//   final bool showBackground, showBorder;
//   final VoidCallback? onTap;
//   final EdgeInsetsGeometry padding;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);

//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: padding,
//         child: Container(
//           width: TDeviceUtils.getScreenWidth(context),
//           padding: const EdgeInsets.all(TSizes.md), 
//           decoration: BoxDecoration(
//             color: showBackground ? dark ? TColors.dark : TColors.light : Colors.transparent, 
//             borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
//             border: showBorder ? Border.all(color: TColors.grey) : null,
//           ),
//           child: Row(
//             children: [
//               Icon(icon, color: TColors.darkerGrey),
//               const SizedBox(width: TSizes.spaceBtwItems), 
//               Text(text, style: Theme.of(context).textTheme.bodySmall),
//             ]
//           )
//         ),
//       ),
//     );
//   }
// }

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.controller,
    this.onChanged,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    // Force light theme style regardless of dark mode
    const Color forcedBgColor = TColors.light;
    final Color iconColor = TColors.dark.withOpacity(0.5);
    final Color textColor = TColors.dark.withOpacity(0.5);

    // If it's a tappable container
    if (onTap != null && onChanged == null) {
      return Padding(
        padding: padding,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: TDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: showBackground ? forcedBgColor : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: TColors.grey) : null,
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // If it's an input TextField
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(icon, color: iconColor),
          filled: showBackground,
          fillColor: forcedBgColor,
          border: showBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  borderSide: BorderSide(color: TColors.grey),
                )
              : InputBorder.none,
          contentPadding: const EdgeInsets.all(TSizes.md),
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final dark = THelperFunctions.isDarkMode(context);


  //     // If onTap is provided and onChanged is null, show a tappable container
  //     if (onTap != null && onChanged == null) {
  //       return Padding(
  //         padding: padding,
  //         child: GestureDetector(
  //           onTap: onTap,
  //           child: Container(
  //             width: TDeviceUtils.getScreenWidth(context),
  //             padding: const EdgeInsets.all(TSizes.md),
  //             decoration: BoxDecoration(
  //               color: showBackground ? (dark ? TColors.dark : TColors.light) : Colors.transparent,
  //               borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
  //               border: showBorder ? Border.all(color: TColors.grey) : null,
  //             ),
  //             child: Row(
  //               children: [
  //                 Icon(icon, color: TColors.darkerGrey),
  //                 const SizedBox(width: TSizes.spaceBtwItems),
  //                 Text(text, style: Theme.of(context).textTheme.bodySmall),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   return Padding(
  //     padding: padding,
  //     child: TextField(
  //       controller: controller,
  //       onChanged: onChanged,
  //       decoration: InputDecoration(
  //         hintText: text,
  //         prefixIcon: Icon(icon, color: TColors.darkerGrey),
  //         filled: showBackground,
  //         fillColor: showBackground ? (dark ? TColors.dark : TColors.light) : Colors.transparent,
  //         border: showBorder
  //             ? OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
  //                 borderSide: BorderSide(color: TColors.grey),
  //               )
  //             : InputBorder.none,
  //         contentPadding: const EdgeInsets.all(TSizes.md),
  //       ),
  //     ),
  //   );
  // }
}