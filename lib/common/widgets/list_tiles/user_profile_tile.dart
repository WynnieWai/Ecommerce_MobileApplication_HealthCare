
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/utils/constants/colors.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: TCircularImage(image:TImages.user,width:50,height:50,padding:0),
      title:Text('Coding with T',style: Theme.of(context).textTheme.headlineSmall!.apply(color:TColors.white)),
      subtitle: Text('SWE2209xxx@xmu.edu.my',style:Theme.of(context).textTheme.bodyMedium!.apply(color:TColors.white)),
      trailing: IconButton(onPressed: (){},icon: const Icon(Iconsax.edit,color:TColors.white)),
    );
  }
}