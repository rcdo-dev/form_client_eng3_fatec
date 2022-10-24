import 'package:eng3_cliente/app/domain_models/cliente.dart';
import 'package:eng3_cliente/app/domain_models/dependente.dart';
import 'package:eng3_cliente/app/domain_models/endereco.dart';
import 'package:eng3_cliente/app/domain_models/estado.dart';
import 'package:eng3_cliente/app/domain_models/parentesco.dart';
import 'package:eng3_cliente/app/widgets/app_dropdown_button.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
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
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 600.0,
          height: double.infinity,
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
                        ),
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      Expanded(
                        child: AppDropdownButtonFormField(
                          labelText: 'Estado',
                          list: Constants.estados,
                          dropdownValue: Constants.estados.first,
                          selectedItem: (value) => estadoValue = value,
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
                        ),
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      Expanded(
                        child: AppDropdownButtonFormField(
                          labelText: 'Parentesco',
                          list: Constants.parentesco,
                          dropdownValue: Constants.parentesco.first,
                          selectedItem: (value) => parentescoDependenteUm = value,
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
                        ),
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      Expanded(
                        child: AppDropdownButtonFormField(
                          labelText: 'Parentesco',
                          list: Constants.parentesco,
                          dropdownValue: Constants.parentesco.first,
                          selectedItem: (value) => parentescoDependenteDois = value,
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
                            dependentes: [
                              Dependente(
                                nome: dependenteUmController?.text,
                                parentesco: Parentesco(
                                  tipoParentesco: parentescoDependenteUm,
                                ),
                              ),
                              Dependente(
                                nome: dependenteDoisController?.text,
                                parentesco: Parentesco(
                                  tipoParentesco: parentescoDependenteDois,
                                ),
                              )
                            ],
                          );

                          print(cliente.dependentes?[1].parentesco?.tipoParentesco);
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
    );
  }
}
