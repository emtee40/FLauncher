// Mocks generated by Mockito 5.0.10 from annotations
// in flauncher/test/mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i11;
import 'dart:ui' as _i14;

import 'package:firebase_core/firebase_core.dart' as _i9;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i17;
import 'package:flauncher/database.dart' as _i3;
import 'package:flauncher/flauncher_channel.dart' as _i10;
import 'package:flauncher/providers/apps_service.dart' as _i15;
import 'package:flauncher/providers/settings_service.dart' as _i16;
import 'package:flauncher/providers/wallpaper_service.dart' as _i13;
import 'package:flutter/src/foundation/assertions.dart' as _i19;
import 'package:flutter/src/foundation/diagnostics.dart' as _i18;
import 'package:mockito/mockito.dart' as _i1;
import 'package:moor/src/dsl/dsl.dart' as _i8;
import 'package:moor/src/runtime/api/runtime_api.dart' as _i4;
import 'package:moor/src/runtime/data_class.dart' as _i12;
import 'package:moor/src/runtime/executor/executor.dart' as _i6;
import 'package:moor/src/runtime/executor/stream_queries.dart' as _i7;
import 'package:moor/src/runtime/query_builder/query_builder.dart' as _i2;
import 'package:moor/src/runtime/types/sql_types.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMigrationStrategy extends _i1.Fake implements _i2.MigrationStrategy {}

class _Fake$AppsTable extends _i1.Fake implements _i3.$AppsTable {}

class _Fake$CategoriesTable extends _i1.Fake implements _i3.$CategoriesTable {}

class _Fake$AppsCategoriesTable extends _i1.Fake implements _i3.$AppsCategoriesTable {}

class _FakeGeneratedDatabase extends _i1.Fake implements _i4.GeneratedDatabase {}

class _FakeStreamQueryUpdateRules extends _i1.Fake implements _i4.StreamQueryUpdateRules {}

class _FakeDatabaseConnection extends _i1.Fake implements _i4.DatabaseConnection {}

class _FakeSqlTypeSystem extends _i1.Fake implements _i5.SqlTypeSystem {}

class _FakeQueryExecutor extends _i1.Fake implements _i6.QueryExecutor {}

class _FakeStreamQueryStore extends _i1.Fake implements _i7.StreamQueryStore {}

class _FakeCategory extends _i1.Fake implements _i3.Category {
  @override
  String toString() => super.toString();
}

class _FakeMigrator extends _i1.Fake implements _i2.Migrator {}

class _FakeInsertStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.InsertStatement<T, D> {}

class _FakeUpdateStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.UpdateStatement<T, D> {}

class _FakeSimpleSelectStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.SimpleSelectStatement<T, D> {}

class _FakeJoinedSelectStatement<FirstT extends _i8.Table, FirstD> extends _i1.Fake
    implements _i2.JoinedSelectStatement<FirstT, FirstD> {}

class _FakeDeleteStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.DeleteStatement<T, D> {}

class _FakeSelectable<T> extends _i1.Fake implements _i2.Selectable<T> {}

class _FakeGenerationContext extends _i1.Fake implements _i2.GenerationContext {}

class _FakeFirebaseApp extends _i1.Fake implements _i9.FirebaseApp {
  @override
  String toString() => super.toString();
}

