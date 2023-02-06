import 'package:flutter/cupertino.dart';

class StyleTag extends StatelessWidget {
  const StyleTag ({Key? key,required this.backgroundColor,required this.children}) : super(key: key);
final Color backgroundColor;
final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: backgroundColor,borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min ,
        children: children,
      ),
    );
  }
}
