import 'package:covid_19_updates/widgets/appBar.dart';
import 'package:flutter/material.dart';

import '../datasource.dart';

class QnA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
          title: "COVID-19 Updates",
          button: Container(),
      ) ,
      body: ListView.builder(
        itemCount: Datasource.qnA.length,
        itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0),
          child: ExpansionTile(
            title: Text(Datasource.qnA[index]['question'],style: TextStyle(fontSize: 16),),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                child: Text(Datasource.qnA[index]['answer']),
              ),
            ],
          ),
        );
      }),
    );
  }
} 