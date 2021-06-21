import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:udemy_form_app/src/models/product_model.dart';

class ProductProvider {
  final String _url = 'https://flutter-tools-jsob-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json';
    await http.post(
      url,
      body: productModelToJson(product),
    );
    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    final url = '$_url/products.json';
    final response = await http.get(
      url,
    );
    final Map<String, dynamic> decodeData = json.decode(response.body);
    final List<ProductModel> _products = new List();
    if (decodeData == null) return [];
    decodeData.forEach((id, _product) {
      final _tempProduct = ProductModel.fromJson(_product);
      _tempProduct.id = id;

      _products.add(_tempProduct);
    });
    return _products;
  }

  Future<int> deleteProduct(String id) async {
    final url = '$_url/products/$id.json';
    await http.delete(
      url,
    );
    return 1;
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = '$_url/products/${product.id}.json';
    await http.put(
      url,
      body: productModelToJson(product),
    );
    return true;
  }
}
