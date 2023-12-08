import 'package:flutter/material.dart';

class YourProductWidget extends StatelessWidget {
  final dynamic product2;

  YourProductWidget({required this.product2});

  @override
  Widget build(BuildContext context) {
    // Customize this widget based on how you want to display each product
    return Card(
      child: ListTile(
        title: Text(product2['name']),
        subtitle: Text('Price: ${product2['price']}'),
        // Add more details or customize as needed
      ),
    );
  }
}
