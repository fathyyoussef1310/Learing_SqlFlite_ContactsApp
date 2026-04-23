import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learingsqlflite/Core/CustomTextFormField.dart';
import 'package:learingsqlflite/Models/UserModel.dart';
import 'package:learingsqlflite/helper/DataBaseHelper.dart';
class Addusersscreen extends StatefulWidget {
  const Addusersscreen({super.key});

  @override
  State<Addusersscreen> createState() => _AddusersscreenState();
}

class _AddusersscreenState extends State<Addusersscreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> getImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: getImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: image != null ? FileImage(image!) : null,
              ),
            ),
            const SizedBox(height: 10),
            Customtextformfield(
              controller: emailController,
              label: "Email",
              hint: "Enter Email",
              color: Colors.green,
            ),

            const SizedBox(height: 10),

            Customtextformfield(
              controller: nameController,
              label: "Name",
              hint: "Enter Name",
              color: Colors.green,
            ),

            const SizedBox(height: 10),

            Customtextformfield(
              controller: phoneController,
              label: "Phone",
              hint: "Enter Phone",
              color: Colors.green,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print("Pressed Save");

                if (nameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {

                  UserModel user = UserModel(
                    id: 0,
                    Name: nameController.text,
                    Email: emailController.text,
                    phone: phoneController.text,
                    Image: image?.path ?? "",
                  );
                  await DatabaseHelper.instance.addUser(user);
                  Navigator.pop(context, true);
                } else {
                  print("Validation failed");
                }
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}