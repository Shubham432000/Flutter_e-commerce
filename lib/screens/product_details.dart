import 'package:e_commerce/screens/cart.dart';
import 'package:e_commerce/screens/dummy_products.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/product.dart';

class ProductDetails extends StatefulWidget {
  final int productid;
  final Function(dynamic) addToItem;
  ProductDetails({Key? key, required this.productid, required this.addToItem})
      : super(key: key);
  @override
  State<ProductDetails> createState() => _ProductDetails();
}

// List<dynamic> items1 = [];

class _ProductDetails extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var filterProduct = dummyProducts
        .where((element) => element["id"] == widget.productid)
        .toList();
    print("${widget.productid} filterid");
    // print("$items1 items");

    // void addToItem(product) {
    //   setState(() {
    //     items1.add(product);
    //     // Cart();
    //   });
    // }
    // var _quantity = 0;
    // void _updateQuantity(int newQuantity) {
    //   setState(() {
    //     _quantity = newQuantity;
    //   });
    // }

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("product detials screen"),
        ),
        body: ListView(
          children: filterProduct.map((product) {
            return Container(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product['imageUrl'],
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          "Product Details",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text("Product ID: ${product["id"]}",
                            style: const TextStyle(fontSize: 18.0)),
                        const SizedBox(height: 10.0),
                        Text("Product Name: ${product["name"]}",
                            style: const TextStyle(fontSize: 18.0)),
                        Text("Price: ${product["price"]}",
                            style: const TextStyle(fontSize: 18.0)),
                        Text("Description: ${product["description"]}",
                            style: const TextStyle(fontSize: 18.0)),
                        // Add other product details as needed
                        TextButton(
                            onPressed: () {
                              widget.addToItem(product);
                            },
                            child: Text("Add to cart"))
                      ],
                    ),
                  ),
                ));
          }).toList(),
        ));
  }
}


 // Card(
            //     child: InkWell(
            //   child: Column(
            //     children: [
            //       ListTile(
            //         title: Text('Name: ${product['name']}'),
            //         subtitle: Text('ID: ${product['id']}'),
            //         leading: Image.network(
            //           product['imageUrl'],
            //           width: 50.0,
            //           height: 50.0,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: Text('Price: \$${product['price']}'),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: Text('Description: ${product['description']}'),
            //       ),
            //     ],
            //   ),
            // ));