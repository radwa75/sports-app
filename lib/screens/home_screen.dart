import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/onboarding_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  PageController _pageController = PageController();
  int _currentPage = 0;
  int _numPages = 3;

  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      if (_currentPage < _numPages - 1) {
        _pageController.nextPage(
            duration: Duration(seconds: 1), curve: Curves.ease);
      } else {
        _pageController.jumpToPage(0);
      }
      _startAutoSlide();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 5, 17),
        body: SizedBox.expand(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose One",
                  style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "your favorite sport",
                  style: GoogleFonts.quicksand(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage('assets/imgs/footballStudim.jpg'))),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3 * 0.9,
                      ),
                       Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, 
                                image: AssetImage('assets/imgs/basketballStudim.jpg'))),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3 * 0.9,
                      ),
                       Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                 fit: BoxFit.cover, 
                                image: AssetImage('assets/imgs/tennisStudim.jpg'))),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3 * 0.9,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "TestRadwa");
                        },
                        child: Container(
                          color: Colors.amber,
                          height: 125,
                          width: 125,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             
                              Text("Football"),
                            ],
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Coming soon"),
                            content: Text("Tennis is coming soon.",style: GoogleFonts.bebasNeue()),
                            actions: [
                              TextButton(
                                child: Text("OK",style: GoogleFonts.bebasNeue(color: Colors.amber)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                        },
                        child: Container(
                          color: Colors.amber,
                          height: 125,
                          width: 125,
                          child: Text("BasketBall")
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                         onTap: () {
                          showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Coming soon"),
                            content: Text("Tennis is coming soon.",style: GoogleFonts.bebasNeue()),
                            actions: [
                              TextButton(
                                child: Text("OK",style: GoogleFonts.bebasNeue(color: Colors.amber)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                        },
                        child: Container(
                          color: Colors.amber,
                          height: 125,
                          width: 125,
                          child: Text("Tennis Ball")
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                         onTap: () {
                          showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Coming soon"),
                            content: Text("Tennis is coming soon.",style: GoogleFonts.bebasNeue()),
                            actions: [
                              TextButton(
                                child: Text("OK",style: GoogleFonts.bebasNeue(color: Colors.amber)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                        },
                        child: Container(
                          color: Colors.amber,
                          height: 125,
                          width: 125,
                          child: Text("Unknown Ball")
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
