import 'package:concepta/app/features/details/domain/entities/detail.dart';
import 'package:concepta/app/features/details/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

import '../data_sources/details_data_source.dart';

class DetailRepositoryImpl implements DetailRepository {
  const DetailRepositoryImpl({
    required this.detailRemoteDataSource,
  });

  final DetailsDataSource detailRemoteDataSource;

  @override
  Future<Either<Exception, DetailEntity>> getInfoByName({
    required String name,
  }) =>
      detailRemoteDataSource.getInfoByName(name: name);
}
