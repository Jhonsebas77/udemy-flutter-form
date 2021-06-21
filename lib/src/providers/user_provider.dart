import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {
  Future newUser(String email, String password) async {
    final String _firebaseToken = 'AIzaSyCuAXz-kyq5z5-NHzaI4jkbQHvwEZK58pc';
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken';
    final response = await http.post(
      url,
      body: json.encode(authData),
    );
    Map<String, dynamic> decodeResponse = json.decode(response.body);
    print(decodeResponse);
    if (decodeResponse.containsKey('idToken')) {
      // Save the Token
      return {'ok': true, 'token': decodeResponse['idToken']};
    } else {
      return {'ok': false, 'message': decodeResponse['error']['message']};
    }
  }
}
