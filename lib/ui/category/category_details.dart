import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/category/source_tab_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'categoryDetails';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: APIManager.getSources(),
        builder: (context,snapshot){
          // todo: loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: AppColors.lightGreyColor));
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something Went Wrong'),
                ElevatedButton(onPressed: (){
                  APIManager.getSources();
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          // todo: Server => response (success , error)
          // todo: Server => error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  APIManager.getSources();
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          // todo: Server => success
          var sourcesList = snapshot.data!.sources!;
          return SourceTabWidget(sourcesList: sourcesList);
        }
    );
  }
}
