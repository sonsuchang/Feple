import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget{
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'City name',
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 30.0
                ),
              )
            ],
          )
        )
      ),
    );
  }
}