import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key,
    required this.width ,
    this.heigth = 125,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
    this.borderRaidus=20}) : super(key: key);

  final double width ;
  final double heigth;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final double borderRaidus;
  @override
  Widget build(BuildContext context){
    return    Container(
      height: heigth,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(imageUrl),
              fit: BoxFit.cover
          )
      ),
      child: child,
    );
  }



}