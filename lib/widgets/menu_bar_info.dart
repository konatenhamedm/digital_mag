import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _MenuBarInfo extends StatelessWidget {
  const _MenuBarInfo({
    Key? key, required this.nom, required this.profession,
  }) : super(key: key);
  final String nom,profession;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  const CircleAvatar(
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),

      ),
      title: Text(nom,
        style: const TextStyle(color: Colors.white ),),
      subtitle: Text(profession,style: const TextStyle(color: Colors.white )),
    );
  }
}
