import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exemple/colors.dart';
import 'package:provider_exemple/data/cart_model.dart';
import 'package:provider_exemple/widgets/checkout_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {

    // This can lead to significant performance improvements.
   
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: primaryColor,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 300.0,
            child: Consumer<cartModel>(builder: (context, cart, child) {
              return ListView.builder(
                itemCount: cart.size,
                itemBuilder: (BuildContext context, int index) {
                  return CheckoutItem(
                    productModel: cart.allItems[index],
                  );
                },
              );
            }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Consumer<cartModel>(
                  builder: (context, cart, child) {
                    return Text('Total price: ${cart.tottal}');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                
                onTap: (){
                  var item  =context.read<cartModel>();
                  item.removeall();
                },
                child: Text("Clear ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
            )
          ],
        ),
        Center(
          child: Container(
            width: 300.0,
            child: ElevatedButton(
              child: Text("Check Out"),
              onPressed: () => {print("ch")},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor)),
            ),
          ),
        )
      ]),
    );
  }
}
