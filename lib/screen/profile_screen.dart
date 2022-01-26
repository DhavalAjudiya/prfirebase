import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:prfirebase/constant/const.dart';

class ProfileScreen extends StatelessWidget {
  final String? docId;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  ProfileScreen({Key? key, this.docId}) : super(key: key);

  Future fetchUser() async {
    // print(await userData.doc('DAsoPoFjaMeQN2pMIBZv').get());

    var userDoc = await userData.doc(docId).get();
    Map<String, dynamic> user = userDoc.data() as Map<String, dynamic>;

    print('**********************$user');
    //return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await fetchUser();
            },
            child: Text('Get'),
          ),
        ],
      ),
    );
  }
}
