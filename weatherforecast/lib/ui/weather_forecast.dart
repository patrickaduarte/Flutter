import 'package:flutter/material.dart';
import 'package:weatherforecast/pages/screen_city.dart';
import 'package:weatherforecast/transition/take_weather.dart';
import 'package:weatherforecast/util/util.dart' as util;

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  String _insertedCity;

  Future _openNewScreen(BuildContext context) async {
    Map result = await Navigator
    .of(context)
    .push(new MaterialPageRoute<Map>(builder: (BuildContext context){
        return new ChangeCity();
    }));
    if (result != null && result.containsKey('city')){
      _insertedCity = result['city'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu),
            onPressed: () => _openNewScreen(context),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/umbrella.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            )
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "${_insertedCity == null ? util.myCity : _insertedCity}",
                  style: styleCity(),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/light-rain.png")
          ),
          updateWeather(_insertedCity)
        ],
      ),
    );
  }

  Widget updateWeather(String city){
    return FutureBuilder(
      future: 
        takeWeather(util.appId, city == null ? util.myCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if (snapshot.hasData){
          Map content = snapshot.data;
          return Container(
            margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(content['main']['temp'].toString() + " °C",
                    style: styleTemp(),
                  ),
                  subtitle: ListTile(
                  title: Text("Humidade: ${content['main']['humidity'].toString()}\n"
                    "Min: ${content['main']['temp_min'].toString()} °C\n"
                    "Max: ${content['main']['temp_max'].toString()} °C",
                    style: extraTemp(),
                    ),
                  ),
                )
              ],
            )
          );
        }else{
          return Container(
            child: Text("Fail"),
          );
        }
      });
  }
}

TextStyle extraTemp(){
  return TextStyle(
    color: Colors.white70,
    fontStyle: FontStyle.normal,
    fontSize: 19.0
  );
}

TextStyle styleCity(){
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.italic,
    fontSize: 22.9
  );
}

TextStyle styleTemp(){
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}