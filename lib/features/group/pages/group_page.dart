import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/components/buttons/custom_button_default.dart';
import '../../../core/components/dropdown/custom_dropdown.dart';
import '../controllers/group_controller.dart';
import 'group_cadaster_page.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final groupController = GroupController();
  List<DropdownMenuItem> turmas = [];

  @override
  void initState() {
    super.initState();
    turmas = groupController.turmas;
    groupController.turma = turmas.first.value;
    _getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 25, 8, 8),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                CustomDropDown<String>(
                  initValue: groupController.turmas.first.value,
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
                  final groups = groupController.groups;
                  return groups.isEmpty
                      ? const Center(
                          child: Text('Sem grupos cadastrados'),
                        )
                      : ListView.builder(
                          itemCount: groups.length,
                          itemBuilder: (_, index) {
                            final group = groups[index];
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
      ),
    );
  }

  Future<void> _getGroups() async {
    await groupController.getGroups();
  }
}
