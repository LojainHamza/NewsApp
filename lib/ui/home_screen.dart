import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

import 'home/category/category_details.dart';
import 'home/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: Theme.of(context).textTheme.headlineLarge),
      ),
      drawer: const Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(),
      ),
      body: CategoryDetails(),
    );
  }
}
