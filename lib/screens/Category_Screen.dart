import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/category_widget.dart';
import 'countries_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  PageController _pageController = PageController();

  int _currentPage = 0;

  int _numPages = 4;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5 * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage("assets/images/stadium.jpeg"),
                          opacity: 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Choose",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.amber,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Your Sport",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5 * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage("assets/images/tennis stad.jpg"),
                          opacity: 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Choose",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.amber,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Your Sport",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                      // Additional content for the second container
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5 * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/bascketball stad.jpg"),
                          opacity: 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                     child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Choose",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.amber,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Your Sport",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5 * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage("assets/images/cricket std.jpg"),
                          opacity: 0.5,
                          fit: BoxFit.cover,
                         ),
                      ),
                        child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Choose",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.amber,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Your Sport",
                                            style: GoogleFonts.barriecito(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                           ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ])),
        
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                SportWidget(
                  image: "assets/images/football.png",
                  name: "Football",
                  onTap: () {
                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              test()),
                                      // Form is valid, do something
                                    );
                  },
                ),
                SportWidget(
                  image: "assets/images/bascketball.png",
                  name: "Basketball",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Coming soon"),
                          content: Text("Tennis is coming soon.",
                              style: GoogleFonts.barriecito()),
                          actions: [
                            TextButton(
                              child: Text("OK",
                                  style: GoogleFonts.barriecito(
                                      color: Colors.amber)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SportWidget(
                  image: "assets/images/cricket.png",
                  name: "Cricket",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Coming soon"),
                          content: Text("Tennis is coming soon.",
                              style: GoogleFonts.barriecito()),
                          actions: [
                            TextButton(
                              child: Text("OK",
                                  style: GoogleFonts.barriecito(
                                      color: Colors.amber)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SportWidget(
                  image: "assets/images/tennis.png",
                  name: "Tennis",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Coming soon"),
                          content: Text("Tennis is coming soon.",
                              style: GoogleFonts.barriecito()),
                          actions: [
                            TextButton(
                              child: Text("OK",
                                  style: GoogleFonts.barriecito(
                                      color: Colors.amber)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ]));
  }
}
