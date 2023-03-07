import 'package:concepta/infra/router/route_provider.dart';

class DetailsRoute extends CoreRoute {
  DetailsRoute({required this.name});

  final String name;
  static String path = '/details';

  @override
  String get getPath => path;
}
