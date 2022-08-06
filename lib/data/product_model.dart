import 'dart:ffi';

class ProductModel {
  final String _name;
  final double _price;
  final String _description;
  final String _imagePath;
  ProductModel(
       this._name,
       this._price,
       this._description,
       this._imagePath);

  String get name {
    return _name;
  }

  double get price {
    return _price;
  }

  String get description {
    return _description;
  }

  String get imagePath {
    return _imagePath;
  }
}
