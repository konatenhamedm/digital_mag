import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressHud extends StatelessWidget {

  final Widget child;
  final bool inasyncCall;
  final double opacity;
  final Color? color;
  final Animation<Color>?  valueColor;

  const ProgressHud({Key? key,
    required this.child,
    required this.inasyncCall,
     this.opacity = 0.3,
     this.color = Colors.grey,
     this.valueColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList =  <Widget>[];

    widgetList.add(child);
    if(inasyncCall){
      final modal = Stack(
      children: [
        Opacity(opacity: opacity,
        child: ModalBarrier(dismissible: false,color: color,),
        ),
       const  Center(
          child: CircularProgressIndicator(),
        ),
      ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,

    );
  }
}
