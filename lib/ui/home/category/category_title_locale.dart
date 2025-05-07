import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsExtension on AppLocalizations {
  String getCategoryTitle(String categoryId) {
    switch (categoryId) {
      case 'general':
        return general;
      case 'business':
        return business;
      case 'sports':
        return sports;
      case 'health':
        return health;
      case 'science':
        return science;
      case 'entertainment':
        return entertainment;
      case 'technology':
        return technology;
      default:
        return unknown;
    }
  }
}
