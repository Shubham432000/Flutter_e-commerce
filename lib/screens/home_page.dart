import 'package:e_commerce/screens/app_bar.dart';
import 'package:e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/dummy_products.dart';

class HomePage extends StatefulWidget {
  final Function(dynamic) addToItem;
  HomePage({required this.addToItem});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("home"),
        ),
        body: ListView(
          children: dummyProducts.map((product) {
            return Card(
                child: InkWell(
              onTap: () {
                // Handle product tap, navigate to product details screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                        productid: product["id"], addToItem: widget.addToItem),
                  ),
                );
              },
              // margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Name: ${product['name']}'),
                    subtitle: Text('ID: ${product['id']}'),
                    leading: Image.network(
                      product['imageUrl'],
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Price: \$${product['price']}'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Description: ${product['description']}'),
                  ),
                ],
              ),
            ));
          }).toList(),
        ));
  }
}
