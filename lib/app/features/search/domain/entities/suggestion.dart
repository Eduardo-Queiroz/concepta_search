import 'package:concepta/infra/db/core_db.dart';
import 'package:concepta/infra/db/core_recent_search_db.dart';
import 'package:hive/hive.dart';

part 'suggestion.g.dart';

@HiveType(typeId: DataBaseType.suggestion)
class SuggestionEntity {
  const SuggestionEntity({
    required this.suggestions,
  });

  SuggestionEntity.empty() : suggestions = [];

  @HiveField(CoreRecentSearchFields.suggestions)
  final List<String> suggestions;
}
