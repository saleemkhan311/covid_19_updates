import 'package:covid_19_updates/widgets/appBar.dart';
import 'package:covid_19_updates/widgets/customcard.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  final List<Widget> symptoms = [
    Symps(img: "assets/images/cough.png"),
    Symps(img: "assets/images/fever.png"),
    Symps(img: "assets/images/headache.png"),
    Symps(img: "assets/images/sorethrot.png"),
  ];

  final List<Widget> prevention = [
    Symps(img: "assets/images/mask.png" ),
    Symps(img: "assets/images/cover.png"),
    Symps(img: "assets/images/hands.png", ),
    Symps(img: "assets/images/avoid.png", ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "COVID-19 Updates",
        button: Container(),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Symptoms",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(150, 0, 0, 0),
                      )
                    ]),
              ),
            
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days."),
            ),
            CustomCard(
                          child: Container(
                child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(10.0),
                    crossAxisSpacing: 1,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.35),
                    crossAxisCount: 2,
                    children: symptoms),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Prevention",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(150, 0, 0, 0),
                      )
                    ]),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Protect yourself and others around you by knowing the facts and taking appropriate precautions. Follow advice provided by your local public health agency."),
            ),
            CustomCard(
                          child: Container(
                child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(10.0),
                    crossAxisSpacing: 5,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.35),
                    crossAxisCount: 2,
                    children: prevention),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Symps extends StatelessWidget {
  const Symps({
  
    @required this.img,
    Key key,
  }) : super(key: key);

 
  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      Column(children: <Widget>[
        CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,8.0,15.0,8.0),
                    child: Container(
                      
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 3.6,
                      width: MediaQuery.of(context).size.width / 2.7,
                    ))),
                  ),
        ),
       
      ])
    ]);
  }
}
