import 'package:flutter/material.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/features/home/view/pages/widgets/item_widget.dart';

class ListWidget extends StatelessWidget {
  final ListEntity list;
  final Function() onListPressed;
  final Function() onExpandPressed;
  final bool expand;
  const ListWidget({
    super.key,
    required this.list,
    required this.onListPressed,
    required this.onExpandPressed,
    required this.expand,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onListPressed,
                  child: Center(
                    child: Text(
                      list.title,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: onExpandPressed,
                    icon: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
            !expand
                ? Row(
                    children: list.items
                        .map((item) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(item.title),
                            ))
                        .toList(),
                  )
                : const SizedBox.shrink(),
            expand
                ? Column(
                    children: [
                      const Center(
                          child: Text(
                        'Item detais',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: list.items
                            .map((item) => ItemWidget(item: item))
                            .toList(),
                      ),
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ));
  }
}
