import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Future.delayed(Duration(seconds: 5)
   ,(){
    Navigator.pushReplacementNamed(context, "OnBoardScreen");
   }
   );


    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 5, 17),
        body: SizedBox.expand(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sport App",style:  GoogleFonts.barriecito(color: Colors.amber,fontSize: 45,fontWeight: FontWeight.bold),),
                Text("Intixel training app",style: GoogleFonts.quicksand(color: Colors.white),)
              ],
            ),
            decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              fit: BoxFit.none,
              //maybe need locol image
                image: AssetImage("assets/images/wallpaper.jpg"))),
            ),
        )
    );
  }
}