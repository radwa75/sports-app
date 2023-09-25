import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/player_of_team.dart';
import 'countries_screen.dart';

class PlayersOfTeam extends StatefulWidget {
  const PlayersOfTeam({super.key});

  @override
  State<PlayersOfTeam> createState() => _PlayersOfTeamState();
}

class _PlayersOfTeamState extends State<PlayersOfTeam> {
  late Future<PlayersOfTeamApis> futuredata;
  void initState() {
    // TODO: implement initState
    super.initState();
    futuredata = fetchdata('1');
  }

  @override
  Widget build(BuildContext context) {
    var recvData = ModalRoute.of(context)?.settings.arguments as String;
    setState(() {
      futuredata = fetchdata(recvData);
    });
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return test();
                    }),
                  );
                },
              );
            },
          ),
          title: Row(
            children: [
              Text(
                " Playrs",
                style: GoogleFonts.barriecito(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Of Team..",
                style: GoogleFonts.barriecito(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black38, Colors.amberAccent, Colors.black38],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        
        body: Container(
          
          color: Colors.black,
          child: FutureBuilder<PlayersOfTeamApis>(
            future: futuredata,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(
                  color: Color.fromARGB(255, 46, 2, 4),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                final playerData = snapshot.data!.result;
                return Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, index) {
                      final playerImage = playerData[index]['player_image'];
                      final playerName = playerData[index]['player_name'];
                     
                
                      return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "playerInfo",
                      arguments: playerData[index]);
                  },
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: playerImage != null
                            ? CircleAvatar(
                               backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(playerImage),
                  radius: 25,
                              )
                            : CircleAvatar(
                              backgroundColor: Colors.amber,
                  backgroundImage: AssetImage('assets/images/vin.png'),
                  radius: 25,
                              ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          playerName,
                         style: GoogleFonts.barriecito(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                        ),
                        Divider(color: Colors.amber, thickness: 1.0),
                      ],
                  
                            
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text('No data available.');
              }
            },
          ),
        ));
  }
}
