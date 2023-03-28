import 'package:digital_mag/controllers/user_login_controller.dart';
import 'package:digital_mag/vues/articles_par_categorie.dart';
import 'package:digital_mag/vues/formulaires/login.dart';
import 'package:digital_mag/vues/formulaires/newsletter.dart';
import 'package:digital_mag/vues/love_article.dart';
import 'package:digital_mag/vues/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/vues/userProfile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';
import '../controllers/posts_controller.dart';
import '../modeles/news_modele.dart';
import '../services/share_service.dart';
import 'ecrans_export.dart';

class ManuDrawerLogout extends StatefulWidget {
  const ManuDrawerLogout({Key? key}) : super(key: key);

  @override
  State<ManuDrawerLogout> createState() => _ManuDrawerLogoutState();
}

class _ManuDrawerLogoutState extends State<ManuDrawerLogout> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final UserLoginController userLoginController = Get.put(UserLoginController());
  final PostsController c = Get.put(PostsController());
  List<NewsModele> article = [];
  var _result;
  @override
  void initState() {
    getArticles();
    // TODO: implement initState
    super.initState();
print(" DRAWWWWWW ${userLoginController.isTrue.value}");
  }

  getArticles() async{

    WidgetsFlutterBinding.ensureInitialized();
    _result = await ShareService.islLogin();

    print("YAPIIIIIIIII ${_result}");
  }

  @override
  Widget build(BuildContext context) {
    final nom= "Konate";
    final email = "hamed@gmail.com";
    final urlImage = "assets/images/img.jpg";

    return  Obx((){
      if(c.isLoading.value == true){
        return Center(
          child: CircularProgressIndicator(),
        );
      }else{
        return  Drawer(
          elevation: 15.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 120,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.lime),
                  child: Text('DIGITAL-MAG'),
                ),
              ),

              // buidlHeader(
              //   urlImage:urlImage,
              //   nom:nom,
              //   email:email,
              //   onClicked:()=>  Navigator.of(context).push(MaterialPageRoute(
              //     builder:(context)=> UserProfile(
              //       nom:nom,
              //       urlImage:urlImage,
              //     ),
              //   )),
              // ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.lime, Colors.purple])),
                  child: ListView(
                    //padding: padding,
                    children: [

                      //const Divider(color: Colors.white70,),
                      buildMenuItem(
                        text:"Notre newsletter",
                        icon:Icons.unsubscribe,
                        onClicked: ()=>selectedItem(context,0),
                      ),

                       buildMenuItem(
                        text: "Se connecter",
                        icon: Icons.login_rounded,
                        onClicked: ()=>selectedItem(context,10),
                      ),
                      Container(
                        //padding: const EdgeInsets.all(1),
                        //margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child:const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("RUBRIQUES"
                              ,style:  TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
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
                        text:"Decryptage",//11
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
                        icon:Icons.add_box,
                        onClicked: ()=>selectedItem(context,7),
                      ),
                      Container(
                        //padding: const EdgeInsets.all(1),
                        //margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("PARAMETRES"
                              ,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
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
                      Container(
                        //padding: const EdgeInsets.all(1),
                        //margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("A PROPOS DE NOUS"
                              ,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white70,),
                      buildMenuItem(
                        text:"Aide",
                        icon:Icons.settings,
                        onClicked: ()=>selectedItem(context,8),
                      ),
                      buildMenuItem(
                        text:"Partage",
                        icon:Icons.share,
                        onClicked: ()=>selectedItem(context,9),
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }

    });

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
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=> const Newsletter(),
        ));
        break;

      case 4:
     /*   Navigator.pushNamed(context,
          ArticlesParCategorie.routeName,
          arguments: 48,
        );*/
    Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=>  const ArticlesParcategorie(isReload: true, categoryId: 4, totalRecords: 200,),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=> const ArticlesParcategorie(isReload: true, categoryId: 11, totalRecords: 200,),
        ));
        break;

      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=> const ArticlesParcategorie(isReload: true, categoryId: 12, totalRecords: 200,),
        ));
        break;
      case 10:
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=> const Login(),
        ));
        break;
      case 22:
        ShareService.logout();

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
