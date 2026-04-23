import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learingsqlflite/View/EmpthyScreen.dart';
import 'package:learingsqlflite/View/FloatingActionButton.dart';
import 'package:learingsqlflite/View/addUsersScreen.dart';
import 'package:learingsqlflite/helper/DataBaseHelper.dart';

import '../Models/UserModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel>users=[];
  @override
  void initState() {
    super.initState();
    _getAllusers();
  }
  Future<void>_getAllusers()async{
    final user= await DatabaseHelper.instance.getAllUsers();
    setState(() {
      users = user;
    });
  }
  Future<void>_deleteUser(UserModel user)async{
    if(user.id !=null){
     await DatabaseHelper.instance.DeleteUser(user);
    }
    _getAllusers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: users.isEmpty ? Empthyscreen(): ListView.separated(itemBuilder: (context,index)=> BuildUserCard(users[index]), separatorBuilder: (context,index)=> SizedBox(height: 10,), itemCount: users.length),
      floatingActionButton: CustomFloatingactionbutton(onPress: ()async {
        await showModalBottomSheet(context: context, builder: (context)=> Addusersscreen(),
        );
        _getAllusers();
      }),
    );
  }
  Widget BuildUserCard(UserModel user){
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
    ),child: Column(
      children: [
        if(user.Image != null) CircleAvatar(
          radius: 100,
          backgroundImage: FileImage(File(user.Image)),
        ),
        SizedBox(height: 10,),
        Text(user.phone,style: TextStyle(color: Colors.white),),
        SizedBox(height: 10,),
        Text(user.Name,style: TextStyle(color: Colors.white),),
        SizedBox(height: 10,),
        Text(user.phone,style: TextStyle(color: Colors.white),),
        SizedBox(height: 10,),
        Text(user.phone,style: TextStyle(color: Colors.white),),
        SizedBox(height: 10,),
        Text(user.Email,style: TextStyle(color: Colors.white),),
        SizedBox(
            width: 400,
            child: IconButton(onPressed: (){
          _deleteUser(user);
        }, icon: Icon(Icons.delete,color: Colors.red,)))
      ],
    ),
    );
  }
}
