import 'package:digital_mag/services/api_service.dart';
import 'package:digital_mag/vues/formulaires/inscription.dart';
import 'package:digital_mag/vues/formulaires/progress_hud.dart';
import 'package:digital_mag/vues/home.dart';
import 'package:digital_mag/widgets/form-helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Newsletter extends StatefulWidget {
  const Newsletter({Key? key}) : super(key: key);

  @override
  State<Newsletter> createState() => _NewsletterState();
}

class _NewsletterState extends State<Newsletter> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _email = "";
  String _nom= "";

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
        child: _NewsletterUISetup(context),
      ) ,
    ));
  }

  Widget _NewsletterUISetup(BuildContext context){
    return  SingleChildScrollView(
     child: Container(
       child: Form(
         key: globalFormKey,
           child:_NewsletterUI(context),
       ),
     ),
    );
  }

  Widget _NewsletterUI(BuildContext context){
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
              "Souscrivez à notre newsletter",
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
              "email",
              "Entrez votre email",
              (onValidateVal){
              if(onValidateVal.isEmpty){
                return 'L\'email ne peut être vide';
              }
              return null;
              },
              (onSavedVal){
                _email = onSavedVal.toString().trim();
              },
             // suffixIcon: suffixIcon
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20,top: 20),
          child: FormHelper.inputFieldWidget(
            context,
            const Icon(Icons.verified_user),
            "nom",
            "Entrez votre nom",
                (onValidateVal){
              if(onValidateVal.isEmpty){
                return 'Le nom utilisateur ne peut être vide';
              }
              return null;
            },
                (onSavedVal){
              _email = onSavedVal.toString().trim();
            },
            // suffixIcon: suffixIcon
          ),
        ),
        const SizedBox(height: 20,),
        Center(
          child: FormHelper.saveButton(
              "Je m'inscrire", (){
              if(validatedSave()){
                setState(() {
                  isApiCall = true;
                });

                ApiService.login(_email, _nom).then((response){
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
                     builder:(context)=> const Home(isReload: true,totalRecords: 200),
                   ));
                 }else{
                   FormHelper.showMessage(
                       context, "Message", "L'email/nom utulisateur ne peux êtres vides",
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
                  "Je m'inscrire",
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
