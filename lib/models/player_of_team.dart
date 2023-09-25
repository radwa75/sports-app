import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<PlayersOfTeamApis > fetchdata( String id) async {
  final response = await http
      .get(Uri.parse('https://apiv2.allsportsapi.com/football/?&APIkey=249335fc92ffe51aadfbfb9272ed465c1f6257cf4846092559c49fda01ba040b&met=Players&teamId=${id}'));

  if (response.statusCode == 200) {
  
    return PlayersOfTeamApis.fromJson(jsonDecode(response.body));
  }
    throw Exception('Failed to load album');
  }








class PlayersOfTeamApis {
  final int success;
  final List<dynamic> result;

  const PlayersOfTeamApis ({required this.success, required this.result});

  factory PlayersOfTeamApis .fromJson(Map<String, dynamic> json) {
    return PlayersOfTeamApis (
        success: json['success'], result: List<dynamic>.from(json['result']));
  }
}