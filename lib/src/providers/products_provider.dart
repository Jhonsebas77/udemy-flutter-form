import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:udemy_form_app/src/models/product_model.dart';

class ProductProvider {
  final String _url = 'https://flutter-tools-jsob-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json';
    final response = await http.post(
      url,
      body: productModelToJson(product),
    );
    final decodeData = json.decode(response.body);
    print('DECODE -> $decodeData');
    return true;
  }
}
