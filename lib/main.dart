import 'package:covid_19_updates/pages/homepage.dart';
import 'package:covid_19_updates/pages/infoPage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        return ThemeData(
          fontFamily: 'Rounded_Elegance',
            brightness: brightness ,
            primaryColor: Colors.red,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Colors.grey[700]
                :Colors.white );
      },
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'COVID-19 Updates',
            theme: theme,
            home: Home());
      },
    );
  }
}

class PageManager extends StatefulWidget {
  @override
  _PageManagerState createState() => _PageManagerState();
}

Color greyIcon = Colors.grey;
  Color redIcon = Colors.red;
  int index = 0;
  final List<Widget> screens = [
    Home(),
    Info()];
  Widget currentScreen = Home();
  final PageStorageBucket pagebucket = PageStorageBucket();


class _PageManagerState extends State<PageManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
          body: PageStorage(
        bucket: pagebucket,
        child: currentScreen,

      ),
      
    );
  }
}
