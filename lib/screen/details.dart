
import 'package:animation_1/models/Trip.dart';
import 'package:animation_1/shared/heart.dart';
import 'package:flutter/material.dart';
// import 'package:lipsum/lipsum.dart' as lipsum;

class DetailScreen extends StatelessWidget {
  final Trip trip;
   DetailScreen({super.key,required this.trip});

  @override
  Widget build(BuildContext context) {
   final size=MediaQuery.of(context).size;

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          ClipRRect(
            child: Hero(
             tag: 'location-img-${trip.img}',

              child: Image.asset('images/${trip.img}',
              height: 360,
              width: 400,
            
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              ),
            ),
          ),
          SizedBox(height: 30,),
          ListTile(
            title: Text(trip.title,
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.grey[800]
            ),
            ),
            subtitle: Text('${trip.nights} nights stay for onlay \$${trip.price}',
            style: TextStyle(letterSpacing: 1),),
            trailing: Heart(),
          ),
          // Padding(
          //   padding: EdgeInsets.all(18),
          // child: Text(
          //   lipsum.createText(numParagraphs: 1,numSentences: 3,),
          //   style: TextStyle(color: Colors.grey[600],
          //   height: 1.4),

          // ),
          
          //  )
        ],
      ),

    );
  }
}