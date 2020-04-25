import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

var openWeatherMapApiKey = 'e542f831aca4693ae9887bddb0efe71d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$openWeatherMapApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData: weatherData),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.amberAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
