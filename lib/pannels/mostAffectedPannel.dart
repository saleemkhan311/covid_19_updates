import 'package:covid_19_updates/widgets/customcard.dart';
import 'package:flutter/material.dart';

class MostAffectedPannel extends StatelessWidget {
  final List regionalData;

  const MostAffectedPannel({Key key, this.regionalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: RegionalBanner(regionalData: regionalData),
    );
  }
}

class RegionalBanner extends StatelessWidget {
  const RegionalBanner({
    Key key,
    @required this.regionalData,
  }) : super(key: key);

  final List regionalData;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, right: 13),
        child: regionalData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                   height: height / 6,
                            width: width / 4,
                child: CustomCard(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.network(
                      regionalData[index]['countryInfo']['flag'].toString(),
                      height: height / 3,
                      width: width / 4,
                    ),
                    Text(regionalData[index]['country'].toString(),
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'Deaths:  ' +
                                regionalData[index]['deaths'].toString(),
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Active: ' + regionalData[index]['active'].toString(),
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )),
              );
            }),
      ),
    );
  }
}
