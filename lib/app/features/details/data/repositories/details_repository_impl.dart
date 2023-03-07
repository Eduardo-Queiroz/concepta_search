import 'package:concepta/app/features/details/data/data_sources/remote/details_remote_data_source.dart';
import 'package:concepta/app/features/details/domain/entities/detail.dart';
import 'package:concepta/app/features/details/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class DetailRepositoryImpl implements DetailRepository {
  const DetailRepositoryImpl({
    required this.detailRemoteDataSource,
  });

  final DetailsRemoteDataSource detailRemoteDataSource;

  @override
  Future<Either<Exception, DetailEntity>> getInfoByName({
    required String name,
  }) =>
      detailRemoteDataSource.getInfoByName(name: name);
}
