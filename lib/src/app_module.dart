import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/data_sources/database_client_data_source_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/repositories/database_client_repository_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/add_item_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/add_list_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/delete_item_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/delete_list_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/read_list_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/read_lists_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/update_list_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/data_sources/database_client_data_source.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/add_item_usecase.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/add_list_usecase.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/delete_item_usecase.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/delete_list_usecase.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/read_list_usecase.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/read_lists_usecase.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/update_list_usecase.dart';
import 'package:nagaoka_lists/src/features/form/form_module.dart';
import 'package:nagaoka_lists/src/features/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
        Bind.singleton<DatabaseClientDataSource>(
            (i) => DatabaseClientDataSourceImpl()),
        Bind.singleton<DatabaseClientRepository>(
            (i) => DatabaseClientRepositoryImpl()),
        Bind.singleton<ReadListsUsecase>((i) => ReadListsUsecaseImpl()),
        Bind.singleton<ReadListUsecase>((i) => ReadListUsecaseImpl()),
        Bind.singleton<AddListUsecase>((i) => AddListUsecaseImpl()),
        Bind.singleton<UpdateListUsecase>((i) => UpdateListUsecaseImpl()),
        Bind.singleton<DeleteListUsecase>((i) => DeleteListUsecaseImpl()),
        Bind.singleton<AddItemUsecase>((i) => AddItemUsecaseImpl()),
        Bind.singleton<DeleteItemUsecase>((i) => DeleteItemUsecaseImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/form/', module: FormModule()),
      ];
}
