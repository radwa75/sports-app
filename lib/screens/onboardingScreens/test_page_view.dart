import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../widgets/onboarding_widgets.dart';
import '../Category_Screen.dart';

class testOnBoardScreenMain extends StatefulWidget {
  const testOnBoardScreenMain({super.key});

  @override
  State<testOnBoardScreenMain> createState() => _testOnBoardScreenMainState();
}

class _testOnBoardScreenMainState extends State<testOnBoardScreenMain> {
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
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: 25,),
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
                                  style:GoogleFonts.barriecito(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.9,
              child: PageView(
                 controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [OnboardOnne(), OnBoardTwo(), OnBoardThree()],
              ),
            ),
            
          ],
        ));
  }
}
