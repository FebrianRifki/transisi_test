import 'dart:convert';

import 'package:http/http.dart';

class Provider {
  final baseUrl = "reqres.in";
  final Map<String, String> headers = {'Content-Type': 'application/json'};
  login(req) async {
    try {
      final url = Uri.https(baseUrl, '/api/login');
      final Map<String, String> body = req;
      final response = await post(
        url,
        headers: headers,
        body: json.encode(body), // Konversi map ke JSON string
      );

      if (response.statusCode == 200) {
        // Permintaan berhasil
        print('Response data: ${response.body}');
        return response.body;
      } else {
        // Permintaan gagal
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
