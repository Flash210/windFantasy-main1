
import 'dart:convert';
import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:http/http.dart' as http;

Future<http.Response> postResponse(
    {required String? token,
    required String urlBaseUrl,
    required String urlEndPoint,
    required TeamEdit teamEdit
  
    }) async {
  return await http.post(
    Uri.parse(urlBaseUrl + urlEndPoint),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    },
    body: json.encode(teamEdit.toJson()),
    
    );
    
}