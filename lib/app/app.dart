import 'package:flutter/material.dart';

import 'package:eng3_cliente/app/form/form_cliente.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cliente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormCliente(),
    );
  }
}
