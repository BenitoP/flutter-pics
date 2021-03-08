import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  void fetchImage() async {
    final response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    ImageModel imageModel = new ImageModel.fromJson(json.decode(response.body));
    setState(() {
      counter++;
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Send Pics!'),
          ),
          body: ImageList(images),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
            tooltip: 'Increment Counter',
            child: const Icon(Icons.add),
          )),
    );
  }
}
