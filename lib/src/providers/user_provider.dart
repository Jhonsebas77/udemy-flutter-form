import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:udemy_form_app/src/userPreferences/user_preferences.dart';

class UserProvider {
  final String _firebaseToken = 'AIzaSyCuAXz-kyq5z5-NHzaI4jkbQHvwEZK58pc';
  final _prefs = new UserPreferences();
  Future loginUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
      'identitytoolkit.googleapis.com',
      '/v1/accounts:signInWithPassword',
      {
        'key': _firebaseToken,
      },
    );
    print('loginUser url -> $url');
    final response = await http.post(
      url,
      body: json.encode(authData),
    );
    Map<String, dynamic> decodeResponse = json.decode(response.body);
    print(decodeResponse);
    if (decodeResponse.containsKey('idToken')) {
      _prefs.token = decodeResponse['idToken'];
      return {'ok': true, 'token': decodeResponse['idToken']};
    } else {
      return {'ok': false, 'message': decodeResponse['error']['message']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
      'identitytoolkit.googleapis.com',
      '/v1/accounts:signUp',
      {
        'key': _firebaseToken,
      },
    );
    print('newUser url -> $url');
    final response = await http.post(
      url,
      body: json.encode(authData),
    );
    Map<String, dynamic> decodeResponse = json.decode(response.body);
    print(decodeResponse);
    if (decodeResponse.containsKey('idToken')) {
      _prefs.token = decodeResponse['idToken'];
      return {'ok': true, 'token': decodeResponse['idToken']};
    } else {
      return {'ok': false, 'message': decodeResponse['error']['message']};
    }
  }
}
