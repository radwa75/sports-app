// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/teams_api.dart';
import '../models/top_scorers.dart';

class TeamsScreens extends StatefulWidget {
  const TeamsScreens({super.key});

  @override
  State<TeamsScreens> createState() => _TeamsScreensState();
}

class _TeamsScreensState extends State<TeamsScreens> {
  late Future<TeamsApis> futuredata;
  late Future<TopScorersApis> top_scorers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuredata = fetchdata('1');
    top_scorers = fetchTopPlayers('1');
  }

  @override
  Widget build(BuildContext context) {
    var recvData = ModalRoute.of(context)?.settings.arguments as String;
    setState(() {
      futuredata = fetchdata(recvData);
      top_scorers = fetchTopPlayers(recvData);
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, // Make the original app bar transparent
          elevation: 0, // Remove the shadow
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black38,
                  Colors.amberAccent,
                  Colors.black38
                ], // Set your desired gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            "Teams",
            style: GoogleFonts.barriecito(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 203, 246, 112).withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 12,
                    offset: Offset(0, 2), // shadow offset
                  ),
                ],
              ),
              child: TabBar(
                tabs: [
                  Tab(
                    text: "Teams",
                  ),
                  Tab(text: "Top Scores"),
                ],
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          Container(
              margin: EdgeInsets.all(10),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: Colors.white), // Set border color
  ),
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Search Bar',
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 253, 162, 4),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ), // Set hint text style
      focusColor: Colors.amber,
      hoverColor: Color.fromRGBO(27, 7, 8, 0.612),
      prefixIcon: Icon(Icons.search, color: Colors.amber), // Set prefix icon
      border: InputBorder.none, // Remove default border
    ),
  ),
                  ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FutureBuilder<TeamsApis>(
                    future: futuredata,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(
                          color: Color.fromARGB(255, 46, 2, 4),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final TeamData = snapshot.data!.result;
                        return Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: TeamData.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "PlayersOfTeam",
                                      arguments: TeamData[index]["team_key"]
                                          .toString());
                                },
                                child: Column(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(
                                          seconds:
                                              5), // Set the duration for the animation
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10), // Add border radius to the container
                                        border: Border.all(
                                          color: Colors.amber,
                                          width: 3,
                                        ),
                                      ),

                                      child: Image.network(
                                          TeamData[index]["team_logo"]),
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      TeamData[index]["team_name"],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        // Handle the case where data is not available
                        return Text('No data available.');
                      }
                    },
                  ),
                ),
              ])),
          Container(
            child: FutureBuilder<TopScorersApis>(
              future: top_scorers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(
                      color: Color.fromARGB(255, 46, 2, 4));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  final TopPlayers = snapshot.data!.result;
                  return Expanded(
                      child: ListView.builder(
                          itemCount: TopPlayers.length,
                          itemBuilder: (BuildContext context, int idx) {
                            return Center(
                              
                              child: Column(
                                
                                children: [
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                    
                                      Text(
                                        TopPlayers[idx]['player_name'],
                                        style:GoogleFonts.barriecito(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                      ),
                                      Text(
                                        TopPlayers[idx]['goals'].toString(),
                                      style:GoogleFonts.barriecito(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.amber,
                                    height: 1,
                                    indent: 10,
                                    endIndent: 10,
                                    thickness: 1,
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            );
                          }));
                } else {
                  // Handle the case where data is not available
                  return Text('No data available.');
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
