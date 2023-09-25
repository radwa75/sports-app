
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CountryGridTile extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryGridTile(this.country);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "Leagues",arguments: country['country_key'].toString());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
  AnimatedContainer(
    duration: Duration(seconds: 5), // Set the duration for the animation
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10), // Add border radius to the container
      border: Border.all(
        color: Colors.amber,
        width: 3,
      ),
    ),
    child: Image.network(
      country['country_logo'] != null
          ? country['country_logo']
          : "https://images.unsplash.com/photo-1623972202881-8ded45a5ad84?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=393&q=80",
      width: 150,
      height: 70,
      fit: BoxFit.fill,
    ),
  ),

              SizedBox(height: 10),
              Container(
                width: 50,
                child: Text(country['country_name'],maxLines: 1,style: GoogleFonts.barriecito(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),)),
            ],
          ),
        ),
      ),
    );
  }
}