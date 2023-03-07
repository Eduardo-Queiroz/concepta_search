import 'package:mocktail/mocktail.dart';
import 'package:pubspec/src/pubspec.dart';
import 'package:pub_api_client/pub_api_client.dart';

class PubClientMock extends Mock implements PubClient {
  @override
  Future<SearchResults> search(
    String data, {
    String? dependency,
    int page = 1,
    String? publisher,
    SearchOrder sort = SearchOrder.created,
  }) async =>
      SearchResults(
        packages: [
          PackageResult(package: "flutter_bloc"),
          PackageResult(package: "entity_remote1"),
          PackageResult(package: "entity_remote2"),
          PackageResult(package: "entity_remote3"),
          PackageResult(package: "entity_remote5"),
          PackageResult(package: "entity_remote6"),
          PackageResult(package: "entity_remote7"),
        ],
      );
  @override
  Future<PubPackage> packageInfo(
    String packageName,
  ) async =>
      PubPackage(
        name: "flutter_bloc",
        latest: PackageVersion(
          version: "1.0",
          archiveUrl: "",
          published: DateTime.now(),
          pubspec: const PubSpec(
            description: "description",
          ),
        ),
      );

  @override
  Future<PackageScore> packageScore(
    String packageName,
  ) async =>
      PackageScore(
        grantedPoints: 10,
        maxPoints: 2,
        likeCount: 20,
        popularityScore: 0.99,
        lastUpdated: DateTime.now(),
      );
}
