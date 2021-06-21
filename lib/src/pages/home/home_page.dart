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
          final _products = snapshot.data;
          return ListView.builder(
            itemCount: _products.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) =>
                _buildItem(_products[index], context),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _buildItem(ProductModel product, BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        productProvider.deleteProduct(product.id);
      },
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        title: Text('${product.title} | ${product.value}'),
        subtitle: Text('${product.id}'),
        onTap: () => Navigator.pushNamed(context, 'product'),
      ),
    );
  }
}
