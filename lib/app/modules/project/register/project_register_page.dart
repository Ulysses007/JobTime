import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;
  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterStatus.sucess:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert('Error ao cadastrar projeto').show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            ' Criar novo projeto',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameEC,
                  decoration: InputDecoration(
                    label: Text('Nome no projeto'),
                  ),
                  validator: Validatorless.required('Nome Obrigatorio'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _estimateEC,
                    decoration: InputDecoration(
                        label: Text(
                      'Quantidade de horas do projeto',
                    )),
                    validator: Validatorless.multiple([
                      Validatorless.required('Quantidade de horas obrigatoria'),
                      Validatorless.number('Só é permitido números'),
                    ])),
              ),
              SizedBox(
                height: 10,
              ),
              BlocSelector<ProjectRegisterController, ProjectRegisterStatus,
                  bool>(
                bloc: widget.controller,
                selector: (state) => state == ProjectRegisterStatus.loading,
                builder: (context, showLoadin) => Visibility(
                    visible: showLoadin,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      final name = _nameEC.text;
                      final estimate = int.parse(_estimateEC.text);

                      await widget.controller.register(name, estimate);
                    }
                  },
                  child: Text('Salvar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
