import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Countryapi> fetchdata() async {
  final response = await http
      .get(Uri.parse('https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=249335fc92ffe51aadfbfb9272ed465c1f6257cf4846092559c49fda01ba040b'));

  if (response.statusCode == 200) {
  
    return Countryapi.fromJson(jsonDecode(response.body));
  }
    throw Exception('Failed to load album');
  }








class Countryapi {
  final int success;
  final List<dynamic> result;

  const Countryapi({required this.success, required this.result});

  factory Countryapi.fromJson(Map<String, dynamic> json) {
    return Countryapi(
        success: json['success'], result: List<dynamic>.from(json['result']));
  }
}
