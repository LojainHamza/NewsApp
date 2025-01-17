import 'package:news_app/utils/assets_manager.dart';
class CategoryModel{
  String id;
  String title;
  String imagePath;

  CategoryModel({required this.id,required this.title,required this.imagePath});

  static List<CategoryModel> getCategoriesList(bool isDark){
    return [
    CategoryModel(
      id: 'general',
      title: 'General',
      imagePath: isDark?AssetsManager.generalDark:AssetsManager.generalLight,
    ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        imagePath: isDark?AssetsManager.businessDark:AssetsManager.businessLight,
      ),
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        imagePath: isDark?AssetsManager.sportsDark:AssetsManager.sportsLight,
      ),
      CategoryModel(
        id: 'technology',
        title: 'Technology',
        imagePath: isDark?AssetsManager.technologyDark:AssetsManager.technologyLight,
      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        imagePath: isDark?AssetsManager.scienceDark:AssetsManager.scienceLight,
      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        imagePath: isDark?AssetsManager.healthDark:AssetsManager.healthLight,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        imagePath: isDark?AssetsManager.entertainmentDark:AssetsManager.entertainmentLight,
      ),
    ];
  }
}