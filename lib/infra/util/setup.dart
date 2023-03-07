import 'package:concepta/infra/db/core_db.dart';

import '../di/locator.dart';

class Setup {
  const Setup();

  Future<void> setup() async {
    try {
      await setupDB();
      await setupLocator();
    } catch (e) {
      rethrow;
    }
  }
}
