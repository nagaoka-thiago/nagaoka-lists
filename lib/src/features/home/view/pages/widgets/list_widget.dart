import 'package:flutter/material.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';

class ListWidget extends StatelessWidget {
  final ListEntity list;
  final Function() onPressed;
  const ListWidget({super.key, required this.list, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.blue,
          )),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      list.title,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Row(
                    children: list.items
                        .map((item) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(item.title),
                            ))
                        .toList(),
                  )
                ],
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          )),
    );
  }
}
