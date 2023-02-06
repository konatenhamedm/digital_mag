
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecouvreAppBar extends StatelessWidget {
  const DecouvreAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset("assets/images/1.jpg",fit:BoxFit.cover),
      ),
      leading: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.arrow_back,color:Colors.black),
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.share,color: Colors.black),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.search,color: Colors.black,),
          ),
        ),
      ],
    );
  }
}
