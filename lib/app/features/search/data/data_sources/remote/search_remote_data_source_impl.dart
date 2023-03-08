import 'package:concepta/app/features/search/domain/entities/suggestion.dart';
import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({required this.client});

  final PubClient client;

  @override
  Future<Either<Exception, SuggestionEntity>> getSuggestionsByTerms({
    required String terms,
  }) async {
    try {
      final SearchResults data = await client.search(terms);

      return Right(
        SuggestionEntity(
          suggestions: data.packages
              .map(
                (package) => package.package,
              )
              .take(6)
              .toList(),
        ),
      );
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
