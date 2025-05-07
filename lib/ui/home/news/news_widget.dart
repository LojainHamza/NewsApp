import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: APIManager.getNewsBySourceId(widget.source.id??''),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: AppColors.greyColor));
          }else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.sth_went_wrong,style: Theme.of(context).textTheme.headlineLarge),
                  ElevatedButton(
                    onPressed: (){
                    APIManager.getNewsBySourceId(widget.source.id??'');
                    setState(() {

                    });
                  }, child: Text(AppLocalizations.of(context)!.try_again,style: Theme.of(context).textTheme.headlineLarge))
                ],
              ),
            );
          }else if(snapshot.data!.status != 'ok'){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!, style: Theme.of(context).textTheme.headlineLarge),
                  ElevatedButton(
                    onPressed: (){
                    APIManager.getNewsBySourceId(widget.source.id ?? '');
                    setState(() {

                    });
                  }, child: Text(AppLocalizations.of(context)!.try_again,style: Theme.of(context).textTheme.headlineLarge))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
              itemBuilder: (context,index){
                return NewsItem(news: newsList[index]);
              },
          itemCount: newsList.length);
        });
  }
}
