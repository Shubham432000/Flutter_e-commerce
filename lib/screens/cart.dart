import 'package:e_commerce/screens/dummy_products.dart';
import 'package:e_commerce/screens/home_bar.dart';
import 'package:e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/screens/your_product_widget.dart';
import 'package:e_commerce/screens/product.dart';
import 'package:quickalert/quickalert.dart';

class Cart extends StatefulWidget {
  final Function(dynamic) removeProduct;
  const Cart({super.key, required this.removeProduct});
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double price1 = 0;
    setState(() {
      items1.forEach((item) {
        price1 = price1 + item["price"] * item["quantity"];
      });
    });

    // void removeProduct(removeId) {
    //   setState(() {
    //     items1.removeWhere((product) => product["id"] == removeId);
    //   });
    // }

    void incrementQnty(increId) {
      setState(() {
        var incrProduct = items1.firstWhere((item) => item["id"] == increId);

        if (incrProduct["quantity"] >= 1) {
          incrProduct["quantity"]++;
        } else {
          incrProduct["quantity"] = 1;
        }
      });
    }

    void decreQnty(decreId) {
      var decrProduct = items1.firstWhere((item) => item["id"] == decreId);
      setState(() {
        if (decrProduct["quantity"] > 1) {
          decrProduct["quantity"]--;
        } else if (decrProduct["quantity"] == 1) {
          items1.removeWhere((product) => product["id"] == decreId);
        }
      });
    }

    // void Checkout() {
    //   print("order placed succefully");
    void _Success(context) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: ' you are Order Placed Successfully!',
      );
    }
    // }

    print("cart item ${items1}");
    print("items");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      body: items1.length != 0
          ? Column(
              children: [
                Expanded(
                  child: ListView(
                    children: items1.map((product) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(product["name"]),
                          subtitle: Text(
                              'Price: \$${product["price"].toStringAsFixed(2)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  decreQnty(product["id"]);
                                },
                              ),
                              Text('${product["quantity"].toString()}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  incrementQnty(product["id"]);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  widget.removeProduct(product["id"]);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: Text("Total ${price1} ",
                          style: TextStyle(
                              fontSize:
                                  22)), // Adjust the content of the container as needed
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          _Success(context);
                        },
                        child: Text(
                          "CheckOut",
                          style: TextStyle(fontSize: 22),
                        ),
                      ), // Adjust the content of the container as needed
                    ),
                  ],
                )
                // Container(
                //   margin: EdgeInsets.only(top: 8.0),
                //   child: Text(
                //       "Total ${price1}"), // Adjust the content of the container as needed
                // ),
              ],
            )
          : Container(
              child: Image.asset('images/empty.png'),
            ),
    );
  }
}
