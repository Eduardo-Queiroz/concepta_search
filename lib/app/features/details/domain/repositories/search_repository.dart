import 'package:dartz/dartz.dart';

import '../entities/detail.dart';

abstract class DetailRepository {
  Future<Either<Exception, DetailEntity>> getInfoByName({
    required String name,
  });
}
