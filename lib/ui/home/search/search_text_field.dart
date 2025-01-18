import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onSearch;

  const SearchTextField({super.key, required this.onSearch});

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchTextController = TextEditingController();

  void clearText() {
    searchTextController.clear();
    widget.onSearch('');
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: TextFormField(
        controller: searchTextController,
        style: TextStyle(color: Theme.of(context).indicatorColor),
        onChanged: (value) {
          widget.onSearch(value);
        },
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.search,
          hintStyle: TextStyle(color: Theme.of(context).indicatorColor),
          prefixIcon: Icon(Icons.search, color: Theme.of(context).indicatorColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Theme.of(context).indicatorColor),
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
      ),
    );
  }
}
