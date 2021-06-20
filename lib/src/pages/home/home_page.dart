import 'package:flutter/material.dart';
import 'package:udemy_form_app/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Email: ${bloc.email}',
          ),
          Divider(),
          Text(
            'Password: ${bloc.password}',
          ),
        ],
      ),
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
}
