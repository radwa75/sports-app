import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intixel_sport_app/models/firebase_api.dart';



import 'screens/Category_Screen.dart';
import 'screens/Leagues_screen.dart';
import 'screens/countries_screen.dart';
import 'screens/onboardingScreens/test_page_view.dart';
import 'screens/player_info.dart';
import 'screens/players_team_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/teams_screen.dart';



import 'package:firebase_messaging/firebase_messaging.dart';

import 'widgets/notifi_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      initialRoute: "/",
      routes: {
        "/" :(context) => SplashScreen(),
        "OnBoardScreen":(context) => testOnBoardScreenMain(),
        "HomeScreen" :(context) => CategoryScreen(),
        "Countries":(context) => test(),
        "Leagues": (context) =>Leagues_screen(),
        "Teams":(context) => TeamsScreens(),
        "PlayersOfTeam":(context) =>PlayersOfTeam(),
        "playerInfo":(context)=>PlayerInfoScreen()
      },
    );
  }
}