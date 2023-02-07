import 'package:digital_mag/vues/articles_par_categorie.dart';
import 'package:digital_mag/vues/love_article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/vues/userProfile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';
import '../controllers/posts_controller.dart';
import '../modeles/news_modele.dart';
import 'ecrans_export.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final PostsController postsController = Get.put(PostsController());
  List<NewsModele> article = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,() async{

     /* if(this.widget.isReload){*/

       final  article =  await postsController.carousselData();
      //}
      /* if(widget.isReload){
        await c.fetchPosts2(pageNumber: 1,totalRecords: widget.totalRecords,);
      }*/
      print(article.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final nom= "Konate";
    final email = "hamed@gmail.com";
    final urlImage = "assets/images/img.jpg";

    return Drawer(
      child: Material(
        color: Colors.black,
        child: ListView(
          //padding: padding,
          children: [
            buidlHeader(
              urlImage:urlImage,
              nom:nom,
              email:email,
              onClicked:()=>  Navigator.of(context).push(MaterialPageRoute(
                builder:(context)=> UserProfile(
                  nom:nom,
                  urlImage:urlImage,
                ),
              )),
            ),
            const Divider(color: Colors.white70,),
            buildMenuItem(
              text:"Abonnez-vous ici",
              icon:Icons.unsubscribe,
              onClicked: ()=>selectedItem(context,0),
            ),
            buildMenuItem(
              text:"Historiques",
              icon:Icons.history,
              onClicked: ()=>selectedItem(context,1),
            ),
            buildMenuItem(
              text:"Articles favories",
              icon:Icons.favorite,
              onClicked: ()=>selectedItem(context,2),
            ),
            buildMenuItem(
              text:"Lire plus tard",
              icon:Icons.book_rounded,
              onClicked: ()=>selectedItem(context,3),
            ),
            const Divider(color: Colors.white70,),
           // const SizedBox(height: 24,),
            const SizedBox(height: 5,),
            buildMenuItem(
              text:"Actu-IT",//4
              icon:Icons.new_releases,
              onClicked: ()=>selectedItem(context,4),
            ),
            buildMenuItem(
              text:"Decryptages",//11
              icon:Icons.network_cell,
              onClicked: ()=>selectedItem(context,5),
            ),
            buildMenuItem(
              text:"Interviews",
              icon:Icons.people,
              onClicked: ()=>selectedItem(context,6),
            ),
            buildMenuItem(
              text:"Plus",
              icon:Icons.new_releases_sharp,
              onClicked: ()=>selectedItem(context,7),
            ),

            const Divider(color: Colors.white70,),
            buildMenuItem(
              text:"Parametres",
              icon:Icons.settings,
              onClicked: ()=>selectedItem(context,8),
            ),
            buildMenuItem(
              text:"Partage",
              icon:Icons.share,
              onClicked: ()=>selectedItem(context,9),
            ),
            const Divider(color: Colors.white70,),
            const SizedBox(height: 5,),
            buildMenuItem(
              text:"Se connecter",
              icon:Icons.login_outlined,
              onClicked: ()=>selectedItem(context,10),
            ),
            const Divider(color: Colors.white70,),

          ],
        ),
      ),
    );
  }
  Widget buidlHeader(
  {
  required String urlImage,
  required String nom,
  required String email,
  required VoidCallback onClicked,
})=>InkWell(
    onTap: onClicked,
    child: Container(
      padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
      child: Row(
        children:  [
          const CircleAvatar(radius: 30,backgroundImage: AssetImage("assets/images/img.jpg"),),
       const  SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nom,
                style: const TextStyle(fontSize: 20,color: Colors.white),
              ),
              const SizedBox(height: 4,),
              Text(
                email,
                style: const TextStyle(fontSize: 14,color: Colors.white),
              ),
            ],
          ),
          Spacer(),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Color.fromRGBO(30,60,168,1),
          child:  Icon(Icons.add_comment_outlined,color: Colors.white,),
          )

        ],
      ),
    ),
  );

  Widget buildMenuItem({
  required String text,
    required IconData icon,
    VoidCallback? onClicked,
}){
    const  color = Colors.white;
    const hoverColor = Colors.purpleAccent;
    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(text,style: const TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
}

void selectedItem(BuildContext context, int index){
   Navigator.of(context).pop();//il permet de retourner sur la page anterieur
    switch(index){
      case 4:
     /*   Navigator.pushNamed(context,
          ArticlesParCategorie.routeName,
          arguments: 48,
        );*/
    Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=> const ArticlesParCategorie(isReload: true, categorieId: 4,),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=> const ArticlesParCategorie(isReload: true, categorieId: 17),
        ));
        break;
      case 9:
            Share.share("https://www.digital-mag.ci/");
            break;
      case 7:

        Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=> const LoveArticle(),
        ));
        break;
    }
}
}
