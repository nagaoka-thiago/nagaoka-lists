import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nagaoka_lists/src/features/form/view/controller/form_controller.dart';
import 'package:nagaoka_lists/src/features/form/view/pages/widgets/item_form_widget.dart';

class FormPage extends StatefulWidget {
  final ListEntity? list;
  const FormPage({super.key, required this.list});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _controller = Modular.get<FormController>();
  @override
  void initState() {
    _controller.initializeEntity(widget.list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:
                Text(widget.list != null ? widget.list!.title : 'Adding list')),
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Observer(
              builder: (_) => TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'List Title',
                ),
                onChanged: _controller.setListTitle,
                initialValue: _controller.listTitle,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(
              builder: (_) => _controller.numItemsAdded > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _controller.numItemsAdded,
                                itemBuilder: (context, i) {
                                  return ItemFormWidget(
                                    key: Key(_controller.items[i].title),
                                    itemTitle: _controller.items[i].title,
                                    itemTitleOnChanged: (newVal) =>
                                        _controller.setItemTitle(i, newVal),
                                    itemDescription:
                                        _controller.items[i].description,
                                    itemDescriptionOnChanged: (newVal) =>
                                        _controller.setItemDescription(
                                            i, newVal),
                                    itemDelete: () async {
                                      await _controller.deleteItem(i);
                                    },
                                  );
                                }),
                          ]),
                        ),
                      ],
                    )
                  : const Text('There are no items registered in this list!'),
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(
                builder: (_) => TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.green),
                          side: WidgetStateProperty.all<BorderSide>(
                              const BorderSide(color: Colors.black))),
                      onPressed: _controller.incrementItemsAdded,
                      child: const Text('Add items',
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                    )),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: Colors.black))),
        child: const Text(
          'Add List',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        onPressed: () async {
          final result = await _controller.addOrUpdateList();
          if (result == 'Success') {
            Modular.to.pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result),
              ),
            );
          }
        },
      ),
    );
  }
}
