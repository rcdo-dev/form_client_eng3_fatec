import 'package:eng3_cliente/app/domain_models/cliente.dart';
import 'package:eng3_cliente/app/domain_models/dependente.dart';
import 'package:eng3_cliente/app/domain_models/endereco.dart';
import 'package:eng3_cliente/app/domain_models/estado.dart';
import 'package:eng3_cliente/app/domain_models/parentesco.dart';
import 'package:eng3_cliente/app/utils/validators.dart';
import 'package:eng3_cliente/app/widgets/app_dropdown_button.dart';
import 'package:flutter/material.dart';

import '../constants/constants_list.dart';
import '../domain_models/cidade.dart';
import '../widgets/app_text_form_field.dart';

class FormCliente extends StatefulWidget {
  const FormCliente({
    super.key,
  });

  @override
  State<FormCliente> createState() => _FormClienteState();
}

class _FormClienteState extends State<FormCliente> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? nomeController;
  TextEditingController? cpfController;
  TextEditingController? creditoController;
  TextEditingController? logradouroController;
  TextEditingController? cidadeController;
  TextEditingController? cepController;
  TextEditingController? complementoController;
  TextEditingController? dependenteUmController;
  TextEditingController? dependenteDoisController;

  String? estadoValue;
  String? parentescoDependenteUm;
  String? parentescoDependenteDois;

  @override
  void initState() {
    nomeController = TextEditingController();
    cpfController = TextEditingController();
    creditoController = TextEditingController();
    logradouroController = TextEditingController();
    cidadeController = TextEditingController();
    cepController = TextEditingController();
    complementoController = TextEditingController();
    dependenteUmController = TextEditingController();
    dependenteDoisController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 600.0,
            height: double.infinity, // err height
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //------------------------------------------------------------------
                    const Divider(
                      height: 40.0,
                    ),
                    const Text('Dados'),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'Nome',
                            keyboardType: TextInputType.text,
                            controller: nomeController,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Nome inválido',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'CPF',
                            keyboardType: TextInputType.number,
                            controller: cpfController,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'CPF inválido',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      width: 230.0,
                      child: AppTextFormField(
                        labelText: 'Crédito',
                        keyboardType: TextInputType.number,
                        controller: creditoController,
                        validator: (value) => Validators.emptyField(
                          value: value,
                          returnMessage: 'Crédito inválido',
                        ),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                    ),

                    //------------------------------------------------------------------
                    const Text('Endereço'),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'Logradouro',
                            keyboardType: TextInputType.text,
                            controller: logradouroController,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Logradouro inválido',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: AppDropdownButtonFormField(
                            labelText: 'Estado',
                            list: ConstantsList.estados,
                            dropdownValue: ConstantsList.estados.first,
                            selectedItem: (value) => estadoValue = value,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Estado inválido',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'Cidade',
                            keyboardType: TextInputType.text,
                            controller: cidadeController,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Cidade inválida',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'Cep',
                            keyboardType: TextInputType.number,
                            controller: cepController,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Cep inválido',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppTextFormField(
                        labelText: 'Complemento',
                        keyboardType: TextInputType.number,
                        controller: complementoController,
                        validator: (value) => Validators.emptyField(
                          value: value,
                          returnMessage: 'Complemento inválido',
                        ),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                    ),

                    //------------------------------------------------------------------
                    const Text('Dependentes'),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'Dependente 1',
                            keyboardType: TextInputType.text,
                            controller: dependenteUmController,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Dependente inválido',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: AppDropdownButtonFormField(
                            labelText: 'Parentesco',
                            list: ConstantsList.parentesco,
                            dropdownValue: ConstantsList.parentesco.first,
                            selectedItem: (value) => parentescoDependenteUm = value,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Parentesco inválido',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'Dependente 2',
                            keyboardType: TextInputType.text,
                            controller: dependenteDoisController,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Dependente inválido',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: AppDropdownButtonFormField(
                            labelText: 'Parentesco',
                            list: ConstantsList.parentesco,
                            dropdownValue: ConstantsList.parentesco.first,
                            selectedItem: (value) => parentescoDependenteDois = value,
                            validator: (value) => Validators.emptyField(
                              value: value,
                              returnMessage: 'Parentesco inválido',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 40.0,
                    ),

                    //------------------------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {
                            var credito = creditoController?.text;

                            Cliente cliente = Cliente(
                              nome: nomeController?.text,
                              cpf: cpfController?.text,
                              credito: double.tryParse(
                                credito.toString(),
                              ),
                              endereco: Endereco(
                                logradouro: logradouroController?.text,
                                cep: cepController?.text,
                                complemento: complementoController?.text,
                                cidade: Cidade(
                                  nome: cidadeController?.text,
                                  estado: Estado(
                                    nome: estadoValue,
                                  ),
                                ),
                              ),
                              dependenteUm: Dependente(
                                nome: dependenteUmController?.text,
                                parentesco: Parentesco(
                                  tipoParentesco: parentescoDependenteUm,
                                ),
                              ),
                            );

                            cliente.salvar(cliente: cliente);
                            // if (cliente.validarDadosObrigatorios(validate: _formKey.currentState!.validate())) {
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       backgroundColor: Colors.red[700],
                            //       content: const Text('Preencha os dados correntamente!'),
                            //     ),
                            //   );
                            // }
                          },
                          icon: const Icon(Icons.save),
                          label: const Text(
                            'Salvar',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
