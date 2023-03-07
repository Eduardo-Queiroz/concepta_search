import 'package:dartz/dartz.dart';

import '../../../domain/entities/suggestion.dart';

abstract class SearchRemoteDataSource {
  Future<Either<Exception, SuggestionEntity>> getSuggestionsByTerms({
    required String terms,
  });
}
