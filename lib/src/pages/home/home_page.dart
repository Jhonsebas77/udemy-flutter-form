import 'package:flutter/material.dart';
import 'package:udemy_form_app/src/bloc/provider.dart';
import 'package:udemy_form_app/src/models/product_model.dart';
import 'package:udemy_form_app/src/providers/products_provider.dart';

class HomePage extends StatelessWidget {
  final productProvider = new ProductProvider();
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Text(
            bloc.email,
          )
        ],
      ),
      body: _buildProductList(),
      floatingActionButton: _buildButton(context),
    );
  }

  _buildButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(
        context,
        'product',
      ),
      backgroundColor: Colors.green,
    );
  }

  _buildProductList() {
    return FutureBuilder(
      future: productProvider.loadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
