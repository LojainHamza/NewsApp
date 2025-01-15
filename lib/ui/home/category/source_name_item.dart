import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';

class SourceNameItem extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceNameItem({required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? '',
      style: isSelected? Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.labelMedium);
  }
}
