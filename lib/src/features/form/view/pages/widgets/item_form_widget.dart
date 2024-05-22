import 'package:flutter/material.dart';

class ItemFormWidget extends StatelessWidget {
  final String itemTitle;
  final Function(String) itemTitleOnChanged;
  final String itemDescription;
  final Function(String) itemDescriptionOnChanged;
  final Function() itemDelete;
  const ItemFormWidget({
    super.key,
    required this.itemTitle,
    required this.itemTitleOnChanged,
    required this.itemDescription,
    required this.itemDescriptionOnChanged,
    required this.itemDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        const Text('Item added'),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
          onChanged: itemTitleOnChanged,
          initialValue: itemTitle,
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Description',
          ),
          onChanged: itemDescriptionOnChanged,
          initialValue: itemDescription,
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
              side: WidgetStateProperty.all<BorderSide>(
                  const BorderSide(color: Colors.black))),
          onPressed: itemDelete,
          child: const Text(
            'Delete item',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        )
      ],
    );
  }
}
