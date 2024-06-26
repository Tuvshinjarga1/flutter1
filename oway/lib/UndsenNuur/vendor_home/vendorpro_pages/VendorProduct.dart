import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorProduct extends StatelessWidget {
  final String vendorId;

  VendorProduct({required this.vendorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Миний бүтээгдэхүүнүүд'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('VendorProduct')
            .where('Vendorid', isEqualTo: vendorId)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('Танд бүтээгдэхүүн одоогоор байхгүй байна.'),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              var data = document.data() as Map<String, dynamic>;

              // Display your data here
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data['Бүтээгдэхүүний зураг']),
                ),
                title: Text('Ангилал: ${data['Ангилал']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Бүтээгдэхүүний нэр: ${data['Нэр']}'),
                    Text('Тоо ширхэг: ${data['Тоо ширхэг']}'),
                    Text('Үнэ: ${data['Үнэ']}'),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                Divider(), // Add a divider between items
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}


