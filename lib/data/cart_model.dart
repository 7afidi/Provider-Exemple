import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:provider_exemple/data/product_model.dart';

class cartModel extends ChangeNotifier {
  final List<ProductModel> products = [];

  UnmodifiableListView<ProductModel> get items =>
      UnmodifiableListView(products);

  double get tottal {
    double tottal = 0;
    for (var element in products) {
      tottal+=element.price;
    }
    return tottal;
  }

  List<ProductModel> get allItems{
    return products;
  }


  void addItem(ProductModel productModel) {
    products.add(productModel);
    notifyListeners();
  }

  void removeall() {
    products.clear();
    notifyListeners();
  }
  int get size{
    return products.length;
  }
  
  
  }
