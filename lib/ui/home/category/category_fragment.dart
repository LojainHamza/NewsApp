import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [];
  Function onViewAllClicked;
  CategoryFragment({required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    categoriesList = CategoryModel.getCategoriesList(themeProvider.isDarkMode());
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.welcome,style: Theme.of(context).textTheme.headlineMedium),
          Text(AppLocalizations.of(context)!.here_is_some_news_for_you,style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: height*0.02),
          Expanded(child: ListView.separated(
              itemBuilder: (context,index){
                return Container(
                  child: Stack(
                    alignment: index % 2 == 0?Alignment.bottomRight:Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                          child: Image.asset(categoriesList[index].imagePath)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width*0.015,
                          vertical: height*0.01
                        ),
                        child: index % 2 == 0?
                        ToggleSwitch(
                          customWidths: [
                            width*0.3,width*0.15
                          ],
                          customWidgets: [
                            Text(AppLocalizations.of(context)!.view_all,style: Theme.of(context).textTheme.headlineLarge),
                            const CircleAvatar(
                              backgroundColor: AppColors.blackColor,
                                child: Icon(Icons.arrow_forward_ios,color: AppColors.whiteColor))
                          ],
                          cornerRadius: 20.0,
                          activeBgColors: [
                            [Theme.of(context).primaryColor],
                            [AppColors.greyColor]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: AppColors.greyColor,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          animate: true,
                          radiusStyle: true,
                          onToggle: (index1) {
                            onViewAllClicked(categoriesList[index]);
                          },
                        )
                        :ToggleSwitch(
                          customWidths: [
                            width*0.15,width*0.3
                          ],
                          customWidgets: [
                            const CircleAvatar(
                                backgroundColor: AppColors.blackColor,
                                child: Icon(Icons.arrow_back_ios,color: AppColors.whiteColor),
                            ),
                            Text(AppLocalizations.of(context)!.view_all,style: Theme.of(context).textTheme.headlineLarge)
                          ],
                          cornerRadius: 20.0,
                          activeBgColors: [
                          const [AppColors.greyColor],
                          [Theme.of(context).primaryColor]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: AppColors.greyColor,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          animate: true,
                          radiusStyle: true,
                          onToggle: (index1) {
                            onViewAllClicked(categoriesList[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(
                  height: height*0.02,
                );
              },
              itemCount: categoriesList.length))
        ],
      ),
    );
  }
}
