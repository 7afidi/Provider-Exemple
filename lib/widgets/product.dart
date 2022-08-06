import 'package:flutter/material.dart';
import 'package:provider_exemple/data/product_model.dart';

class Product extends StatelessWidget {
  final ProductModel productModel;
  const Product({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, style: BorderStyle.solid)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          color: Colors.redAccent,
          width: double.infinity,
          child: Image.asset(
            '${productModel.imagePath}',
            height: 100.0,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0, top: 8.0),
          child: Text(
            '${productModel.name}',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            "${productModel.price }\$",
            style: TextStyle(color: Colors.green,fontSize: 18.0),
          ),
        )
      ]),
    );
  }
}
