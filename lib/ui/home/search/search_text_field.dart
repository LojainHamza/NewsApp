import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchTextController = TextEditingController();

  void clearText() {
    searchTextController.clear();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchTextController,
      style: TextStyle(color: Theme.of(context).indicatorColor),
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.search,
        hintStyle: TextStyle(color: Theme.of(context).indicatorColor),
        prefixIcon: Icon(Icons.search,color: Theme.of(context).indicatorColor),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear,color: Theme.of(context).indicatorColor),
          onPressed: clearText,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).indicatorColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).indicatorColor),
        ),
      ),
    );
  }
}
