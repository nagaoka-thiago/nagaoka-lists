import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/features/home/view/controller/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nagaoka_lists/src/features/home/view/pages/widgets/list_widget.dart';

class FormPage extends StatefulWidget {
  final ListEntity? list;
  const FormPage({super.key, required this.list});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text('Testing'),
        ],
      ),
    );
  }
}
