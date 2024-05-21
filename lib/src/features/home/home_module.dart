import 'package:flutter_modular/flutter_modular.dart';
import 'view/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, _) => const HomePage()),
      ];
}
