import 'package:flutter/material.dart';

class ItemFormWidget extends StatelessWidget {
  final String itemTitle;
  final Function(String) itemTitleOnChanged;
  final String itemDescription;
  final Function(String) itemDescriptionOnChanged;
  const ItemFormWidget({
    super.key,
    required this.itemTitle,
    required this.itemTitleOnChanged,
    required this.itemDescription,
    required this.itemDescriptionOnChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
