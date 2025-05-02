import 'package:flutter/material.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget{
  const TRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius=true,
    required this.imageUrl,
    this.fit=BoxFit.contain,
    this.backgroundColor=TColors.light,
    this.isNetworkImage=false,
    this.borderRadius=TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:onPressed,

    );
  }
}