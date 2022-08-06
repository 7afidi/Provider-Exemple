
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exemple/colors.dart';
import 'package:provider_exemple/data/cart_model.dart';
import 'package:provider_exemple/data/data.dart';
import 'package:provider_exemple/data/product_model.dart';
import 'package:provider_exemple/screens/cart.dart';
import 'package:provider_exemple/screens/product_page.dart';
import 'package:provider_exemple/widgets/product.dart';

void main() {
  return runApp(ChangeNotifierProvider(
    create: (context)=>cartModel(),
    child: myApp()));
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productslist = products;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: Text("Shopping Store "),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.shopping_bag),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cart(),
                        )),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17.0,
                    mainAxisSpacing: 17.0),
                itemCount: productslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPage(
                                    productModel: productslist[index],
                                  )))),
                      child: Product(
                        productModel: productslist[index],
                      ));
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
