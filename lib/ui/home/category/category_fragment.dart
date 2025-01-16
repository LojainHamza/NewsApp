import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/assets_manager.dart';

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.welcome,style: Theme.of(context).textTheme.headlineMedium),
          Text(AppLocalizations.of(context)!.here_is_some_news_for_you,style: Theme.of(context).textTheme.headlineMedium),
          Expanded(child: ListView.separated(
              itemBuilder: (context,index){
                return Stack(
                  children: [
                    Image.asset(AssetsManager.generalLight),
                    Container(
                      color:AppColors.greyColor,
                      child: Text('View All'),)
                  ],
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(
                  height: height*0.02,
                );
              },
              itemCount: 8))
        ],
      ),
    );
  }
}
