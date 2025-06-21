import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget{
  const TProductTitleText({
    super.key,
    required this.title,
    this.smallSize=false,
    this.maxLines=2,
    this.textAlign=TextAlign.left, 
    // TextStyle? style,
    this.style,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context){
    return Text(
      title,
      style: style ??
        (smallSize 
          ? Theme.of(context).textTheme.labelLarge 
          : Theme.of(context).textTheme.titleSmall),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}