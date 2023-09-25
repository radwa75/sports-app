import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/countries_apis.dart';
import '../widgets/countries_widgets.dart';
import 'Category_Screen.dart';



class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late Future<Countryapi> futuredata;

  @override
  void initState() {
    super.initState();
    futuredata = fetchdata();
  }

  @override
  Widget build(BuildContext context) {
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
              return CategoryScreen();
            }),
          );
        },
      );
    },
        ),
      
      title: Row(children: [
     
         Text(
                                            "Choose",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.amber,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Your Country..",
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
      body: Container(
        color: Colors.black,
        child: FutureBuilder<Countryapi>(
          future: futuredata,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(color: Color(0xffff3a44));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              final countryData = snapshot.data!.result;
              return ListView.builder(
                itemCount: (countryData.length - 1) ~/ 2,
                itemBuilder: (BuildContext context, int index) {
                  int firstCountryIndex = index * 2;
                  int secondCountryIndex = index * 2 + 1;

                  if (firstCountryIndex >= countryData.length ||
                      secondCountryIndex >= countryData.length) {
                    return SizedBox();
                  }

                  return Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CountryGridTile(countryData[firstCountryIndex]),
                          CountryGridTile(countryData[secondCountryIndex]),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(
                        color: Colors.amber,
                        height: 1,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.5,
                      ),
                      SizedBox(height: 16),
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