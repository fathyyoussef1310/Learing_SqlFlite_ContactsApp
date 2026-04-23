import 'package:flutter/cupertino.dart';

import '../Core/TableColumns.dart';

class UserModel{
  final String Name;
  final String phone;
  final int id;
  final String Email;
  final String Image;
  UserModel({required this.Name,required this.Email,required this.id, required this.phone, required this.Image});
 Map<String,dynamic>toJson(){
   return {
     IdColumn:id,
     NameColumn:Name,
     EmailColumn:Email,
     PhoneColumn:phone,
     ImageColumn:Image,
   };
   }
   factory UserModel.fromJson(Map<String,dynamic>json){
   return UserModel(Name: json[NameColumn], Email: json[EmailColumn], id: json[IdColumn], phone: json[PhoneColumn], Image: json[ImageColumn]);
 }
}