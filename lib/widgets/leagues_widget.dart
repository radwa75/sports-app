
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LeaguesGridTile extends StatelessWidget {
  final Map<String, dynamic> leagues;

  const LeaguesGridTile(this.leagues);

  @override
  Widget build(BuildContext context) {
    final leagueLogo = leagues['league_logo'];
    final leagueName = leagues['league_name'];

    if (leagueLogo == null || leagueName == null) {
      return Visibility(
        visible: false,
        child: Container(),
      );
    }

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, "Teams",arguments: leagues['league_key'].toString());
      },
      child: GridTile(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 5), // Set the duration for the animation
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Add border radius to the container
                  border: Border.all(
                    color: Colors.amber,
                    width: 3,
                  ),
                ),
                child: Image.network(
                 leagueLogo,
                  width: 150,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
            ),

              SizedBox(height: 10),
              Container(
                width: 50,
                child: Text(leagueName,maxLines: 1,style: GoogleFonts.barriecito(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),)),
          ],
        ),
      ),
    );
  }
}
