import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category/source_name_item.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: TabBar(
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          tabAlignment: TabAlignment.start,
          dividerColor: AppColors.transparentColor,
          indicatorColor: Theme.of(context).indicatorColor,
          isScrollable: true,
            tabs: widget.sourcesList.map((source){
              return SourceNameItem(source: source, isSelected: selectedIndex==widget.sourcesList.indexOf(source));
            }).toList())
    );
  }
}
