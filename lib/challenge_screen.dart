import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spt/challenge_provider.dart';

class ChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challengeProvider = Provider.of<ChallengeProvider>(context);
    final challenges = challengeProvider.challenges;

    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges'),
      ),
      body: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final challenge = challenges[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
               
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                color: const Color.fromARGB(255, 220, 216, 216)),
              child: ListTile(
                title: Text(challenge.title),
                 leading:  challenge.isselected? Icon(Icons.check_circle,color: Colors.teal,):IconButton(onPressed: (){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  dismissDirection: DismissDirection.up,
                  behavior: SnackBarBehavior.floating,
                    content: Text("Task is selected")));
                  challengeProvider.markasselectd(index);
                 }, icon: Icon(Icons.circle)),
                trailing: challenge.isComplete
                    ? Icon(Icons.check, color: Colors.green)
                    : IconButton(
                        icon: Icon(Icons.check_box_outline_blank),
                        onPressed: () {
                          challengeProvider.markAsComplete(index);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Congratulations!'),
                                content: Text('You completed the challenge.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
