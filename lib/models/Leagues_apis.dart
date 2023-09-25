import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Leaguesapis > fetchdata(  String countryId) async {
  final response = await http
      .get(Uri.parse('https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=249335fc92ffe51aadfbfb9272ed465c1f6257cf4846092559c49fda01ba040b&countryId=$countryId'));

  if (response.statusCode == 200) {
  
    return Leaguesapis.fromJson(jsonDecode(response.body));
  }
    throw Exception('Failed to load album');
  }








class Leaguesapis {
  final int success;
  final List<dynamic> result;

  const Leaguesapis ({required this.success, required this.result});

  factory Leaguesapis .fromJson(Map<String, dynamic> json) {
    return Leaguesapis (
        success: json['success'], result: List<dynamic>.from(json['result']));
  }
}