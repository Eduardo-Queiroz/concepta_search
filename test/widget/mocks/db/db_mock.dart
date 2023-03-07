import 'package:concepta/app/features/search/domain/entities/suggestion.dart';
import 'package:concepta/infra/db/core_db.dart';
import 'package:concepta/infra/db/core_recent_search_db.dart';
import 'package:flutter/foundation.dart';
import 'package:mocktail/mocktail.dart';

class DbMock<T> extends Mock implements CoreDb<T> {
  DbMock({this.data});

  T? data;

  @override
  ValueListenable<Object?> listenable() => ValueNotifier<T?>(data);

  @override
  bool exists() => true;

  @override
  T? get() => data;

  @override
  void set(T value) {
    data = value;
  }

  @override
  bool isEmpty() => data == null;

  @override
  bool isNotEmpty() => data != null;

  @override
  Future<void> open() => Future.value();

  @override
  Future<void> delete() => Future.value();
}

class CoreRecentSearchDbMock extends DbMock<SuggestionEntity>
    implements CoreRecentSearchDb {
  CoreRecentSearchDbMock([
    SuggestionEntity? data,
  ]) : super(data: data);
}
