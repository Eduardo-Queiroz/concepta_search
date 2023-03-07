import 'package:dartz/dartz.dart';

import '../../../domain/entities/detail.dart';

abstract class DetailsRemoteDataSource {
  Future<Either<Exception, DetailEntity>> getInfoByName({
    required String name,
  });
}
