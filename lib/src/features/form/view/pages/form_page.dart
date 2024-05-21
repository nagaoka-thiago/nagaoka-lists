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
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Observer(
            builder: (_) => TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              onChanged: _controller.setTitle,
              initialValue: _controller.title,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Observer(
              builder: (_) => _controller.entity!.items.isNotEmpty
                  ? Column(children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: _controller.entity!.items.length,
                          itemBuilder: (context, i) {
                            final item = _controller.entity!.items[i];
                            return ItemFormWidget(
                              itemTitle: item.title,
                              itemTitleOnChanged: (newVal) {},
                              itemDescription: item.description,
                              itemDescriptionOnChanged: (newVal) {},
                            );
                          }),
                    ])
                  : const Text('There are no items in this list.')),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                side: WidgetStateProperty.all<BorderSide>(
                    const BorderSide(color: Colors.black))),
            child: const Text('Add items',
                style: TextStyle(fontSize: 24, color: Colors.white)),
            onPressed: () {},
          )
        ],
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
        onPressed: () {},
      ),
    );
  }
}
