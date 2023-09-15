import 'package:flutter/material.dart';
 
import 'challlenge.dart';
class ChallengeProvider with ChangeNotifier {
  List<Challenge> _challenges = [
    Challenge("Recycle 5 items today", false,false),
    Challenge("Go meatless for a meal", false,false),
     Challenge("Drink 8 glasses of water", false,false),
      Challenge("Eat 5 servings of fruits and vegetables", false,false),
       Challenge("Practice 10 minutes of meditation", false,false),
        Challenge("Walk 10,000 steps", false,false),
    // Add more challenges here
  ];

  List<Challenge> get challenges => _challenges;

  void markAsComplete(int index) {
    _challenges[index].isComplete = true;
    notifyListeners();
  }
  

 void markasselectd(int index){
  _challenges[index].isselected=true;
   notifyListeners();
 }
}