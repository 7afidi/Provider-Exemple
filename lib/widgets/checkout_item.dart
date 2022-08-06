import 'package:flutter/material.dart';
import 'package:provider_exemple/colors.dart';
import 'package:provider_exemple/data/product_model.dart';

class CheckoutItem extends StatelessWidget {
  final ProductModel productModel;
  const CheckoutItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                productModel.imagePath,
                height: 60.0,
                width: 60.0,
                fit: BoxFit.fill,
              )),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              productModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Text(
              productModel.description,
              style: TextStyle(
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(productModel.price.toString(),
                style: TextStyle(color: primaryColor))
          ]),
        ],
      ),
    );
  }
}
