import 'dart:convert';
import 'package:covid_19_updates/widgets/appBar.dart';
import 'package:covid_19_updates/widgets/bottomBar.dart';
import 'package:covid_19_updates/widgets/customcard.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CountryStats extends StatefulWidget {
  @override
  _CountryStatsState createState() => _CountryStatsState();
}

class _CountryStatsState extends State<CountryStats> {
  var regionalData;

  fetchRegionalData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');

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
    
    fetchRegionalData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor: Colors.red,
        onPressed: () {
          showSearch(context: context, delegate: Search(regionalData));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppBar(
          title: "COVID-19 Updates",
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
              })),
      body: regionalData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(itemBuilder: (context, index) {
              var width = MediaQuery.of(context).size.width;
              var height = MediaQuery.of(context).size.height;
              return Container(
                height: height / 4,
                child: CustomCard(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          regionalData[index]['countryInfo']['flag'].toString(),
                          width: width / 2,
                          height: height / 6,
                        ),
                        Text(regionalData[index]['country'].toString(),
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'Total Cases:  ' +
                                regionalData[index]['cases'].toString(),
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold)),
                        Text(
                            'Recent Cases:  ' +
                                regionalData[index]['todayCases'].toString(),
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Active: ' + regionalData[index]['active'].toString(),
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Recovered: ' +
                              regionalData[index]['recovered'].toString(),
                          style: TextStyle(
                              color: Colors.cyan, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Total Deaths: ' +
                              regionalData[index]['deaths'].toString(),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Critical: ' +
                              regionalData[index]['critical'].toString(),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Recent Deaths: ' +
                              regionalData[index]['todayDeaths'].toString(),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                )),
              );
            }),
      bottomNavigationBar: Bottombar(),
    );
  }
}

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          return Container(
            height: height / 4,
            child: CustomCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      suggestionList[index]['countryInfo']['flag'].toString(),
                      width: width / 2,
                      height: height / 6,
                    ),
                    Text(suggestionList[index]['country'].toString(),
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'Total Cases:  ' +
                            suggestionList[index]['cases'].toString(),
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold)),
                    Text(
                        'Recent Cases:  ' +
                            suggestionList[index]['todayCases'].toString(),
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold)),
                    Text(
                      'Active: ' + suggestionList[index]['active'].toString(),
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Recovered: ' +
                          suggestionList[index]['recovered'].toString(),
                      style: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Total Deaths: ' +
                          suggestionList[index]['deaths'].toString(),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Critical: ' +
                          suggestionList[index]['critical'].toString(),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Recent Deaths: ' +
                          suggestionList[index]['todayDeaths'].toString(),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )),
          );
        });
  }
}
