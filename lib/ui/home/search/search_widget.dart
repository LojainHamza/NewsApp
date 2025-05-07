import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/search/search_text_field.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchWidget extends StatefulWidget {
  final Source? source;

  SearchWidget({this.source});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String? query;
  Future<NewsResponse?>? newsFuture;

  @override
  void initState() {
    super.initState();
    if (widget.source == null) {
      newsFuture = APIManager.getAllNews();
    }
  }

  void updateQuery(String newQuery) {
    setState(() {
      query = newQuery;
      newsFuture = APIManager.getNewsByQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SearchTextField(onSearch: updateQuery),
        SizedBox(height: height*0.01),
        Expanded(
          child: FutureBuilder<NewsResponse?>(
            future: newsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.greyColor),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text(AppLocalizations.of(context)!.sth_went_wrong,
                          style: Theme.of(context).textTheme.headlineLarge),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            newsFuture = APIManager.getAllNews();
                          });
                        },
                        child: Text(AppLocalizations.of(context)!.try_again,
                            style: Theme.of(context).textTheme.headlineLarge),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.data?.status != 'ok') {
                return Center(
                  child: Column(
                    children: [
                      Text(snapshot.data!.message!,
                          style: Theme.of(context).textTheme.headlineLarge),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            newsFuture = APIManager.getAllNews();
                          });
                        },
                        child: Text(AppLocalizations.of(context)!.try_again,
                            style: Theme.of(context).textTheme.headlineLarge),
                      ),
                    ],
                  ),
                );
              }

              var newsList = snapshot.data?.articles ?? [];
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: newsList[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
