import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<TopScorersApis > fetchTopPlayers( String id) async {
  final response = await http
      .get(Uri.parse('https://apiv2.allsportsapi.com/football/?&met=Topscorers&APIkey=249335fc92ffe51aadfbfb9272ed465c1f6257cf4846092559c49fda01ba040b&leagueId=${id}'));

  if (response.statusCode == 200) {
  
    return TopScorersApis.fromJson(jsonDecode(response.body));
  }
    throw Exception('Failed to load album');
  }








class TopScorersApis {
  final int success;
  final List<dynamic> result;

  const TopScorersApis ({required this.success, required this.result});

  factory TopScorersApis .fromJson(Map<String, dynamic> json) {
    return TopScorersApis (
        success: json['success'], result: List<dynamic>.from(json['result']));
  }
}