import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di_inject.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';
import 'package:news_app/ui/home/news/cubit/news_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/utils/app_colors.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = getIt<NewsViewModel>();   // field injection

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.greyColor));
          } else if (state is NewsErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(state.errorMessage,
                      style: Theme.of(context).textTheme.headlineLarge),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNewsBySourceId(widget.source.id ?? '');
                      },
                      child: Text(AppLocalizations.of(context)!.try_again,
                          style: Theme.of(context).textTheme.headlineLarge))
                ],
              ),
            );
          } else if (state is NewsSuccessState) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: state.newsList[index]);
                },
                itemCount: state.newsList.length);
          }
          return Container();
        });

    // FutureBuilder<NewsResponse?>(
    //   future: APIManager.getNewsBySourceId(widget.source.id??''),
    //   builder: (context,snapshot){
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return const Center(child: CircularProgressIndicator(color: AppColors.greyColor));
    //     }else if(snapshot.hasError){
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(AppLocalizations.of(context)!.sth_went_wrong,style: Theme.of(context).textTheme.headlineLarge),
    //             ElevatedButton(
    //               onPressed: (){
    //               APIManager.getNewsBySourceId(widget.source.id??'');
    //               setState(() {
    //
    //               });
    //             }, child: Text(AppLocalizations.of(context)!.try_again,style: Theme.of(context).textTheme.headlineLarge))
    //           ],
    //         ),
    //       );
    //     }else if(snapshot.data!.status != 'ok'){
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data!.message!, style: Theme.of(context).textTheme.headlineLarge),
    //             ElevatedButton(
    //               onPressed: (){
    //               APIManager.getNewsBySourceId(widget.source.id ?? '');
    //               setState(() {
    //
    //               });
    //             }, child: Text(AppLocalizations.of(context)!.try_again,style: Theme.of(context).textTheme.headlineLarge))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data!.articles!;
    //     return ListView.builder(
    //         itemBuilder: (context,index){
    //           return NewsItem(news: newsList[index]);
    //         },
    //     itemCount: newsList.length);
    //   });
  }
}
