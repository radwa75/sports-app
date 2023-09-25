import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'teams_screen.dart';

class PlayerInfoScreen extends StatefulWidget {
  const PlayerInfoScreen({super.key});

  @override
  State<PlayerInfoScreen> createState() => _PlayerInfoScreenState();
}

class _PlayerInfoScreenState extends State<PlayerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    var playerData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.black,
     appBar: AppBar(
        leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) {
              return TeamsScreens();
            }),
          );
        },
      );
    },
        ),
      
      title: Row(children: [
    
        Text(
                                            "Player",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.amber,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Info..",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
      ]),
        backgroundColor: Colors.transparent, // Make the original app bar transparent
        elevation: 0, // Remove the shadow
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black38,Colors.amberAccent, Colors.black38], // Set your desired gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
  body: Center(
  child: ListView.separated(
    padding: EdgeInsets.all(16.0),
    itemBuilder: (BuildContext context, int index) {
      if (index == 0) {
        return ListTile(
         leading: playerData['player_image'] != null
    ? ClipOval(
        child: Image.network(
          playerData['player_image'],
           // Adjust the width as desired
          height: 200, // Adjust the height as desired
          fit: BoxFit.fill,
        ),
      )
    : CircleAvatar(
        radius: 40, // Adjust the radius as desired
        child: Placeholder(), // Display a Placeholder if image is null
      ),           title: Text(
            playerData['player_name'] ?? 'No Name',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player name or 'No Name' if name is null
          subtitle: Text(
            'Player Type: ${playerData['player_number'] ?? 'Unknown'}',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player type or 'Unknown' if type is null
        );
      } else if (index == 1) {
        return ListTile(
          title: Text(
            'player country: ${playerData['player_country'] ?? 'N/A'}',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player country or 'N/A' if country is null
        );
      } else if (index == 2) {
        return ListTile(
          title: Text(
            'player goals: ${playerData['player_goals'] ?? 'N/A'}',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player goals or 'N/A' if goals is null
        );
      } else if (index == 3) {
        return ListTile(
          title: Text(
            'player yellow cards: ${playerData['player_yellow_cards'] ?? 'N/A'}',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player yellow cards or 'N/A' if yellow cards is null
        );
      } else if (index == 4) {
        return ListTile(
          title: Text(
            'player red cards: ${playerData['player_red_cards'] ?? 'N/A'}',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player red cards or 'N/A' if red cards is null
        );
      } else if (index == 5) {
        return ListTile(
          title: Text(
            'player assists: ${playerData['player_assists'] ?? 'N/A'}',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player assists or 'N/A' if assists is null
        );
      } else if (index == 6) {
        return ListTile(
          title: Text(
            'player age: ${playerData['player_age'] ?? 'N/A'}',
            style: GoogleFonts.barriecito(color: Colors.white),
          ), // Display player age or 'N/A' if age is null
        );
      }
      return null;
    },
    separatorBuilder: (BuildContext context, int index) {
      return Divider(
        color: Colors.amber,
        thickness: 1.0,
      ); // Add a divider between ListTiles
    },
    itemCount: 7, // Set the itemCount to the total number of ListTiles
  ),
));
  }
}
