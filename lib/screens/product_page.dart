import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exemple/colors.dart';
import 'package:provider_exemple/data/cart_model.dart';
import 'package:provider_exemple/data/product_model.dart';

class ProductPage extends StatelessWidget {
  final ProductModel productModel;
  const ProductPage({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
const snackBar = SnackBar(
  content: Text('Item added !'),
);
     var isInCart = context.select<cartModel, bool>(
      (cart) => cart.items.contains(productModel)
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              child: Column(children: [
                Text(
                  productModel.name,
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 200.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(productModel.imagePath,fit: BoxFit.cover,)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${productModel.price}.\$',
                  style: TextStyle(fontSize: 22.0),
                ),
                const SizedBox(height: 10.0,),
                Text(productModel.description),
                 const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width:300.0,
                  height: 45.0,
                  child: isInCart?ElevatedButton(
                    onPressed: null,
                    child: Text("Item added ",style: TextStyle(fontSize: 16.0),),
                    
                  ):ElevatedButton(
                    onPressed: (){
                      var item  =context.read<cartModel>();
                      item.addItem(productModel);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    },
                    child: Text("Add to Cart",style: TextStyle(fontSize: 16.0),),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor)),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
