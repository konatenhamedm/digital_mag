import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:digital_mag/vues/menu_option.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}
class MenuOptions{

  static const home =  MenuOption(icon: Icons.home, titre: "Accueil");
  static const ActuIt = MenuOption(icon: Icons.newspaper, titre: "Actu-it");
  static const Telecom = MenuOption(icon: Icons.network_cell, titre: "Telecom");
  static const FinTech = MenuOption(icon: Icons.app_blocking, titre: "FinTech");
  static const Startups = MenuOption(icon: Icons.people, titre: "Startups");
  static const Interviews = MenuOption(icon: Icons.speaker, titre: "Interviews");
  static const Mobile = MenuOption(icon: Icons.mobile_off_outlined, titre: "Mobile");
  static const Decryptage = MenuOption(icon: Icons.accessibility, titre: "Decryptage");
  static const DmTv = MenuOption(icon: Icons.tv, titre: "DmTv");
  static const EventsTics = MenuOption(icon: Icons.event, titre: "EventsTics");
  static const Logout = MenuOption(icon: Icons.logout, titre: "Deconnexion");

  static const allOptions = [
    home,
    ActuIt,
    Telecom,
    FinTech,
    Startups,
    Interviews,
    Mobile,
    Decryptage,
    DmTv,
    EventsTics,
    Logout,


  ];
}
class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(

        children: [
          Padding(padding: const EdgeInsets.all(5.0),

            child: InkWell(

              onTap: (){
                ZoomDrawer.of(context)!.close();

              },
              child: const Icon(Icons.close,
              color: Colors.white,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(20.0),
          child: Row(
            children:  [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
              ),
             const SizedBox(height: 20,),
             Column(
               children: const [
               Text(
                   "Konate",
                   style:TextStyle(
                     fontSize:18,
                     color: Colors.white
                   )
               ),
                 Text(
                     " Hamed",
                     style:TextStyle(
                         fontSize:18,
                         color: Colors.white,
                         fontWeight:FontWeight.bold
                     )
                 )
               ]
             )
            ],
          ),
          ),
          ...MenuOptions.allOptions.map(optionsList).toList()
        ],
      ),
    );
  }
  Widget optionsList(MenuOption item){
    return SingleChildScrollView(
      child: InkWell(
        onTap: (){
          print("ok ok");
        },
        child: ListTile(
          leading: Icon(
            item.icon,
            color: Colors.white,
          ),
          title: Text(item.titre.toString(),
         style: const TextStyle(
           color: Colors.white,
               fontSize:20,
           fontWeight: FontWeight.bold
         ),
          ),
          minLeadingWidth: 10,
        ),
      ),
    );
  }
}
