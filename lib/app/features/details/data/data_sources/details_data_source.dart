import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

import '../../domain/entities/detail.dart';

abstract class DetailsDataSource {
  Future<Either<Exception, DetailEntity>> getInfoByName({
    required String name,
  });
}
