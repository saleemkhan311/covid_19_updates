import 'package:covid_19_updates/main.dart';
import 'package:covid_19_updates/pages/homepage.dart';
import 'package:covid_19_updates/pages/infoPage.dart';
import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
 final int index;

  const Bottombar({Key key, this.index}) : super(key: key);
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {


  Color greyIcon = Colors.grey;
  Color redIcon = Colors.red;
  

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10.0,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
              child: Text("Tracker",style: TextStyle(color: index == 0 ? redIcon : greyIcon,fontWeight: FontWeight.bold),),
             
              onPressed: () {
                 index!=0?Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())):null;
                setState(() {
                
                  index = 0;
                });
              }
              
              ),
          FlatButton(
              child: Text("Info",style: TextStyle(color: index == 1 ? redIcon : greyIcon,fontWeight: FontWeight.bold),),
              
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Info()));
                index = 1;
              });
            }
            
            ),
         
        ],
      ),
    );
  }
}