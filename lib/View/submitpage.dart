import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prfirebase/constant/const.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("RESUME"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screen.height * 1,
              width: screen.width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/c.jpg"),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: StreamBuilder<QuerySnapshot>(
                  stream: userDataCollection.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<DocumentSnapshot> docs = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 30, left: 110),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name : ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      Text(
                                        '${docs[index].get('name')}',
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 20,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Email : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      '${docs[index].get('email')}',
                                      style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screen.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Address : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      '${docs[index].get('address')}',
                                      style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screen.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'PhoneNumber : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      '${docs[index].get('phone')}',
                                      style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screen.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Education : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      '${docs[index].get('education')}',
                                      style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screen.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Skill : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      '${docs[index].get('skill')}',
                                      style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screen.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Massage : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      '${docs[index].get('massage')}',
                                      style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
