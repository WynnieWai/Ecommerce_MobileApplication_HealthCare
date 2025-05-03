import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/device/device_utility.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget{

  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color:dark? TColors.black : TColors.white,
      child:TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor:TColors.primary,
        labelColor: dark? TColors.white :TColors.primary,
        unselectedLabelColor: TColors.darkerGrey,
        ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}