import 'package:flutter/material.dart';

class HiScreen extends StatelessWidget {

  static String path = "/hi";

  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/waiting.png")),
          Text(
            "Hi, I'm a Dashboard",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          Text(
            "Finish me",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black.withValues(alpha: .8)
            ),
          ),
          Icon(Icons.arrow_downward_outlined),
          GestureDetector(
            onTap: (){
              //RIGHT HERE
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
            ),
          )
        ],        
      ),
    );


  }

}