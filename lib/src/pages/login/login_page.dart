import 'package:flutter/material.dart';
import 'package:udemy_form_app/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context),
          _buildLoginForm(context),
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

  Widget _buildLoginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final _sizeScreen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 190,
            ),
          ),
          Container(
            width: _sizeScreen.width * 0.85,
            margin: EdgeInsets.symmetric(
              vertical: 30,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                5,
              ),
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
            ),
            child: Column(
              children: [
                Text(
                  'Login',
                ),
                SizedBox(
                  height: 60,
                ),
                _buildEmail(bloc),
                SizedBox(
                  height: 30,
                ),
                _buildPassword(bloc),
                SizedBox(
                  height: 30,
                ),
                _buildButton(),
              ],
            ),
          ),
          Text('Forget Password'),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.green[900],
              ),
              hintText: 'test@mail.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
            onChanged: (value) => bloc.changeEmail(value),
          ),
        );
      },
    );
  }

  Widget _buildPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.green[900],
              ),
              labelText: 'Password',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _buildButton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
        child: Text(
          'Login',
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      elevation: 0.0,
      color: Colors.green[900],
      textColor: Colors.white,
      onPressed: () {},
    );
  }
}
