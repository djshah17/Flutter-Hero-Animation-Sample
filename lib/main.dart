import 'package:flutter/material.dart';
import 'details.dart';
import 'list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListPage(),
      onGenerateRoute: generateRoute,
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/ListScreen':
        return MaterialPageRoute(builder: (_) => ListPage());
      case '/DetailsScreen':
        return MaterialPageRoute(
          builder: (_) => DetailsPage(
            country: args,
          ),
        );
      default:
        return null;
    }
  }
}
