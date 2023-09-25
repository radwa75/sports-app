import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardOnne extends StatelessWidget {
  const OnboardOnne({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 103, 148),),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(          
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/messi.png'))),
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height*0.60*0.9,
          ),
          Container(
             width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.40*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
              color: Colors.black
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Football",style:GoogleFonts.barriecito(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("a team sport where players kick a ball into the opposing team's goal to score points, with the aim of having the highest number of goals by the end of the match to win.",style:GoogleFonts.barriecito(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),),
                    ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class OnBoardTwo extends StatelessWidget {
  const OnBoardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color.fromARGB(255, 253, 189, 93),),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(          
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/basketPlayer2.png'))),
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height*0.60*0.9,
          ),
          Container(
             width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.40*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
              color: Colors.black
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Basketball",style: GoogleFonts.barriecito(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("fast-paced team sport played with a spherical ball, where players try to score points by shooting the ball into the opponent's hoop while defending their own.",style:GoogleFonts.barriecito(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),),
                    ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardThree extends StatelessWidget {
  const OnBoardThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color.fromARGB(255, 60, 176, 239),),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(          
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/tennisPlayer2.png'))),
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height*0.60*0.9,
          ),
          Container(
             width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.40*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
              color: Colors.black
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Tennis",style: GoogleFonts.barriecito(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("racket sport played between two players or teams, involving hitting a ball over a net using rackets, with the objective of winning points by making the ball land in the opponent's court in a way they cannot return it successfully.",style:GoogleFonts.barriecito(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),),
                    ],
              ),
            ),
          )
        ],
      ),
    );
  }
}