import 'package:dartz/dartz.dart';

import '../../../domain/entities/suggestion.dart';

abstract class SearchLocalDataSource {
  Either<Exception, SuggestionEntity> getSuggestionsHistory();

  Either<Exception, void> updateHistory({
    required SuggestionEntity suggestion,
  });
}
