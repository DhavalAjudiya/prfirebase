import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prfirebase/constant/const.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:prfirebase/screen/user_list_screen.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  File? _image;

  final picker = ImagePicker();

  /// get image from gallery
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imageCache!.clear();
      } else {
        print("no Image selected");
      }
    });
  }

  /// clear image field
  clearImage() {
    setState(() {
      print("remove:$_image");
      _image = null;
    });
  }

  /// upload image firebase storage
  Future<String?> uploadFile(File file, String filename) async {
    print("File path:${file.path}");
    try {
      var response =
          await kFirebaseStorage.ref("user_image/$filename").putFile(file);
      return response.storage.ref("user_image/$filename").getDownloadURL();
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }
  }

  /// add data in firebase cloud
  Future<void> addData(
      {String? userName,
      String? email,
      File? image,
      BuildContext? context}) async {
    String? imageUrl = await uploadFile(image!, '$userName.jpg');
    print("image url: $imageUrl");

    userData.add({"name": userName, "email": email, "image": imageUrl}).then(
        (value) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text("${_name.text} is added")));
      _name.clear();
      _email.clear();
      clearImage();
    }).catchError((e) {
      ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(content: Text("${_name.text} is not added $e")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("firebase storage"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return UserList();
                    }),
                  );
                },
                child: Icon(Icons.person)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: ClipOval(
                    child: _image == null
                        ? Image.network(
                            "https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png",
                            fit: BoxFit.fill,
                          )
                        : Image.file(_image!)),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Icon(Icons.camera_alt_rounded)),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )),
              SizedBox(
                height: 20,
              ),
              //UploadImage(),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  //addData(userName: userNametxt.text,email: emailtxt.text,image: _image,context:context);

                  if (_name.text != "" && _email.text != "" && _image != null) {
                    addData(
                        userName: _name.text,
                        email: _email.text,
                        image: _image,
                        context: context);
                  } else {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text("Some Field are blank"),
                            content:
                                Text("please enter username,email or profile"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  child: Text("Ok"))
                            ],
                          );
                        });
                  }
                  print(_name.text);
                  print(_email.text);
                  print(_image);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
