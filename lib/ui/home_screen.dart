import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home/category/category_fragment.dart';
import 'package:news_app/ui/home/search/search_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'home/drawer/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/source_response.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  bool isSearching = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.isSearching = true;
              setState(() {});
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
      ),
      body: widget.isSearching
          ? SearchWidget(source: null) // تمرير null للإشارة إلى جميع الأخبار
          : (selectedCategory == null
          ? CategoryFragment(onViewAllClicked: onViewAllClicked)
          : CategoryDetails(category: selectedCategory!)),
    );
  }

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClicked() {
    selectedCategory = null;
    widget.isSearching = false;
    Navigator.pop(context);
    setState(() {});
  }
}
