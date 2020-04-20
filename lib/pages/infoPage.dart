import 'package:covid_19_updates/pages/qna.dart';
import 'package:covid_19_updates/pages/symptoms.dart';
import 'package:covid_19_updates/widgets/appBar.dart';
import 'package:covid_19_updates/widgets/bottomBar.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'def.dart';
import 'myths.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  Color greyIcon = Colors.grey;
  Color redIcon = Colors.red;
  int index = 1;
  
  @override
  Widget build(BuildContext context) {
       var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(
      title: "          COVID-19 Updates",
      button: IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.light
          ? Icons.lightbulb_outline
          : Icons.wb_sunny),
            onPressed: () {
        setState(() {
          DynamicTheme.of(context).setBrightness(
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light);
        });
            }),
          ),
         body:  
        Container(
    height: screenHeight,
    child: Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Def()));
          },
          child: CardButton(title: "What is COVID-19?",img: "assets/images/1.jpg",),
        ),
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Symptoms()));
            },
            child: CardButton(title: "Symptoms and Prevention",img: "assets/images/4.jpg",)),
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Myths()));
            },
            child: CardButton(title: "MYTHS",img: "assets/images/3.jpg",)),
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QnA()));
            },
            child: CardButton(title: "QNA",img: "assets/images/2.jpg",))
      ],
    ),
        ),
        bottomNavigationBar: Bottombar(),
      );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    Key key,
    @required this.title,
    @required this.img,
  }) : super(key: key);

  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
   var screenWidth = MediaQuery.of(context).size.width;
   var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 8.0),
      child: Container(
          width: screenWidth, height: screenHeight/9,
          
          child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  offset: Offset(2.0, 2.0),
                  spreadRadius: 1.0,
                  blurRadius: 5.0)
            ]),),
         ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: Image.asset(img,
              fit: BoxFit.cover, width: screenWidth/1.8, )),

              Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),),
              Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.0,
                      
                      color: Colors.white,
                      ),
                ),
                
              ],
            ),
          ))
      ],
          ),
        ),
    );
  }
}
