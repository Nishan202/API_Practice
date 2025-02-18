import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  Map<String, dynamic> mData = {};
  @override
  void initState() {
    super.initState();
    getApiValue();
  }

  void getApiValue() async {
    // api client call
    String url = 'https://dummyjson.com/quotes';

    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      mData = jsonDecode(response.body);
      setState(() {
        
      });
   } else{
      print("status code: ${response.statusCode}");
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API call"),),
      body: mData.isNotEmpty ? ListView.builder(itemCount: mData['quotes'].length, itemBuilder: (ctx, index){
        return ListTile(
          title: Text(mData['quotes'][index]['author'], style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(mData['quotes'][index]['quote']),
        );
      }) : Container(),
    );
  }
}