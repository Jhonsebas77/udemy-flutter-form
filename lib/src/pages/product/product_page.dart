import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.photo_size_select_actual,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.camera_alt,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(
            15,
          ),
          child: Form(
            child: Column(
              children: [
                _buildName(),
                _buildPrice(),
                _buildSummitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product Name',
      ),
    );
  }

  TextFormField _buildPrice() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        labelText: 'Product Price',
      ),
    );
  }

  RaisedButton _buildSummitButton() {
    return RaisedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.save),
      label: Text(
        'Save Info',
      ),
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      textColor: Colors.white,
    );
  }
}
