import 'package:concepta/infra/db/core_db.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/suggestion.dart';
import 'search_local_data_source.dart';

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  SearchLocalDataSourceImpl({
    required this.coreRecentSearchDb,
  });

  final CoreDb<SuggestionEntity> coreRecentSearchDb;

  @override
  Either<Exception, SuggestionEntity> getSuggestionsHistory() {
    try {
      final data = coreRecentSearchDb.get() ?? SuggestionEntity.empty();
      return Right(data);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  Either<Exception, void> updateHistory({
    required SuggestionEntity suggestion,
  }) {
    try {
      coreRecentSearchDb.set(suggestion);
      return const Right(null);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
