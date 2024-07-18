import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class pets extends StatefulWidget {
  @override
  State<pets> createState() => _petsState();
}

class _petsState extends State<pets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pets Information')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('pets').snapshots(),
            builder: (context, petsnapshot) {
              if (petsnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                final petDocs = petsnapshot.data!.docs;
                return ListView.builder(
                  itemBuilder: ((context, index) {
                    return Card(
                      elevation: 5,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: ListTile(
                        title: Text(petDocs[index]['name']),
                        subtitle: Text(petDocs[index]['animal']),
                      ),
                    );
                  }),
                  itemCount: petDocs.length,
                );
              }
            }),
      ),
    );
  }
}
