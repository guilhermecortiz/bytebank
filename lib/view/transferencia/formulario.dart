import 'package:flutter/material.dart';
import '../../components/editor.dart';
import 'lista.dart';

const _tituloAppBar = 'Criando Transferência';
const _textButton = 'Confirmar';

const _textSuccessSnakBar = 'Transferencia realizada com sucesso.';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  dica: '000',
                  rotulo: 'Número da conta'),
              Editor(
                dica: '0.00',
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textButton),
                onPressed: () => {
                  _criaTranferencia(context),
                },
              ),
            ],
          ),
        ));
  }

  void _criaTranferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(_textSuccessSnakBar),
        // action: SnackBarAction(
        //   label: 'Action',
        //   onPressed: () {
        //     // Code to execute.
        //   },
        // ),
      ));
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
