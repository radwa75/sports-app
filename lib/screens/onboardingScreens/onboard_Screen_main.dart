import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widgets/onboarding_widgets.dart';
import '../Category_Screen.dart';


class OnBoardScreenMain extends StatelessWidget {
  const OnBoardScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox.expand(
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                   ElevatedButton(
                                onPressed: () {
                                
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryScreen()),
                                      // Form is valid, do something
                                    );
                                  },
                                
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  minimumSize: Size(100, 25),
                                ),
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            
        ]),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnboardOnne(),
                    OnBoardTwo(),
                    OnBoardThree()
                  ],
                ),
              ),
             
            ]),
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.1,
                    fit: BoxFit.none,
                    //maybe need locol image
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1552318965-6e6be7484ada?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"))),
          ),
        ));
  }
}
