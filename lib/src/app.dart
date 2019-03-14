// Import flutter helper library
import 'package:flutter/material.dart';
// use show to grab the get method only
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

// Create a class that wil lbe our custom widget
// This class must extend the 'StatelessWidget' base class
class App extends StatefulWidget {
  // New Instance of Appstate and cache it
  createState() {
    return AppState();
  }
}

// setState is from State<App>
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() => images.add(imageModel));
  }
  // Must define a 'build' method that returns
  // the widgets that *widget" will show
  Widget build(context) {
    return  MaterialApp(
      home: Scaffold(
        floatingActionButton:FloatingActionButton(
          // We can reference fetchImage if we are return a functionfrom a empty function.
          onPressed: fetchImage,
          child: Icon(Icons.add)
        ),
        appBar: AppBar(
          title: Text("Let's see some images"),
        ),
        body: ImageList(images),
      ),
    );
  }
}


