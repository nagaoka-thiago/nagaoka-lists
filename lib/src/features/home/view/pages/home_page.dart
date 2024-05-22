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
                    return Dismissible(
                      key: Key(list.title),
                      background: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.only(left: 20.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.delete,
                            )
                          ],
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Are you sure?"),
                              content: Text(
                                  "Are you sure you wish to delete ${list.title}?"),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      _controller.deleteList(list);
                                      Modular.to.pop(true);
                                    },
                                    child: const Text("Delete")),
                                TextButton(
                                  onPressed: () => Modular.to.pop(false),
                                  child: const Text("Cancel"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ListWidget(
                        key: Key(list.title),
                        list: list,
                        onListPressed: () async {
                          await Modular.to.pushNamed('/form/', arguments: list);
                          await _controller.initializeLists();
                        },
                        onExpandPressed: () async {
                          await _controller.toggleList(i);
                          setState(() {});
                        },
                        expand: _controller.listExpanded[i],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
      floatingActionButton: IconButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.green)),
          onPressed: () async {
            await Modular.to.pushNamed('/form/');
            await _controller.initializeLists();
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
