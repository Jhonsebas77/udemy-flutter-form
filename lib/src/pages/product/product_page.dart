import 'package:flutter/material.dart';
import 'package:udemy_form_app/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
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
            key: formKey,
            child: Column(
              children: [
                _buildName(),
                _buildPrice(),
                _buildSumitButton(),
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
      validator: (value) {
        if (value.length < 3) {
          return 'Add the name of the product';
        } else {
          return null;
        }
      },
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
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Only Numbers';
        }
      },
    );
  }

  Widget _buildSumitButton() {
    return RaisedButton.icon(
      onPressed: _submit,
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

  void _submit() {
    if (!formKey.currentState.validate()) return;
  }
}
