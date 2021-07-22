import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:udemy_form_app/src/models/product_model.dart';
import 'package:udemy_form_app/src/userPreferences/user_preferences.dart';

class ProductProvider {
  final String _url = 'flutter-tools-jsob-default-rtdb.firebaseio.com';
  final _prefs = new UserPreferences();
  final String _productsUrl = '/products.json';

  Future<bool> createProduct(ProductModel product) async {
    final url = Uri.https(
      _url,
      _productsUrl,
      {
        'auth': _prefs.token,
      },
    );
    print('createProduct url -> $url');
    await http.post(
      url,
      body: productModelToJson(product),
    );
    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    final url = Uri.https(
      _url,
      _productsUrl,
      {
        'auth': _prefs.token,
      },
    );
    print('loadProducts url -> $url');
    final response = await http.get(
      url,
    );
    final Map<String, dynamic> decodeData = json.decode(response.body);
    final List<ProductModel> _products = [];
    if (decodeData == null) return [];
    decodeData.forEach((id, _product) {
      final _tempProduct = ProductModel.fromJson(_product);
      _tempProduct.id = id;

      _products.add(_tempProduct);
    });
    return _products;
  }

  Future<int> deleteProduct(String id) async {
    final url = Uri.https(
      _url,
      _productsUrl,
      {
        'auth': _prefs.token,
      },
    );
    await http.delete(
      url,
    );
    return 1;
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = Uri.https(
      _url,
      '/products/${product.id}.json',
      {
        'auth': _prefs.token,
      },
    );
    print('updateProduct url -> $url');
    await http.put(
      url,
      body: productModelToJson(product),
    );
    return true;
  }
}
