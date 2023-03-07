import 'package:concepta/app/features/search/domain/entities/suggestion.dart';
import 'package:concepta/infra/db/core_db.dart' show CoreDb, NikeDb;

class CoreRecentSearchFields {
  static const int suggestions = 1;
}

class CoreRecentSearchDb extends CoreDb<SuggestionEntity> {
  const CoreRecentSearchDb() : super('recentSearch');
}
