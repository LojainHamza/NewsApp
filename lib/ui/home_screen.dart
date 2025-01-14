import 'package:flutter/material.dart';
import 'package:news_app/ui/category/category_details.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: CategoryDetails(),
    );
  }
}
