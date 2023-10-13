import 'dart:convert';

import 'package:http/http.dart' as http;

class Provider {
  final _baseUrl = "reqres.in";
  final Map<String, String> _headers = {'Content-Type': 'application/json'};
  login(req) async {
    try {
      final Uri url = Uri.https(_baseUrl, '/api/login');
      final Map<String, dynamic> body = req;
      final response = await http.post(
        url,
        headers: _headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  getUserList(page) async {
    try {
      final Uri url = Uri.https(_baseUrl, '/api/users', {'page': '$page'});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {}
  }

  createUser(req) async {
    try {
      final Uri url = Uri.https(_baseUrl, '/api/users');
      final Map<String, dynamic> body = req;
      final response =
          await http.post(url, headers: _headers, body: jsonEncode(body));
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
