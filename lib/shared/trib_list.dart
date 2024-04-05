import 'package:animation_1/models/Trip.dart';
import 'package:animation_1/screen/details.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List <Widget> _tripTitles=[];
  final GlobalKey<AnimatedListState> _listKey=GlobalKey<AnimatedListState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
          _addTrips();

      
    });
    // TODO: implement initState
    super.initState();
  }

void _addTrips(){


  List <Trip> _trips=[
     Trip(title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),

  ];
  Future ft=Future(() {});

  _trips.forEach((Trip trib) {
    ft=ft.then((_){
      return Future.delayed(const Duration(milliseconds: 100),(){
        
    _tripTitles.add(_buildTitle(trib)) ;
    _listKey.currentState?.insertItem(_tripTitles.length -1);


      });
    });



  });

  
}

Widget _buildTitle(Trip trib){
  return  ListTile(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(trip:trib,)));
      
    },
    contentPadding: EdgeInsets.all(25),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget> [
        Text(
          '${trib.nights} night',
          style: TextStyle(fontSize: 14,
          fontWeight: FontWeight.bold),
        ),
        Text(trib.title,style: 
        TextStyle(
          fontSize: 18,
          color: Colors.grey
        ),)

      ],
    ),
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Hero(
        tag: 'location-img-${trib.img}',
        child: Image.asset(
          'images/${trib.img}',height: 50,),
      ),
    ),
    trailing: Text('\$${trib.price}'),
  );
}

Tween<Offset> _offset=Tween(begin: Offset(1, 0),end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    
    return AnimatedList( 
      key: _listKey,
      initialItemCount: _tripTitles.length,    
    itemBuilder: (context ,index,animation){
      return
      SlideTransition(
        child:       _tripTitles[index],
 
        position: animation.drive(_offset)
        
      );
      
    });
  }

}