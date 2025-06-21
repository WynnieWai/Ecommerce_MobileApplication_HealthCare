import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/shimmers/shimmer.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';



class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding= TSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
     width:width,
     height:height,
     padding: EdgeInsets.all(padding),
     decoration: BoxDecoration(
        color: backgroundColor??(THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
    
    ),// BoxDecoration
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Center(
        child: isNetworkImage
          ? CachedNetworkImage(
              fit: fit, 
              imageUrl: image,
              progressIndicatorBuilder:(context, url, downloadProgress) => 
                const TShimmerEffect(width: 55, height: 55, radius: 55),
              errorWidget: (context, url, error) {
                print('Error loading image: $url');
                return const Icon(Icons.error);
              },
            )
          : Image(
              fit: fit,
              image: AssetImage(image),
              color: overlayColor,
            ), 
        ), 
      ),
    );
  }
}
