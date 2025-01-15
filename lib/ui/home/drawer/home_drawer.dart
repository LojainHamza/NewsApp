import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/drawer_title_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: height*0.2,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Center(child: Text('News App',style: AppStyles.bold24Black))
        ),
        SizedBox(height: height*0.02),
        InkWell(
          onTap: (){
            // todo: go to home
          },
            child: DrawerTitleItem(imagePath: AssetsManager.homeIcon,title: 'Go To Home')),
        SizedBox(height: height*0.02),
        Divider(color: AppColors.whiteColor,thickness: 2,indent: width*0.04,endIndent: width*0.06),
        SizedBox(height: height*0.02),
        DrawerTitleItem(imagePath: AssetsManager.themeIcon,title: 'Theme'),
        SizedBox(height: height*0.01),
        Container(
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
              Text('Dark',style: AppStyles.medium20White),
              const Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30)
            ],
          ),
        ),
        SizedBox(height: height*0.03),
        Divider(color: AppColors.whiteColor,thickness: 2,indent: width*0.04,endIndent: width*0.06),
        SizedBox(height: height*0.02),
        DrawerTitleItem(imagePath: AssetsManager.languageIcon,title: 'Language'),
        SizedBox(height: height*0.01),
        Container(
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
              Text('English',style: AppStyles.medium20White),
              const Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30)
            ],
          ),
        ),
      ]
    );
  }
}
