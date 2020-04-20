import 'package:covid_19_updates/widgets/appBar.dart';
import 'package:covid_19_updates/widgets/customcard.dart';
import 'package:flutter/material.dart';

import '../datasource.dart';

class Def extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "COVID-19 Updates",
          button: Container(),
          
      ),
      body: Container(
        height: MediaQuery.of(context).size.height/2,
        child: CustomCard(
                  child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("What is COVID-19?",style: TextStyle(fontSize: 20,),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0,),
                child: Text(Datasource.def,style: TextStyle(fontSize: 15,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}