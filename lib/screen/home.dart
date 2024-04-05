import 'package:animation_1/shared/screen_title.dart';
import 'package:animation_1/shared/trib_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/bg.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topLeft
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: <Widget> [
            SizedBox(height: 30,),
            SizedBox(
              height: 160,
              width: 355,
              child: ScreenTitle(text: 'sabrin omar',),

            ),
                         Flexible(child: TripList() 
             )

          ],
        ),
        


      ),

    );
  }
}