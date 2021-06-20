import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: EdgeInsets.only(
        top: 80,
      ),
      child: Column(
        children: [
          Icon(
            Icons.person_pin_circle,
            color: Colors.white,
            size: 100,
          ),
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Text(
            'JSOB',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundColor(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: _sizeScreen.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(15, 15, 18, 1.0),
            Color.fromRGBO(89, 125, 30, 1.0)
          ],
        ),
      ),
    );
  }

  Widget _buildCircle() => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            100,
          ),
          color: Color.fromRGBO(
            255,
            255,
            255,
            0.05,
          ),
        ),
      );

  Widget _buildBackground(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundColor(context),
        Positioned(
          top: 90,
          left: 30,
          child: _buildCircle(),
        ),
        Positioned(
          top: -40,
          right: -30,
          child: _buildCircle(),
        ),
        Positioned(
          bottom: -50,
          right: -10,
          child: _buildCircle(),
        ),
        _buildLogo(),
      ],
    );
  }
}
