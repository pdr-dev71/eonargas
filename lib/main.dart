import 'package:flutter/material.dart';
import 'package:narguilera/home.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nargas Splash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, String? title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _splashNarga();
  }
}

Widget _splashNarga() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        imageBackground: const AssetImage("assets/eonarga_splash.jpeg"),
        seconds: 5,
        navigateAfterSeconds: const VideoDemo(),
        loaderColor: Colors.transparent,
      ),
    ],
  );
}