/// A class which mocks [FLauncherChannel].
///
/// See the documentation for Mockito's code generation for more information.
class MockFLauncherChannel extends _i1.Mock implements _i10.FLauncherChannel {
  MockFLauncherChannel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<List<dynamic>> getInstalledApplications() =>
      (super.noSuchMethod(Invocation.method(#getInstalledApplications, []),
          returnValue: Future<List<dynamic>>.value(<dynamic>[])) as _i11.Future<List<dynamic>>);
  @override
  _i11.Future<void> launchApp(String? packageName) => (super.noSuchMethod(Invocation.method(#launchApp, [packageName]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> openSettings() => (super.noSuchMethod(Invocation.method(#openSettings, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> openAppInfo(String? packageName) =>
      (super.noSuchMethod(Invocation.method(#openAppInfo, [packageName]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> uninstallApp(String? packageName) =>
      (super.noSuchMethod(Invocation.method(#uninstallApp, [packageName]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<bool> isDefaultLauncher() =>
      (super.noSuchMethod(Invocation.method(#isDefaultLauncher, []), returnValue: Future<bool>.value(false))
          as _i11.Future<bool>);
  @override
  _i11.Future<bool> checkForGetContentAvailability() => (super
          .noSuchMethod(Invocation.method(#checkForGetContentAvailability, []), returnValue: Future<bool>.value(false))
      as _i11.Future<bool>);
  @override
  void addAppsChangedListener(void Function(Map<dynamic, dynamic>)? listener) =>
      super.noSuchMethod(Invocation.method(#addAppsChangedListener, [listener]), returnValueForMissingStub: null);
}

/// A class which mocks [FLauncherDatabase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFLauncherDatabase extends _i1.Mock implements _i3.FLauncherDatabase {
  MockFLauncherDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get schemaVersion => (super.noSuchMethod(Invocation.getter(#schemaVersion), returnValue: 0) as int);
  @override
  _i2.MigrationStrategy get migration =>
      (super.noSuchMethod(Invocation.getter(#migration), returnValue: _FakeMigrationStrategy())
          as _i2.MigrationStrategy);
  @override
  _i3.$AppsTable get apps =>
      (super.noSuchMethod(Invocation.getter(#apps), returnValue: _Fake$AppsTable()) as _i3.$AppsTable);
  @override
  _i3.$CategoriesTable get categories =>
      (super.noSuchMethod(Invocation.getter(#categories), returnValue: _Fake$CategoriesTable())
          as _i3.$CategoriesTable);
  @override
  _i3.$AppsCategoriesTable get appsCategories =>
      (super.noSuchMethod(Invocation.getter(#appsCategories), returnValue: _Fake$AppsCategoriesTable())
          as _i3.$AppsCategoriesTable);
  @override
  Iterable<_i2.TableInfo<_i8.Table, dynamic>> get allTables =>
      (super.noSuchMethod(Invocation.getter(#allTables), returnValue: [])
          as Iterable<_i2.TableInfo<_i8.Table, dynamic>>);
  @override
  List<_i2.DatabaseSchemaEntity> get allSchemaEntities =>
      (super.noSuchMethod(Invocation.getter(#allSchemaEntities), returnValue: <_i2.DatabaseSchemaEntity>[])
          as List<_i2.DatabaseSchemaEntity>);
  @override
  _i4.GeneratedDatabase get attachedDatabase =>
      (super.noSuchMethod(Invocation.getter(#attachedDatabase), returnValue: _FakeGeneratedDatabase())
          as _i4.GeneratedDatabase);
  @override
  _i4.StreamQueryUpdateRules get streamUpdateRules =>
      (super.noSuchMethod(Invocation.getter(#streamUpdateRules), returnValue: _FakeStreamQueryUpdateRules())
          as _i4.StreamQueryUpdateRules);
  @override
  _i4.DatabaseConnection get connection =>
      (super.noSuchMethod(Invocation.getter(#connection), returnValue: _FakeDatabaseConnection())
          as _i4.DatabaseConnection);
  @override
  _i5.SqlTypeSystem get typeSystem =>
      (super.noSuchMethod(Invocation.getter(#typeSystem), returnValue: _FakeSqlTypeSystem()) as _i5.SqlTypeSystem);
  @override
  _i6.QueryExecutor get executor =>
      (super.noSuchMethod(Invocation.getter(#executor), returnValue: _FakeQueryExecutor()) as _i6.QueryExecutor);
  @override
  _i7.StreamQueryStore get streamQueries =>
      (super.noSuchMethod(Invocation.getter(#streamQueries), returnValue: _FakeStreamQueryStore())
          as _i7.StreamQueryStore);
  @override
  _i11.Future<List<_i3.App>> listApplications() => (super.noSuchMethod(Invocation.method(#listApplications, []),
      returnValue: Future<List<_i3.App>>.value(<_i3.App>[])) as _i11.Future<List<_i3.App>>);
  @override
  _i11.Future<void> persistApps(List<_i3.AppsCompanion>? applications) =>
      (super.noSuchMethod(Invocation.method(#persistApps, [applications]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> deleteApps(List<String>? packageNames) =>
      (super.noSuchMethod(Invocation.method(#deleteApps, [packageNames]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<_i3.Category> getCategory(String? name) => (super.noSuchMethod(Invocation.method(#getCategory, [name]),
      returnValue: Future<_i3.Category>.value(_FakeCategory())) as _i11.Future<_i3.Category>);
  @override
  _i11.Future<void> insertCategory(_i3.CategoriesCompanion? category) =>
      (super.noSuchMethod(Invocation.method(#insertCategory, [category]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> deleteCategory(int? id) => (super.noSuchMethod(Invocation.method(#deleteCategory, [id]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> persistCategories(List<_i3.CategoriesCompanion>? value) =>
      (super.noSuchMethod(Invocation.method(#persistCategories, [value]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> insertAppCategory(_i3.AppsCategoriesCompanion? appCategory) =>
      (super.noSuchMethod(Invocation.method(#insertAppCategory, [appCategory]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> deleteAppCategory(int? categoryId, String? packageName) =>
      (super.noSuchMethod(Invocation.method(#deleteAppCategory, [categoryId, packageName]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> persistAppsCategories(List<_i3.AppsCategoriesCompanion>? value) =>
      (super.noSuchMethod(Invocation.method(#persistAppsCategories, [value]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<List<_i3.CategoryWithApps>> listCategoriesWithApps() =>
      (super.noSuchMethod(Invocation.method(#listCategoriesWithApps, []),
              returnValue: Future<List<_i3.CategoryWithApps>>.value(<_i3.CategoryWithApps>[]))
          as _i11.Future<List<_i3.CategoryWithApps>>);
  @override
  _i11.Future<int> nextAppCategoryOrder(int? categoryId) =>
      (super.noSuchMethod(Invocation.method(#nextAppCategoryOrder, [categoryId]), returnValue: Future<int>.value(0))
          as _i11.Future<int>);
  @override
  _i2.Migrator createMigrator() =>
      (super.noSuchMethod(Invocation.method(#createMigrator, []), returnValue: _FakeMigrator()) as _i2.Migrator);
  @override
  _i11.Future<void> beforeOpen(_i6.QueryExecutor? executor, _i2.OpeningDetails? details) =>
      (super.noSuchMethod(Invocation.method(#beforeOpen, [executor, details]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Stream<List<Map<String, Object?>>> createStream(_i7.QueryStreamFetcher? stmt) =>
      (super.noSuchMethod(Invocation.method(#createStream, [stmt]),
          returnValue: Stream<List<Map<String, Object?>>>.empty()) as _i11.Stream<List<Map<String, Object?>>>);
  @override
  T alias<T extends _i8.Table, D>(_i2.TableInfo<T, D>? table, String? alias) =>
      (super.noSuchMethod(Invocation.method(#alias, [table, alias]), returnValue: null) as T);
  @override
  void markTablesUpdated(Set<_i2.TableInfo<_i8.Table, dynamic>>? tables) =>
      super.noSuchMethod(Invocation.method(#markTablesUpdated, [tables]), returnValueForMissingStub: null);
  @override
  void notifyUpdates(Set<_i4.TableUpdate>? updates) =>
      super.noSuchMethod(Invocation.method(#notifyUpdates, [updates]), returnValueForMissingStub: null);
  @override
  _i11.Stream<Null?> tableUpdates([_i4.TableUpdateQuery? query = const _i4.TableUpdateQuery.any()]) =>
      (super.noSuchMethod(Invocation.method(#tableUpdates, [query]), returnValue: Stream<Null?>.empty())
          as _i11.Stream<Null?>);
  @override
  _i11.Future<T> doWhenOpened<T>(_i11.FutureOr<T>? Function(_i6.QueryExecutor)? fn) =>
      (super.noSuchMethod(Invocation.method(#doWhenOpened, [fn]), returnValue: Future<T>.value(null))
          as _i11.Future<T>);
  @override
  _i2.InsertStatement<T, D> into<T extends _i8.Table, D>(_i2.TableInfo<T, D>? table) =>
      (super.noSuchMethod(Invocation.method(#into, [table]), returnValue: _FakeInsertStatement<T, D>())
          as _i2.InsertStatement<T, D>);
  @override
  _i2.UpdateStatement<Tbl, R> update<Tbl extends _i8.Table, R>(_i2.TableInfo<Tbl, R>? table) =>
      (super.noSuchMethod(Invocation.method(#update, [table]), returnValue: _FakeUpdateStatement<Tbl, R>())
          as _i2.UpdateStatement<Tbl, R>);
  @override
  _i2.SimpleSelectStatement<T, R> select<T extends _i8.Table, R>(_i2.TableInfo<T, R>? table,
          {bool? distinct = false}) =>
      (super.noSuchMethod(Invocation.method(#select, [table], {#distinct: distinct}),
          returnValue: _FakeSimpleSelectStatement<T, R>()) as _i2.SimpleSelectStatement<T, R>);
  @override
  _i2.JoinedSelectStatement<T, R> selectOnly<T extends _i8.Table, R>(_i2.TableInfo<T, R>? table,
          {bool? distinct = false}) =>
      (super.noSuchMethod(Invocation.method(#selectOnly, [table], {#distinct: distinct}),
          returnValue: _FakeJoinedSelectStatement<T, R>()) as _i2.JoinedSelectStatement<T, R>);
  @override
  _i2.DeleteStatement<T, D> delete<T extends _i8.Table, D>(_i2.TableInfo<T, D>? table) =>
      (super.noSuchMethod(Invocation.method(#delete, [table]), returnValue: _FakeDeleteStatement<T, D>())
          as _i2.DeleteStatement<T, D>);
  @override
  _i11.Future<int> customUpdate(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? updates,
          _i4.UpdateKind? updateKind}) =>
      (super.noSuchMethod(
          Invocation.method(
              #customUpdate, [query], {#variables: variables, #updates: updates, #updateKind: updateKind}),
          returnValue: Future<int>.value(0)) as _i11.Future<int>);
  @override
  _i11.Future<int> customInsert(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [], Set<_i2.TableInfo<_i8.Table, dynamic>>? updates}) =>
      (super.noSuchMethod(Invocation.method(#customInsert, [query], {#variables: variables, #updates: updates}),
          returnValue: Future<int>.value(0)) as _i11.Future<int>);
  @override
  _i11.Future<List<_i2.QueryRow>> customWriteReturning(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? updates,
          _i4.UpdateKind? updateKind}) =>
      (super.noSuchMethod(
          Invocation.method(
              #customWriteReturning, [query], {#variables: variables, #updates: updates, #updateKind: updateKind}),
          returnValue: Future<List<_i2.QueryRow>>.value(<_i2.QueryRow>[])) as _i11.Future<List<_i2.QueryRow>>);
  @override
  _i2.Selectable<_i2.QueryRow> customSelect(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? readsFrom = const {}}) =>
      (super.noSuchMethod(Invocation.method(#customSelect, [query], {#variables: variables, #readsFrom: readsFrom}),
          returnValue: _FakeSelectable<_i2.QueryRow>()) as _i2.Selectable<_i2.QueryRow>);
  @override
  _i2.Selectable<_i2.QueryRow> customSelectQuery(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? readsFrom = const {}}) =>
      (super.noSuchMethod(
          Invocation.method(#customSelectQuery, [query], {#variables: variables, #readsFrom: readsFrom}),
          returnValue: _FakeSelectable<_i2.QueryRow>()) as _i2.Selectable<_i2.QueryRow>);
  @override
  _i11.Future<void> customStatement(String? statement, [List<dynamic>? args]) =>
      (super.noSuchMethod(Invocation.method(#customStatement, [statement, args]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<T> transaction<T>(_i11.Future<T> Function()? action) =>
      (super.noSuchMethod(Invocation.method(#transaction, [action]), returnValue: Future<T>.value(null))
          as _i11.Future<T>);
  @override
  _i11.Future<void> batch(dynamic Function(_i4.Batch)? runInBatch) =>
      (super.noSuchMethod(Invocation.method(#batch, [runInBatch]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i2.GenerationContext $write(_i2.Component? component, {bool? hasMultipleTables}) =>
      (super.noSuchMethod(Invocation.method(#$write, [component], {#hasMultipleTables: hasMultipleTables}),
          returnValue: _FakeGenerationContext()) as _i2.GenerationContext);
  @override
  _i2.GenerationContext $writeInsertable(
          _i2.TableInfo<_i8.Table, dynamic>? table, _i12.Insertable<dynamic>? insertable) =>
      (super.noSuchMethod(Invocation.method(#$writeInsertable, [table, insertable]),
          returnValue: _FakeGenerationContext()) as _i2.GenerationContext);
}

/// A class which mocks [WallpaperService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWallpaperService extends _i1.Mock implements _i13.WallpaperService {
  MockWallpaperService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get hasListeners => (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false) as bool);
  @override
  _i11.Future<void> pickWallpaper() => (super.noSuchMethod(Invocation.method(#pickWallpaper, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> clearWallpaper() => (super.noSuchMethod(Invocation.method(#clearWallpaper, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  void addListener(_i14.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]), returnValueForMissingStub: null);
  @override
  void removeListener(_i14.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]), returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []), returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []), returnValueForMissingStub: null);
}

/// A class which mocks [AppsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppsService extends _i1.Mock implements _i15.AppsService {
  MockAppsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.CategoryWithApps> get categoriesWithApps =>
      (super.noSuchMethod(Invocation.getter(#categoriesWithApps), returnValue: <_i3.CategoryWithApps>[])
          as List<_i3.CategoryWithApps>);
  @override
  bool get hasListeners => (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false) as bool);
  @override
  _i11.Future<void> launchApp(_i3.App? app) => (super.noSuchMethod(Invocation.method(#launchApp, [app]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> openAppInfo(_i3.App? app) => (super.noSuchMethod(Invocation.method(#openAppInfo, [app]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> uninstallApp(_i3.App? app) => (super.noSuchMethod(Invocation.method(#uninstallApp, [app]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> openSettings() => (super.noSuchMethod(Invocation.method(#openSettings, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<bool> isDefaultLauncher() =>
      (super.noSuchMethod(Invocation.method(#isDefaultLauncher, []), returnValue: Future<bool>.value(false))
          as _i11.Future<bool>);
  @override
  _i11.Future<void> moveToCategory(_i3.App? app, _i3.Category? oldCategory, _i3.Category? newCategory) =>
      (super.noSuchMethod(Invocation.method(#moveToCategory, [app, oldCategory, newCategory]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> saveOrderInCategory(_i3.Category? category) =>
      (super.noSuchMethod(Invocation.method(#saveOrderInCategory, [category]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  void reorderApplication(_i3.Category? category, int? oldIndex, int? newIndex) =>
      super.noSuchMethod(Invocation.method(#reorderApplication, [category, oldIndex, newIndex]),
          returnValueForMissingStub: null);
  @override
  _i11.Future<void> addCategory(String? categoryName) =>
      (super.noSuchMethod(Invocation.method(#addCategory, [categoryName]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> renameCategory(_i3.Category? category, String? categoryName) =>
      (super.noSuchMethod(Invocation.method(#renameCategory, [category, categoryName]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> deleteCategory(_i3.Category? category) =>
      (super.noSuchMethod(Invocation.method(#deleteCategory, [category]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> moveCategory(int? oldIndex, int? newIndex) =>
      (super.noSuchMethod(Invocation.method(#moveCategory, [oldIndex, newIndex]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  void addListener(_i14.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]), returnValueForMissingStub: null);
  @override
  void removeListener(_i14.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]), returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []), returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []), returnValueForMissingStub: null);
}

/// A class which mocks [SettingsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsService extends _i1.Mock implements _i16.SettingsService {
  MockSettingsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get crashReportsEnabled =>
      (super.noSuchMethod(Invocation.getter(#crashReportsEnabled), returnValue: false) as bool);
  @override
  bool get use24HourTimeFormat =>
      (super.noSuchMethod(Invocation.getter(#use24HourTimeFormat), returnValue: false) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false) as bool);
  @override
  _i11.Future<void> setCrashReportsEnabled(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setCrashReportsEnabled, [value]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> setUse24HourTimeFormat(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setUse24HourTimeFormat, [value]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  void addListener(_i14.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]), returnValueForMissingStub: null);
  @override
  void removeListener(_i14.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]), returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []), returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []), returnValueForMissingStub: null);
}

/// A class which mocks [FirebaseCrashlytics].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseCrashlytics extends _i1.Mock implements _i17.FirebaseCrashlytics {
  MockFirebaseCrashlytics() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.FirebaseApp get app =>
      (super.noSuchMethod(Invocation.getter(#app), returnValue: _FakeFirebaseApp()) as _i9.FirebaseApp);
  @override
  set app(_i9.FirebaseApp? _app) => super.noSuchMethod(Invocation.setter(#app, _app), returnValueForMissingStub: null);
  @override
  bool get isCrashlyticsCollectionEnabled =>
      (super.noSuchMethod(Invocation.getter(#isCrashlyticsCollectionEnabled), returnValue: false) as bool);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants), returnValue: <dynamic, dynamic>{})
          as Map<dynamic, dynamic>);
  @override
  _i11.Future<bool> checkForUnsentReports() =>
      (super.noSuchMethod(Invocation.method(#checkForUnsentReports, []), returnValue: Future<bool>.value(false))
          as _i11.Future<bool>);
  @override
  void crash() => super.noSuchMethod(Invocation.method(#crash, []), returnValueForMissingStub: null);
  @override
  _i11.Future<void> deleteUnsentReports() => (super.noSuchMethod(Invocation.method(#deleteUnsentReports, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<bool> didCrashOnPreviousExecution() =>
      (super.noSuchMethod(Invocation.method(#didCrashOnPreviousExecution, []), returnValue: Future<bool>.value(false))
          as _i11.Future<bool>);
  @override
  _i11.Future<void> recordError(dynamic exception, StackTrace? stack,
          {dynamic reason,
          Iterable<_i18.DiagnosticsNode>? information = const [],
          bool? printDetails,
          bool? fatal = false}) =>
      (super.noSuchMethod(
          Invocation.method(#recordError, [exception, stack],
              {#reason: reason, #information: information, #printDetails: printDetails, #fatal: fatal}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> recordFlutterError(_i19.FlutterErrorDetails? flutterErrorDetails) =>
      (super.noSuchMethod(Invocation.method(#recordFlutterError, [flutterErrorDetails]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> log(String? message) => (super.noSuchMethod(Invocation.method(#log, [message]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> sendUnsentReports() => (super.noSuchMethod(Invocation.method(#sendUnsentReports, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> setCrashlyticsCollectionEnabled(bool? enabled) =>
      (super.noSuchMethod(Invocation.method(#setCrashlyticsCollectionEnabled, [enabled]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> setUserIdentifier(String? identifier) =>
      (super.noSuchMethod(Invocation.method(#setUserIdentifier, [identifier]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> setCustomKey(String? key, Object? value) =>
      (super.noSuchMethod(Invocation.method(#setCustomKey, [key, value]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i11.Future<void>);
}
