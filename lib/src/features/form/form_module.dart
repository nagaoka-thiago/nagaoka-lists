import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/features/form/view/controller/form_controller.dart';
import 'package:nagaoka_lists/src/features/form/view/pages/form_page.dart';

class FormModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<FormController>((_) => FormController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:title', child: (_, args) => FormPage(list: args.data)),
      ];
}
