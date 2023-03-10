import 'dart:convert';

LoginResponseModel  loginResponseModelFromJson(Map<String, dynamic> json)=>
    LoginResponseModel.fromJson(json);



class LoginResponseModel{
  bool? success;
  int? statutCode;
  String? code;
  String? message;
  Data? data ;

  LoginResponseModel(
  {
    this.success,
    this.statutCode,
    this.code,
    this.message,
    this.data
    }
      );

  LoginResponseModel.fromJson(Map<String , dynamic> json){
    success = json['success'];
    statutCode = json['statutCode'];
    code = json['code'];
    message = json['message'];
    data = json['data'].length > 0 ? Data.fromJson(json['data']) : null;
  }

  Map<String ,dynamic> toJson(){
 final Map<String , dynamic> data = <String , dynamic>{};
 data['success'] = this.success;
 data['statutCode'] = this.statutCode;
 data['code'] = this.code;
 data['message'] = this.message;
 if(data != null){
   data['data'] =  this.data;
 }
 return data;
  }
}

class Data {

 // String? toten;
  int? id;
  String? email;
  //String? nicename;
  //String? firstName;
  //String? lastName;
  //String? displayName;

  Data(
  {
    //this.toten,
    this.id,
    this.email,
    //this.nicename,
   // this.firstName,
    //this.lastName,
    //this.displayName
}
      );

  Data.fromJson(Map<String , dynamic> json){
    //toten = json['toten'];
    id = json['id'];
    email = json['email'];
   // nicename = json['nicename'];
    //firstName = json['firstName'];
    //lastName = json['lastName'];
    //displayName = json['displayName'];
  }

  Map<String ,dynamic> toJson(){
    final Map<String , dynamic> data = Map<String , dynamic>();
   /// data['toten'] = this.toten;
    data['id'] = this.id;
    data['email'] = this.email;
    //data['nicename'] = this.nicename;
    //data['firstName'] = this.firstName;
    //data['lastName'] = this.lastName;
    //data['displayName'] = this.displayName;

    return data;
  }
}