import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          InkWell(
            onTap: (){
              themeProvider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: themeProvider.appTheme == ThemeMode.light?
                 getSelectedItemWidget(AppLocalizations.of(context)!.light)
                :getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
          ),
          SizedBox(height: height*0.02),
          InkWell(
            onTap: (){
              themeProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
              Navigator.pop(context);
            },
              child: themeProvider.appTheme == ThemeMode.dark?
                   getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  :getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
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
