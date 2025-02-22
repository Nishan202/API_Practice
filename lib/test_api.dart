import 'dart:convert';

import 'package:api_practice/model/products/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  @override
  void initState() {
    super.initState();
    // getApiValue();
  }

  Future<DataModel?> getApiValue() async {
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
      DataModel mData = DataModel.fromJson(jsonDecode(response.body));
      return mData;
    } else{
      print("Status code: ${response.statusCode}");
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API call"),),
      // body: mData!=null ? mData!.products!.isNotEmpty ? ListView.builder(itemCount: mData!.products!.length, itemBuilder: (ctx, index){
      //   return ListTile(
      //     // leading: Image.network(mData!.products![index].images!=null ?? Text('No ima),
      //     title: Text(mData!.products![index].title ?? "No title", style: TextStyle(fontWeight: FontWeight.bold),),
      //     subtitle: Text(mData!.products![index].description ?? 'No description'),
      //   );
      // }) : Center(child: Text('No data found!!'),) : Container(),


      // Products
      body: FutureBuilder(future: getApiValue(), builder: (ctx, snap){
        if(snap.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snap.hasError){
          return Center(child: Text('${snap.error}'),);
        }
        if (snap.hasData) {
              return snap.data != null
                  ? snap.data!.products!.isNotEmpty
                      ? ListView.builder(
                          itemCount: snap.data!.products!.length,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: snap.data!.products![index].thumbnail != null ? Image.network(snap.data!.products![index].thumbnail!) : Container(),
                                  title: Text(snap.data!.products![index].title ?? "No title",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(snap.data!.products![index].description ?? 'No description'),
                                  trailing: Text(snap.data!.products![index].meta!.createdAt!.split("T")[0]),
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: snap.data!.products![index].images!.length, itemBuilder: (_, childIndex){
                                    return Image.network(snap.data!.products![index].images![childIndex]);
                                  }),
                                )
                              ],
                            );
                          })
                      : Center(child: Text('No data found!!'),)
                  : Container();
            }
        return Container();


        // Users

      }),
    );
  }
}