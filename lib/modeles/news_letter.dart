import 'dart:convert';

NewsLetter  NewsLetterFromJson(Map<String, dynamic> json)=>
    NewsLetter.fromJson(json);

NewsLetter  NewsLetterFromJsonVide(Map<String, dynamic> json)=>
    NewsLetter.fromJsonVide(json);


class NewsLetter{
  bool? success;
  int? statutCode;
  String? code;
  String? message;


  NewsLetter(
      {
        this.success,
        this.statutCode,
        this.code,
        this.message,

      }
      );

  NewsLetter.fromJson(Map<String , dynamic> json){
    success = json['success'];
    statutCode = json['statutCode'];
    code = json['code'];
    message = json['message'];

  }

  NewsLetter.fromJsonVide(Map<String , dynamic> json){
    success = json['success'];
    statutCode = json['statutCode'];
    code = json['code'];
    message = json['message'];
  }

  Map<String ,dynamic> toJson(){
    final Map<String , dynamic> data = <String , dynamic>{};
    data['success'] = this.success;
    data['statutCode'] = this.statutCode;
    data['code'] = this.code;
    data['message'] = this.message;

    return data;
  }
}

