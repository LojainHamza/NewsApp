import 'package:flutter/material.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/news/news_details_bottom_sheet.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_app/model/news_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatefulWidget {
  News news;
  NewsItem({required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return InkWell(
      onTap: (){
        showNewsDetailsBottomSheet();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.01
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width*0.02,
          vertical: height*0.01
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).indicatorColor,
            width: 2
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                height: height*0.25,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: widget.news.urlToImage??'',
                placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.greyColor)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(height: height*0.01),
            Text(widget.news.title??'',style: Theme.of(context).textTheme.headlineLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('${AppLocalizations.of(context)!.by}: ${widget.news.author??''}',style: AppStyles.medium12LightGrey)),
                Text(
                  timeago.format(
                    DateTime.parse(widget.news.publishedAt!),
                    locale: languageProvider.appLanguage,
                  ),
                  style: AppStyles.medium12LightGrey,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  void showNewsDetailsBottomSheet() {
    var themeProvider = Provider.of<AppThemeProvider>(context,listen: false);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: themeProvider.appTheme == ThemeMode.light? AppColors.blackColor:AppColors.whiteColor,
          child: NewsDetailsBottomSheet(news: widget.news),
        );
      },
    );
  }

}
