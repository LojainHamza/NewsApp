import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            InkWell(
                onTap: (){
                  languageProvider.changeLanguage('en');
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: languageProvider.appLanguage == 'en'?
                getSelectedItemWidget(AppLocalizations.of(context)!.english)
                    :getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
            ),
            SizedBox(height: height*0.02),
            InkWell(
                onTap: (){
                  languageProvider.changeLanguage('ar');
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: languageProvider.appLanguage == 'ar'?
                getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                    :getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)
            )]
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: AppStyles.bold24Black),
        const Icon(Icons.check,color: AppColors.blackColor,size: 30)
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,style: AppStyles.medium24Black);
  }
}
