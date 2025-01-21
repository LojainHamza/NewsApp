import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category/category_details_view_model.dart';
import 'package:news_app/ui/home/category/source_tab_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'categoryDetails';
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
            builder: (context, viewModel, child) {
          if(viewModel.errorMessage != null){
            return Center(
                          child: Column(
                            children: [
                              Text(viewModel.errorMessage!),
                              ElevatedButton(
                                onPressed: (){
                                viewModel.getSources(widget.category.id);
                              }, child: Text(AppLocalizations.of(context)!.try_again,style: Theme.of(context).textTheme.headlineLarge))
                            ],
                          ),
                        );
                      }
          else if (viewModel.sourcesList == null) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.greyColor));
          }else{
            return SourceTabWidget(sourcesList: viewModel.sourcesList!);
          }
        }));
    //   FutureBuilder<SourceResponse?>(
    //       future: APIManager.getSources(widget.category.id),
    //       builder: (context,snapshot){
    //         // todo: loading
    //         if(snapshot.connectionState == ConnectionState.waiting){
    //           return const Center(child: CircularProgressIndicator(color: AppColors.greyColor));
    //         }else if(snapshot.hasError){
    //           return Center(
    //             child: Column(
    //               children: [
    //                 Text(AppLocalizations.of(context)!.sth_went_wrong,style: Theme.of(context).textTheme.headlineLarge),
    //                 ElevatedButton(
    //                   onPressed: (){
    //                   APIManager.getSources(widget.category.id);
    //                   setState(() {
    //
    //                   });
    //                 }, child: Text(AppLocalizations.of(context)!.try_again,style: Theme.of(context).textTheme.headlineLarge))
    //               ],
    //             ),
    //           );
    //         }
    //         // todo: Server => response (success , error)
    //         // todo: Server => error
    //         if(snapshot.data!.status != 'ok'){
    //           return Center(
    //             child: Column(
    //               children: [
    //                 Text(snapshot.data!.message!),
    //                 ElevatedButton(
    //                   onPressed: (){
    //                   APIManager.getSources(widget.category.id);
    //                   setState(() {
    //
    //                   });
    //                 }, child: Text(AppLocalizations.of(context)!.try_again,style: Theme.of(context).textTheme.headlineLarge))
    //               ],
    //             ),
    //           );
    //         }
    //         // todo: Server => success
    //         var sourcesList = snapshot.data!.sources!;
    //         return SourceTabWidget(sourcesList: sourcesList);
    //       }
    //   ),
    // );
  }
}
