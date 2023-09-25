import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intixel_sport_app/screens/countries_screen.dart';

import '../models/Leagues_apis.dart';
import '../widgets/leagues_widget.dart';

class Leagues_screen extends StatefulWidget {
  const Leagues_screen({super.key});

  @override
  State<Leagues_screen> createState() => _Leagues_screenState();
}

class _Leagues_screenState extends State<Leagues_screen> {
  late Future<Leaguesapis> futuredata;
  @override
  void initState() {
    super.initState();
    futuredata = fetchdata('5');
  }

  @override
  Widget build(BuildContext context) {
    var recvData = ModalRoute.of(context)?.settings.arguments as String;
    setState(() {
      futuredata = fetchdata(recvData);
    });
    return Scaffold(
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
              " leagues",
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
              "Of Country..",
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
        child: FutureBuilder<Leaguesapis>(
          future: futuredata,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                color: Color.fromARGB(255, 46, 2, 4),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              final countryData = snapshot.data!.result;
              return ListView.separated(
                itemCount: countryData.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.amber,
                    height: 1,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final leagueLogo = countryData[index]['league_logo'];
                  final leagueName = countryData[index]['league_name'];

                  if (leagueLogo == null || leagueName == null) {
                    return Container(); // Skip building the tile if logo or name is null
                  }

                  return Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LeaguesGridTile(countryData[index]),
                        ],
                      ),
                    ],
                  );
                },
              );
            } else {
              return Text('No data available.');
            }
          },
        ),
      ),
    );
  }
}
