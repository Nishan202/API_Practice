import 'dart:convert';

import 'package:api_practice/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  DataModel? mData;
  @override
  void initState() {
    super.initState();
    getApiValue();
  }

  void getApiValue() async {
    // api client call
  //   String url = 'https://dummyjson.com/quotes';

  //   http.Response response = await http.get(Uri.parse(url));

  //   if(response.statusCode == 200){
  //     mData = jsonDecode(response.body);
  //     setState(() {
        
  //     });
  //  } else{
  //     print("status code: ${response.statusCode}");
  //  }

    String url = 'https://dummyjson.com/products';
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      mData = DataModel.fromJson(jsonDecode(response.body));
      setState(() {
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API call"),),
      body: mData!=null ? mData!.products!.isNotEmpty ? ListView.builder(itemCount: mData!.products!.length, itemBuilder: (ctx, index){
        return ListTile(
          title: Text(mData!.products![index].discountPercentage.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(mData!.products![index].price.toString()),
        );
      }) : Center(child: Text('No data found!!'),) : Container(),
    );
  }
}