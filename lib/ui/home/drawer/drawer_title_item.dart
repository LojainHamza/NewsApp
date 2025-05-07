import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/app_colors.dart';

class DrawerTitleItem extends StatelessWidget {
  String imagePath;
  String title;
  DrawerTitleItem({required this.imagePath,required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ImageIcon(AssetImage(imagePath),color: AppColors.whiteColor,),
          SizedBox(width: width*0.04),
          Text(title,style: AppStyles.bold20White)
        ],
      ),
    );
  }
}
