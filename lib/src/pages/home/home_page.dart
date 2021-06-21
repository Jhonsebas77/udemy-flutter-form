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
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: AlignmentDirectional.centerStart,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        leading: Icon(
          (product.available) ? Icons.local_offer : Icons.local_offer_outlined,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
        ),
        title: Text('${product.title}'),
        subtitle: Text('\$ ${product.value}'),
        onTap: () => Navigator.pushNamed(
          context,
          'product',
          arguments: product,
        ),
      ),
    );
  }
}
