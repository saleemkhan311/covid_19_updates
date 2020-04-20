import 'package:covid_19_updates/pannels/global.dart';
import 'package:covid_19_updates/pannels/mostAffectedPannel.dart';
import 'package:covid_19_updates/widgets/appBar.dart';
import 'package:covid_19_updates/widgets/bottomBar.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'countrystats.dart';


class Home extends StatefulWidget { 
  

  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  Map worldData;
  fetchWorldData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');

    if (response.statusCode == 200) {
      setState(() {
        worldData = json.decode(response.body);
      });
    } else {
      throw Exception("Internet Problem");
    }
  }

  var regionalData;

  fetchRegionalData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');

    if (response.statusCode == 200) {
      setState(() {
        regionalData = json.decode(response.body);
      });
    } else {
      throw Exception("Internet Problem");
    }
  }

  @override
  void initState() {
    fetchWorldData();
    fetchRegionalData();
    super.initState();
  }

  Future<Null> refresh() async{
    await Future.delayed(Duration(seconds:1 ));
    setState(() {
      fetchWorldData();
      fetchRegionalData();
      return null;
    });
  }

  

 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "COVID-19 Updates",
        drawer: IconButton(icon: Icon(Icons.menu), onPressed: () =>_scaffoldKey.currentState.openDrawer()),
        button: IconButton(icon: Icon(Theme.of(context).brightness == Brightness.light?Icons.lightbulb_outline:Icons.wb_sunny), onPressed: (){
          setState(() {
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          });
        })
      ),
            drawer: Drawer(
              child: ListView(children: <Widget>[
                UserAccountsDrawerHeader(

                  accountName: Text("Saleem Khan"), 
                  accountEmail: Text("Spalal610@gmail.com"), 
                  currentAccountPicture: Image.network("https://instagram.fkhi4-1.fna.fbcdn.net/v/t51.2885-19/s150x150/80831015_2511787145728378_3899466929059921920_n.jpg?_nc_ht=instagram.fkhi4-1.fna.fbcdn.net&_nc_ohc=ufipP-AebE8AX_a1ULl&oh=0ac69708f71faf50f6890d746ff294e8&oe=5EC645B5"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Follow on Instagram",style: TextStyle(fontSize: 25.0,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:35.0,vertical: 8.0),
                    child: Text("@dev_saleem",style: TextStyle(fontSize: 25.0,),),
                  ),
                  
              ],),
            ),
    bottomNavigationBar: Bottombar(),
      body: worldData == null
          ? Center(
              child: Center(child: CircularProgressIndicator()),
            )
          : RefreshIndicator(
            onRefresh: refresh,
                      child: SingleChildScrollView(
              
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Worldwide",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )
                              ]),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        ActionChip(
                            elevation: 5.0,
                            backgroundColor: Colors.blueAccent,
                            label: Text(
                              "Regional",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              
                              setState(() {
                                
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryStats()));
                              });
                            })
                      ],
                    )),
                    GlobalPannel(
                      worldData: worldData,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Text(
                        "Most Affected Countries",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )
                            ]),
                      ),
                    ),
                    
                    regionalData==null?CircularProgressIndicator():MostAffectedPannel(
                      regionalData: regionalData,
                    )
                  ],
                ),
              ),
          ),
    );
  }
}
