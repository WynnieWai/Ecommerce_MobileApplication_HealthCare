import "package:flutter/material.dart";
import "package:testing_asg1/common/widgets/custom_shapes/containers/primary_header_container.dart";

class SettingScreen extends StatelessWidget{
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
          children:[
            TPrimaryHeaderContainer(
              child:Column(
                children:[
                  //TAppBar(title:Text('Account'),style:Theme.of(context).textTheme.headlineMedium!.apply(color:TColors.white)),
                ]
              )
            ),
          ]
        )
      )
    );
  }
}