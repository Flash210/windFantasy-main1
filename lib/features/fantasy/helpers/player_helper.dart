import 'dart:convert';

import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';

import 'package:http/http.dart' as http;

Future<String?> getToken() async {
  return sl<TokenManager>().getToken();
}

Future<http.Response> getResponse(
    {required String? token,
    required String urlBaseUrl,
    required String urlEndPoint}) async {
  return await http.get(
    Uri.parse(urlBaseUrl+urlEndPoint),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    },
  );
}



Future<List<T>> parseListResponse1<T>(
    http.Response response, T Function(Map<String, dynamic>) fromJson) async {
  if (response.statusCode == 200) {
    try {
      final jsonData = json.decode(response.body);
      final data = jsonData['data'] as List<dynamic>;
      return data.map((itemData) => fromJson(itemData)).toList();
    } catch (e) {
      print("Error processing JSON data: $e");
      return [];
    }
  } else {
    print("Error fetching data: ${response.body}");
    return [];
  }
}






