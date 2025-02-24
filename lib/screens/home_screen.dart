import 'package:api_practice/bloc/weather_bloc.dart';
import 'package:api_practice/bloc/weather_event.dart';
import 'package:api_practice/bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent());
  }
  @override
  Widget build(BuildContext context) {

    final String locationName = "Alahan Panjang";
    final String dayAndTime = "Mon, 05:30";
    final String weatherStatus = "Partly Sunny";
    final int currentTemp = 14;
    final int feelsLikeTemp = 18;
    final int highTemp = 22;
    final int lowTemp = 10;

    // Example hourly forecast data
    final List<Map<String, dynamic>> hourlyData = [
      {"time": "06:00", "icon": Icons.wb_sunny, "temp": 18},
      {"time": "07:00", "icon": Icons.wb_sunny, "temp": 19},
      {"time": "08:00", "icon": Icons.wb_sunny, "temp": 20},
      {"time": "09:00", "icon": Icons.wb_sunny, "temp": 22},
      {"time": "10:00", "icon": Icons.cloud, "temp": 23},
      {"time": "11:00", "icon": Icons.cloud, "temp": 19},
      // Add more as needed...
    ];
    return Scaffold(
      // backgroundColor: Colors.blue[50],
      appBar: AppBar(),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (ctx, state){
        if(state is WeatherLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is WeatherErrorState){
          return Center(child: Text('${state.erroMessage}'),);
        } else if(state is WeatherLoadedState){
          var weatherDataModel = state.responseData;
          return Stack(
            children: [
              // 1) Background image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/rainy_season.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 2) Main content with scroll
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40), // Top padding for status bar
                    // -- TOP BAR (LOCATION + ICON + TIME)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          // Location name
                          Expanded(
                            child: Text(
                              "Kolkata",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),

                    // Date/Time below location
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mon, 05:30',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // -- WEATHER STATUS + TEMPERATURE
                    Text(
                      'Partly sunny',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "14°C",
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Feels like + High + Low
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Feels like: 18°",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "22°",
                          style:
                              const TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "10°",
                          style:
                              const TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // -- HOURLY FORECAST
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: const [
                          Text(
                            "Hourly Forecast",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "72 Hours",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Horizontal list of hourly forecast
                    SizedBox(
                      height: 120, // fixed height for forecast cards
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: hourlyData.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final item = hourlyData[index];
                          return Container(
                            width: 60,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  item["time"],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  item["icon"],
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "${item["temp"]}°",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      }),
    );
  }
}