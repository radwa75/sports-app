import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SportWidget extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const SportWidget({
    required this.image,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,width: 100,),
            SizedBox(height: 10),
            Text(
              name,
              style:GoogleFonts.barriecito(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}