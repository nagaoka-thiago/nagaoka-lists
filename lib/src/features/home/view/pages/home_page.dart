import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/features/home/view/controller/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nagaoka_lists/src/features/home/view/pages/widgets/list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomeController>();

  @override
  void initState() {
    _controller.initializeLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home Page')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Observer(
            builder: (context) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controller.lists.length,
                  itemBuilder: (context, i) {
                    final list = _controller.lists[i];
                    return ListWidget(
                      list: list,
                      onPressed: () {
                        Modular.to.pushNamed('/form/', arguments: list);
                      },
                    );
                  });
            },
          ),
        ],
      ),
      floatingActionButton: IconButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.green)),
          onPressed: () {
            Modular.to.pushNamed('/form/');
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
