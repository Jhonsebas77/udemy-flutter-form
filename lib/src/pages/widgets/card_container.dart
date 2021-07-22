import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: _sizeScreen.width * 0.85,
        margin: EdgeInsets.symmetric(
          vertical: 30,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
        ),
        decoration: _buildDecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3.0,
            offset: Offset(
              0.0,
              5.0,
            ),
            spreadRadius: 1,
          )
        ],
      );
}
