 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spt/challenge_provider.dart';
import 'package:spt/challenge_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChallengeProvider(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       
      title: 'Challenge App',
       theme: ThemeData(
         primarySwatch: Colors.deepOrange
       ),
      home: ChallengesScreen(),
    );
  }
}
