import 'package:dartz/dartz.dart';

import '../entities/suggestion.dart';

abstract class SearchRepository {
  Future<Either<Exception, SuggestionEntity>> getSuggestionsByTerms({
    required String terms,
  });

  Either<Exception, void> selectSuggestion({
    required String name,
  });
}
