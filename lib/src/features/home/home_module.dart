import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/features/home/view/controller/home_controller.dart';
import 'view/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<HomeController>(
          (i) => HomeController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, _) => const HomePage()),
      ];
}
