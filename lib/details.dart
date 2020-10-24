import 'package:flutter/material.dart';
import 'country.dart';

class DetailsPage extends StatefulWidget {
  Country country;

  DetailsPage({this.country});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Hero(
                tag: widget.country.title,
                transitionOnUserGestures: true,
                child: Text(widget.country.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white)))),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  child: Hero(
                      tag: widget.country.imagePath,
                      transitionOnUserGestures: true,
                      child: Image.asset(
                        widget.country.imagePath,
                        fit: BoxFit.cover,
                      ))),
              Container(
                  margin: EdgeInsets.all(10),
                  child:
                      Text(widget.country.desc, style: TextStyle(fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }
}
