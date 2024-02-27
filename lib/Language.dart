import 'package:flutter/material.dart';

import 'AR.dart';
import 'AdminLogin.dart';
import 'EN.dart';
import 'FR.dart';

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set your desired background color here

      body:
SingleChildScrollView(

    child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Shark-Net',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10), // Add spacing between the main title and subtitle
                          Text(
                            'By Hani Berriche',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white, // Set your desired subtitle text color here
                              fontFamily: 'YourSubtitleFontFamily', // Set your desired subtitle font family here
                              fontWeight: FontWeight.normal, // Set your desired subtitle font weight here
                            ),
                          ),
                          // ... Rest of your code
                        ],
                      ),


                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AdminLogin()),
                          );
                          print('Tapped on the second image');
                        },
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundImage: AssetImage('assets/images/berr.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Middle Section with three rectangles
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EN()),
                        );
                        print('Tapped on the first rectangle');
                      },
                      child: Container(
                        width: 380.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10.0), // Add BorderRadius
                        ),
                        child: Center(
                          child:
                          Text(
                            'English ',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white, // Set your desired text color here
                              fontFamily: 'YourFontFamily', // Set your desired font family here
                              fontWeight: FontWeight.bold, // Set your desired font weight here
                            ),
                          ),                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FR()),
                        );
                        print('Tapped on the second rectangle');
                      },
                      child: Container(
                        width: 380.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child:
                          Text(
                            'Français ',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white, // Set your desired text color here
                              fontFamily: 'YourFontFamily', // Set your desired font family here
                              fontWeight: FontWeight.bold, // Set your desired font weight here
                            ),
                          ),                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AR()),
                        );
                        print('Tapped on the third rectangle');
                      },
                      child: Container(
                        width: 380.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child:
                          Text(
                            'العربية ',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white, // Set your desired text color here
                              fontFamily: 'YourFontFamily', // Set your desired font family here
                              fontWeight: FontWeight.bold, // Set your desired font weight here
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
