import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/data_sources/database_client_data_source_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/repositories/database_client_repository_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/data_sources/database_client_data_source.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/features/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
        Bind.singleton<DatabaseClientDataSource>(
            (i) => DatabaseClientDataSourceImpl()),
        Bind.singleton<DatabaseClientRepository>(
            (i) => DatabaseClientRepositoryImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
