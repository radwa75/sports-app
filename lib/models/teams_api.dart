import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<TeamsApis > fetchdata(String id) async {
  final response = await http
      .get(Uri.parse('https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=249335fc92ffe51aadfbfb9272ed465c1f6257cf4846092559c49fda01ba040b&leagueId=${id}'));

  if (response.statusCode == 200) {
  
    return TeamsApis.fromJson(jsonDecode(response.body));
  }
    throw Exception('Failed to load album');
  }








class TeamsApis {
  final int success;
  final List<dynamic> result;

  const TeamsApis ({required this.success, required this.result});

  factory TeamsApis .fromJson(Map<String, dynamic> json) {
    return TeamsApis (
        success: json['success'], result: List<dynamic>.from(json['result']));
  }
}