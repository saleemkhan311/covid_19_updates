import 'package:flutter/material.dart';

class GlobalPannel extends StatelessWidget {
  final Map worldData;

  const GlobalPannel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String active = worldData['active'].toString();
    String deaths = worldData['deaths'].toString();
    String todayCases = worldData['todayCases'].toString();
    String todayDeaths = worldData['todayDeaths'].toString();
    String recovered = worldData['recovered'].toString();
    String critical = worldData['critical'].toString();
    String totalcases = worldData['cases'].toString();
    String affectedCountries = worldData['affectedCountries'].toString();

    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenWidth / 1.8,
      child: PageView(
        controller: PageController(initialPage: 2),
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: WorldBanner(
                  img: "assets/images/5.jpg",
                  name: "Critical",
                  count: critical)),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: WorldBanner(
                img: "assets/images/4.jpg",
                name: "Recovered",
                count: recovered),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: WorldBanner(
              img: "assets/images/6.jpg",
              name: "Active Cases",
              count: active,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: WorldBanner(
                  img: "assets/images/2.jpg",
                  name: "Total Cases",
                  count: totalcases)),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: WorldBanner(
                  img: "assets/images/3.jpg", name: "Deaths", count: deaths)),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: WorldBanner(
                  img: "assets/images/1.jpg",
                  name: "Recent Deaths",
                  count: todayDeaths)),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: WorldBanner(
                  img: "assets/images/7.jpg",
                  name: "New Cases",
                  count: todayCases)),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: WorldBanner(
                  img: "assets/images/9.jpg",
                  name: "Affected Countries",
                  count: affectedCountries))
        ],
      ),
    );
  }
}

class WorldBanner extends StatelessWidget {
  const WorldBanner({
    @required this.name,
    @required this.img,
     this.count,
     
    Key key,
  }) : super(key: key);
  final String name;
  final String img;
  final String count;


  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width ;
    return Stack( children: <Widget>[
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  offset: Offset(2.0, 2.0),
                  spreadRadius: 1.0,
                  blurRadius: 5.0)
            ]),
      ),
      ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: Image.asset(img,
              fit: BoxFit.cover, width: screenWidth, height: screenWidth)),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
      Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 45.0,
                      fontFamily: 'noodel',
                      color: Colors.white,
                      ),
                ),
                Text(
                  count,
                  style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'noodel',
                      color: Colors.white,
                      ),
                )
              ],
            ),
          ))
    ]);
  }
}
