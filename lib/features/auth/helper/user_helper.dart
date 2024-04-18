import 'dart:convert';

import 'package:http/http.dart' as http;

Future<T> parseUserResponse<T>(
    http.Response response, T Function(Map<String, dynamic>) fromJson) async {
  if (response.statusCode == 200) {
    try {
      final jsonData = json.decode(response.body);
      final data = jsonData['data'];
      return fromJson(data);
    } catch (e) {
      throw Exception('Error processing JSON data: $e');
    }
  } else {
    throw Exception('Error fetching data: ${response.body}');
  }
}
