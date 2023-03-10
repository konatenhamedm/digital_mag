import 'package:digital_mag/services/api_service.dart';
import 'package:digital_mag/vues/formulaires/inscription.dart';
import 'package:digital_mag/vues/formulaires/progress_hud.dart';
import 'package:digital_mag/vues/home.dart';
import 'package:digital_mag/widgets/form-helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:core';

import '../splash.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _username = "";
  String _pwd = "";
  bool hidePassword = true;
  bool isApiCall = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text("Digital Mag",style: TextStyle(
            color: Colors.black
          ),),
        ),
      ),
        backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      body: ProgressHud(
        inasyncCall: isApiCall,
        opacity: 0.3,
        child: _loginUISetup(context),
      ) ,
    ));
  }

  Widget _loginUISetup(BuildContext context){
    return  SingleChildScrollView(
     child: Container(
       child: Form(
         key: globalFormKey,
           child:_loginUI(context),
       ),
     ),
    );
  }

  Widget _loginUI(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors: [
                Colors.purpleAccent,
                Colors.lime,
              ]
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150),
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,

                child:Image.asset("assets/images/logo_mobile.png")
              ),
              Spacer(),
            ],
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20,top: 30),
            child: Text(
              "Connectez-vous",
              style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20,top: 20),
          child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.verified_user),
              "username",
              "Username",
              (onValidateVal){
              if(onValidateVal.isEmpty){
                return 'Le nom utilisateur ne peut être vide';
              }
              return null;
              },
              (onSavedVal){
                _username = onSavedVal.toString().trim();
              },
             // suffixIcon: suffixIcon
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 19),
          child: FormHelper.inputFieldWidget(
            context,
           const  Icon(Icons.lock),
            "password",
            "Mot de passe",
                (onValidateVal){
                  if(onValidateVal.isEmpty){
                    return 'Le mot de passe ne peut être vide';
                  }

                  return null;
            },
                (onSavedVal){
              _pwd = onSavedVal.toString().trim();
                },
            initialValue: "",
            obscureText: hidePassword,
             suffixIcon: IconButton(
               onPressed:(){
                 setState((){
                   hidePassword = !hidePassword;
                 });
               }
               ,
               color: Colors.redAccent.withOpacity(0.4),
               icon: Icon(

                 hidePassword ? Icons.visibility_off : Icons.visibility
               ),
             ),
          ),
        ),
        const SizedBox(height: 20,),
        Center(
          child: FormHelper.saveButton(
              "Connexion", (){
              if(validatedSave()){
                setState(() {
                  isApiCall = true;
                });

                ApiService.login(_username, _pwd).then((response){
                  setState(() {
                    isApiCall = false;
                  });
                 if(response){
                   globalFormKey.currentState?.reset();
                   /*FormHelper.showMessage(
                       context, "Message", "valid",
                       "ok", (){

                   }) ;*/
                   Get.to(Splash());
                   /*Navigator.of(context).push(MaterialPageRoute(
                     builder:(context)=> const Splash(),
                   ));*/
                 }else{
                   FormHelper.showMessage(
                       context, "Message", "Le nom utilisateur/mot de passe incorrect(s)",
                       "Quitter", (){
                     Navigator.of(context).pop();
                   }) ;                }
                }) ;
              }
          }),
        ),
        const SizedBox(height: 12,),

               const Center(
                 child: Text('Avez vous un compte ?'
                   ,style: TextStyle(
                     color: Colors.blue,
                   ),
                 ),
               ),
        const SizedBox(height: 10,),
        Center(
          child: ButtonInscription()
        ),
      ],
    );
  }

  bool validatedSave(){
    final form = globalFormKey.currentState;
    if(form != null){
      if(form.validate()){
        form.save();
        return true;
      }
      return true;
    }
    return false;
  }

  Widget ButtonInscription(){
    return Container(
      height: 30,
      width: 150,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder:(context)=> const Inscription(),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20.0),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                  "S'inscrire",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
