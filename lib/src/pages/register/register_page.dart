import 'package:flutter/material.dart';
import 'package:udemy_form_app/src/bloc/provider.dart';
import 'package:udemy_form_app/src/pages/widgets/widgets.dart';
import 'package:udemy_form_app/src/providers/user_provider.dart';
import 'package:udemy_form_app/src/utils/utils.dart';

class RegisterPage extends StatelessWidget {
  final userProvider = new UserProvider();

  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthBackground(),
          _buildLoginForm(context),
        ],
      ),
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
                  'Register',
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
                _buildButton(bloc),
              ],
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            child: Text('Already have account?'),
          ),
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

  Widget _buildButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (
        BuildContext context,
        AsyncSnapshot snapshot,
      ) {
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 15,
            ),
            child: Text(
              'Register',
            ),
          ),
          onPressed: snapshot.hasData ? () => _register(bloc, context) : null,
        );
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context) async {
    Map info = await userProvider.newUser(bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      showAlertMessage(context, info['message']);
    }
  }
}
