import 'package:digital_mag/services/api_service.dart';
import 'package:digital_mag/vues/formulaires/login.dart';
import 'package:digital_mag/vues/formulaires/progress_hud.dart';
import 'package:digital_mag/vues/home.dart';
import 'package:digital_mag/widgets/form-helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _username = "";
  String _email = " ";
  String _pwd = "";
  bool hidePassword = true;
  bool isApiCall = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Digital Mag",style: TextStyle(
              color: Colors.black
          ),),
        ),
      ),
      key: _scaffoldKey,
      body: ProgressHud(
        inasyncCall: isApiCall,
        opacity: 0.3,
        child: _InscriptionUISetup(context),
      ) ,
    ));
  }

  Widget _InscriptionUISetup(BuildContext context){
    return  SingleChildScrollView(
      child: Container(
        child: Form(
          key: globalFormKey,
          child:_InscriptionUI(context),
        ),
      ),
    );
  }

  Widget _InscriptionUI(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.8,
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

                child: Image.asset("assets/images/logo_mobile.png"),
              ),
              Spacer(),
            ],
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20,top: 30),
            child: Text(
              "Inscrivez-vous",
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
          padding: const EdgeInsets.only(bottom: 20,top: 20),
          child: FormHelper.inputFieldWidget(
            context,
            const Icon(Icons.verified_user),
            "email",
            "Email",
                (onValidateVal){
              if(onValidateVal.isEmpty){
                return 'L\adresse ne peut être vide';
              }
              return null;
            },
                (onSavedVal){
              _email= onSavedVal.toString().trim();
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
              "S'inscrire", (){
            if(validatedSave()){
              setState(() {
                isApiCall = true;
              });

              ApiService.inscription(_username, _pwd, _email).then((response){
                setState(() {
                  isApiCall = false;
                });
                if(response){
                  globalFormKey.currentState?.reset();
                  /*FormHelper.showMessage(
                       context, "Message", "valid",
                       "ok", (){

                   }) ;*/
                  Navigator.of(context).push(MaterialPageRoute(
                    builder:(context)=> const Login(),
                  ));
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
}
