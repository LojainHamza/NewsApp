import 'package:flutter/material.dart';
import 'package:news_app/ui/home/search/search_text_field.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04
      ),
      child: Column(
        children: [
          SearchTextField(),
        ],
      ),
    );
  }
}
