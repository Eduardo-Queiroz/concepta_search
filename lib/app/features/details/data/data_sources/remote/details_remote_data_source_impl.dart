import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import '../../../domain/entities/detail.dart';
import 'details_remote_data_source.dart';

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  DetailsRemoteDataSourceImpl({required this.client});

  final PubClient client;

  @override
  Future<Either<Exception, DetailEntity>> getInfoByName({
    required String name,
  }) async {
    try {
      final results = await Future.wait([
        client.packageInfo(name),
        client.packageScore(name),
      ]);

      final data = DetailEntity(
        likes: (results.last as PackageScore).likeCount,
        points: (results.last as PackageScore).grantedPoints,
        popularity: (results.last as PackageScore).popularityScore,
        description: (results.first as PubPackage).description,
      );

      return Right(data);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
