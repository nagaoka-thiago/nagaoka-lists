import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/features/form/view/pages/form_page.dart';

class FormModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:title', child: (_, args) => FormPage(list: args.data)),
      ];
}
