import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/components/buttons/custom_button_default.dart';
import '../../../core/components/dropdown/custom_dropdown.dart';
import '../controllers/group_controller.dart';
import 'group_cadaster_page.dart';

class GroupPage extends StatelessWidget {
  final groupController = GroupController();
  GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              CustomDropDown<String>(
                text: 'Turmas',
                items: groupController.turmas,
                onChanged: (value) => groupController.setTurma(value ?? ''),
              ),
              const SizedBox(width: 8),
              CustomDropDown<String>(
                text: 'Ano',
                items: groupController.anos,
              ),
              const SizedBox(width: 8),
              CustomButtonDefault(
                onPressed: groupController.getGroups,
                text: 'Buscar',
              ),
              const SizedBox(width: 8),
              CustomButtonDefault(
                text: 'Cadastrar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return const GroupCadasterPage();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          const Divider(),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: groupController.groups.length,
                  itemBuilder: (_, index) {
                    final group = groupController.groups[index];
                    return ListTile(
                      title: Text(
                        group.reference,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'Líder do grupo: ${group.userLeader.name}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
