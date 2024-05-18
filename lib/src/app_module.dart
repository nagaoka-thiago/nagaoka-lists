import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/data_sources/database_client_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/data_sources/database_client.dart';
import 'package:nagaoka_lists/src/features/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<DatabaseClient>(() => DatabaseClientImpl());
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }
}
