import 'package:concepta/app/features/search/domain/entities/suggestion.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/search_repository.dart';
import '../data_sources/local/search_local_data_source.dart';
import '../data_sources/remote/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({
    required this.searchRemoteDataSource,
    required this.searchLocalDataSource,
  });

  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  @override
  Future<Either<Exception, SuggestionEntity>> getSuggestionsByTerms({
    required String terms,
  }) {
    return terms.isEmpty
        ? Future.value(searchLocalDataSource.getSuggestionsHistory())
        : searchRemoteDataSource.getSuggestionsByTerms(terms: terms);
  }

  @override
  Either<Exception, void> selectSuggestion({
    required String name,
  }) {
    final currentLocalData = searchLocalDataSource.getSuggestionsHistory();
    return currentLocalData.flatMap(
      (entity) => searchLocalDataSource.updateHistory(
        suggestion: SuggestionEntity(
          suggestions: [name, ...entity.suggestions].take(5).toList(),
        ),
      ),
    );
  }
}
