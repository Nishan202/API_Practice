import 'package:api_practice/bloc/weather_bloc.dart';
import 'package:api_practice/model/api_helper.dart';
import 'package:api_practice/screens/home_screen.dart';
import 'package:api_practice/test_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(create: (context) => WeatherBloc(apiHelper: ApiHelper()), child: HomeScreen(),),
    );
  }
}