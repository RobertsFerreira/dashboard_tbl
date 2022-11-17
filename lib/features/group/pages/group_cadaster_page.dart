import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/components/buttons/custom_button_default.dart';
import '../controllers/group_cadaster_controller.dart';

class GroupCadasterPage extends StatefulWidget {
  const GroupCadasterPage({super.key});

  @override
  State<GroupCadasterPage> createState() => _GroupCadasterPageState();
}

class _GroupCadasterPageState extends State<GroupCadasterPage> {
  final controller = GrupoCadasterController();

  @override
  void initState() {
    super.initState();
    controller.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Grupo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 25, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.textEditingController,
                      decoration: const InputDecoration(
                        labelText: 'Usuário Líder',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      onChanged: controller.setReference,
                      decoration: const InputDecoration(
                        labelText: 'Reference',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      initialValue: '9a701066-27e2-49d2-ae07-0c0f8fea9524',
                      onChanged: controller.setCodeClass,
                      decoration: const InputDecoration(
                        labelText: 'Código Turma',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            Observer(
              builder: (_) {
                final users = controller.users;
                final userLeader = controller.userLeader;
                return Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text('Usuários Cadastrados na turma'),
                      users.isEmpty
                          ? const Center(
                              child: Text('Sem usuários cadastrados'),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (_, index) {
                                  final user = users[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 4,
                                    ),
                                    child: GestureDetector(
                                      onTap: () =>
                                          controller.addUserGroup(user),
                                      child: ListTile(
                                        title: Text('Nome: ${user.name}'),
                                        subtitle: Text('CPF: ${user.cpf}'),
                                        trailing: Checkbox(
                                          value: user.isLeaderGroup,
                                          onChanged: containsLider &&
                                                  userLeader!.id != user.id
                                              ? null
                                              : (value) {
                                                  controller.setUserLeader(
                                                    index,
                                                    user,
                                                    value,
                                                  );
                                                },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            Observer(
              builder: (_) {
                final usersGroup = controller.usersGroup;
                return Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text('Usuários participantes do grupo'),
                      Expanded(
                        child: ListView.builder(
                          itemCount: usersGroup.length,
                          itemBuilder: (_, index) {
                            final user = usersGroup[index];
                            return GestureDetector(
                              onTap: () => controller.removeUserGroup(user),
                              child: ListTile(
                                title: Text('Nome: ${user.name}'),
                                subtitle: Text('CPF: ${user.cpf}'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(
                builder: (_) {
                  final loading = controller.loading;
                  final isValidSave = controller.isValidSave;
                  final message = controller.message;
                  final erro = message.contains('Error');
                  return loading
                      ? const Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButtonDefault(
                                onTap: isValidSave
                                    ? () {
                                        saveGroup();
                                        showDialog(
                                          context: context,
                                          builder: ((ctx) {
                                            return AlertDialog(
                                              title: const Text('Resultado'),
                                              content: Text(
                                                erro
                                                    ? 'Erro ao inserir'
                                                    : 'Grupo cadastrado com sucesso',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(ctx);
                                                    if (!erro) {
                                                      controller.message = '';
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            );
                                          }),
                                        );
                                      }
                                    : null,
                                text: 'Salvar',
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: CustomButtonDefault(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                text: 'Cancelar',
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> saveGroup() async {
    await controller.saveGroup();
  }

  bool get containsLider {
    return controller.containsLider();
  }
}
