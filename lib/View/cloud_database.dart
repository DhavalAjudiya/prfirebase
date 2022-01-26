import 'package:flutter/material.dart';
import 'package:prfirebase/View/submitpage.dart';
import 'package:prfirebase/constant/const.dart';

class CloudDatabase extends StatelessWidget {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _phone = TextEditingController();
  final _education = TextEditingController();
  final _skill = TextEditingController();
  final _massage = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('cloud firestore'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/img/c.jpg")),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 130, right: 5, bottom: 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            cursorHeight: 20,
                            style: TextStyle(color: Colors.amber),
                            controller: _name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.pinkAccent,
                                size: 30,
                              ),
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.orange)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.orange)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screen.height * 0.02,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* required";
                            }
                          },
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          style: TextStyle(color: Colors.amber),
                          controller: _email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                          ),
                        ),
                        SizedBox(
                          height: screen.height * 0.02,
                        ),
                        TextFormField(
                          maxLines: 2,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* required";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          style: TextStyle(color: Colors.amber),
                          controller: _address,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.note,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            labelText: "Address",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                          ),
                        ),
                        SizedBox(
                          height: screen.height * 0.02,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* required";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          style: TextStyle(color: Colors.amber),
                          controller: _phone,
                          decoration: InputDecoration(
                            prefix: Text("(+91)"),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            labelText: "Phone Number",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            // counter: TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => (),
                            //         ));
                            //   },
                            //   child: Text(
                            //     "Forget Password",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 15,
                            //       letterSpacing: 1,
                            //     ),
                            //   ),
                          ),
                        ),
                        SizedBox(
                          height: screen.height * 0.02,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* required";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          style: TextStyle(color: Colors.amber),
                          controller: _education,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.school,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            labelText: "Education",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            // counter: TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => (),
                            //         ));
                            //   },
                            //   child: Text(
                            //     "Forget Password",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 15,
                            //       letterSpacing: 1,
                            //     ),
                            //   ),
                          ),
                        ),
                        SizedBox(
                          height: screen.height * 0.02,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* required";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          style: TextStyle(color: Colors.amber),
                          controller: _skill,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.menu_book,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            labelText: "Skill",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            // counter: TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => (),
                            //         ));
                            //   },
                            //   child: Text(
                            //     "Forget Password",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 15,
                            //       letterSpacing: 1,
                            //     ),
                            //   ),
                          ),
                        ),
                        SizedBox(
                          height: screen.height * 0.02,
                        ),
                        TextFormField(
                          maxLines: 5,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* required";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          style: TextStyle(color: Colors.amber),
                          controller: _massage,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.message,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            labelText: "Massage",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            // counter: TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => (),
                            //         ));
                            //   },
                            //   child: Text(
                            //     "Forget Password",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 15,
                            //       letterSpacing: 1,
                            //     ),
                            //   ),
                          ),
                        ),
                        SizedBox(
                          height: screen.height * 0.03,
                        ),
                        RaisedButton(
                            splashColor: Colors.orange,
                            color: Colors.purpleAccent,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                userDataCollection
                                    .add({
                                      'name': _name.text,
                                      'email': _email.text,
                                      'address': _address.text,
                                      'phone': _phone.text,
                                      'education': _education.text,
                                      'skill': _skill.text,
                                      'massage': _massage.text,
                                    })
                                    .then((value) => print('add success'))
                                    .catchError(
                                      (e) => print('add error ===>>>$e}'),
                                    );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubmitPage(),
                                    ));
                              }
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Form(
      //   key: _formKey,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Column(
      //       children: [
      //         TextFormField(
      //           textInputAction: TextInputAction.next,
      //           controller: _name,
      //           validator: (value) {
      //             if (value!.isEmpty) {
      //               return '* required';
      //             } else {
      //               return null;
      //             }
      //           },
      //           decoration: InputDecoration(hintText: 'name'),
      //         ),
      //         TextFormField(
      //           controller: _address,
      //           validator: (value) {
      //             if (value!.isEmpty) {
      //               return '* required';
      //             } else {
      //               return null;
      //             }
      //           },
      //           decoration: InputDecoration(hintText: 'address'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             if (_formKey.currentState!.validate()) {
      //               userDataCollection
      //                   .add({'name': _name.text, 'address': _address.text})
      //                   .then((value) => print('add success'))
      //                   .catchError(
      //                     (e) => print('add error ===>>>$e}'),
      //                   );
      //             }
      //           },
      //           child: Text('Add'),
      //         ),
      //         Expanded(
      //           child: StreamBuilder<QuerySnapshot>(
      //             stream: userDataCollection.snapshots(),
      //             builder: (context, snapshot) {
      //               if (!snapshot.hasData) {
      //                 return Center(
      //                   child: CircularProgressIndicator(),
      //                 );
      //               } else {
      //                 List<DocumentSnapshot> docs = snapshot.data!.docs;
      //                 return ListView.builder(
      //                   itemCount: docs.length,
      //                   itemBuilder: (context, index) {
      //                     return Column(
      //                       children: [
      //                         Row(
      //                           children: [
      //                             Column(
      //                               children: [
      //                                 Text('${docs[index].get('name')}'),
      //                                 Text('${docs[index].get('address')}'),
      //                               ],
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                             ),
      //                             Spacer(),
      //                             IconButton(
      //                                 onPressed: () {
      //                                   userDataCollection
      //                                       .doc(docs[index].id)
      //                                       .update({
      //                                         'address': _address.text,
      //                                         "name": _name.text
      //                                       })
      //                                       .then((value) =>
      //                                           print('update success'))
      //                                       .catchError(
      //                                         (e) =>
      //                                             print('update error==>>$e'),
      //                                       );
      //                                 },
      //                                 icon: Icon(Icons.add)),
      //                             IconButton(
      //                                 onPressed: () {
      //                                   userDataCollection
      //                                       .doc(docs[index].id)
      //                                       .delete()
      //                                       .then((value) =>
      //                                           print("delete success"))
      //                                       .catchError((e) => print("$e"));
      //                                 },
      //                                 icon: Icon(Icons.delete)),
      //                           ],
      //                         ),
      //                         // ListTile(
      //                         //   trailing: IconButton(
      //                         //     onPressed: () {
      //                         //       userDataCollection
      //                         //           .doc(docs[index].id)
      //                         //           .update({'address': _address.text})
      //                         //           .then(
      //                         //               (value) => print('update success'))
      //                         //           .catchError(
      //                         //             (e) => print('update error==>>$e'),
      //                         //           );
      //                         //
      //                         //       // userDataCollection
      //                         //       //     .doc(docs[index].id)
      //                         //       //     .delete()
      //                         //       //     .then((value) => print('delete success'))
      //                         //       //     .catchError(
      //                         //       //       (e) => print('delete error==>>$e'),
      //                         //       //     );
      //                         //     },
      //                         //     icon: Icon(Icons.edit),
      //                         //   ),
      //                         //   title: Text('${docs[index].get('name')}'),
      //                         //   subtitle: Text('${docs[index].get('address')}'),
      //                         // ),
      //                       ],
      //                     );
      //                   },
      //                 );
      //               }
      //             },
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
