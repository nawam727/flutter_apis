import 'package:flutter/material.dart';
//import 'package:gess_game/pages/home_page.dart';

class WroneGessPage extends StatelessWidget {
  final int myNumber;

  const WroneGessPage({super.key, required this.myNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 218, 134, 149),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                "Sorry wrong gess,Please try again ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("try agian"),
            ),
          ],
        ),
      ),
    );
  }
}
