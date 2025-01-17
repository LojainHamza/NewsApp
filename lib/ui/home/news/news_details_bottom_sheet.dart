import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class NewsDetailsBottomSheet extends StatefulWidget {
  News news;
  NewsDetailsBottomSheet({required this.news});

  @override
  State<NewsDetailsBottomSheet> createState() => _NewsDetailsBottomSheetState();
}

class _NewsDetailsBottomSheetState extends State<NewsDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
        vertical: height*0.02
      ),
      child: Column(
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
          SizedBox(height: height*0.02),
          Text(widget.news.content??'',style: themeProvider.appTheme == ThemeMode.light?AppStyles.medium14White:AppStyles.medium14Black),
          SizedBox(height: height*0.02),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: width*0.28,
                vertical: height*0.015
              ),
              backgroundColor: themeProvider.appTheme==ThemeMode.light?AppColors.whiteColor:AppColors.blackColor
            ),
              onPressed: (){
              // todo: pass the news url to be web viewed
              },
              child: Text(AppLocalizations.of(context)!.view_full_article,style: themeProvider.appTheme==ThemeMode.light?AppStyles.bold16Black:AppStyles.bold16White))
        ],
      ),
    );
  }
}
