import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserOrderHistory extends StatelessWidget {
  final String userId;

  const UserOrderHistory({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Миний захиалгын түүх'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('AllowedOrders')
            .where('userID', isEqualTo: userId)
            .where('status', isEqualTo: 'Allowed')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No pending orders found.'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> orderData = document.data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(orderData['productImage']),
                ),
                title: Text('Order ID: ${document.id}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Бүтээгдэхүүний нэр: ${orderData['productName']}'),
                    Text('Quantity: ${orderData['quantity']}'),
                    Text('Status: ${orderData['status']}'),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}