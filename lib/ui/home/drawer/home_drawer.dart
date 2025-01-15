import 'package:flutter/material.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/drawer/drawer_title_item.dart';
import 'package:news_app/ui/home/drawer/language_bottom_sheet.dart';
import 'package:news_app/ui/home/drawer/theme_bottom_sheet.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        Container(
          height: height*0.2,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Center(child: Text(AppLocalizations.of(context)!.news_app,style: AppStyles.bold24Black))
        ),
        SizedBox(height: height*0.02),
        InkWell(
          onTap: (){
            // todo: go to home
          },
            child: DrawerTitleItem(imagePath: AssetsManager.homeIcon,title: AppLocalizations.of(context)!.go_to_home)),
        SizedBox(height: height*0.02),
        Divider(color: AppColors.whiteColor,thickness: 2,indent: width*0.04,endIndent: width*0.06),
        SizedBox(height: height*0.02),
        DrawerTitleItem(imagePath: AssetsManager.themeIcon,title: AppLocalizations.of(context)!.theme),
        SizedBox(height: height*0.01),
        InkWell(
          onTap:(){
            showThemeBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width*0.05
            ),
            padding: EdgeInsets.symmetric(
                horizontal: width*0.04,
                vertical: height*0.02
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: AppColors.whiteColor,
                  width: 2
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( themeProvider.appTheme == ThemeMode.light?
                    AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,style: AppStyles.medium20White),
                const Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30)
              ],
            ),
          ),
        ),
        SizedBox(height: height*0.03),
        Divider(color: AppColors.whiteColor,thickness: 2,indent: width*0.04,endIndent: width*0.06),
        SizedBox(height: height*0.02),
        DrawerTitleItem(imagePath: AssetsManager.languageIcon,title: AppLocalizations.of(context)!.language),
        SizedBox(height: height*0.01),
        InkWell(
          onTap: (){
            showLanguageBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width*0.05
            ),
            padding: EdgeInsets.symmetric(
                horizontal: width*0.04,
                vertical: height*0.02
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: AppColors.whiteColor,
                  width: 2
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( languageProvider.appLanguage == 'en'?
                    AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,style: AppStyles.medium20White),
                const Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30)
              ],
            ),
          ),
        ),
      ]
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ThemeBottomSheet()
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet()
    );
  }
}
