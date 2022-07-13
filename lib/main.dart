import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

final TextEditingController _controladorCampoNumeroConta =
    TextEditingController();
final TextEditingController _controladorCampoValor = TextEditingController();

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
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
            child: Text('Confirmar'),
            onPressed: () => //{
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: const Text('Transferencia realizada com sucesso.'),
                //     // action: SnackBarAction(
                //     //   label: 'Action',
                //     //   onPressed: () {
                //     //     // Code to execute.
                //     //   },
                //     // ),
                //   ),
                // );
                _criaTranferencia(context),
            //},
          ),
        ],
      ),
    );
  }
}

void _criaTranferencia(BuildContext context) {
  final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
  final double? valor = double.tryParse(_controladorCampoValor.text);
  if (numeroConta != null && valor != null) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint('Criando Tranferência');
    debugPrint('$transferenciaCriada');
    Navigator.pop(context, transferenciaCriada);
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
          icon: Icon(icone),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.00, 1000)),
          ItemTransferencia(Transferencia(200.00, 1001)),
          ItemTransferencia(Transferencia(300.00, 1002)),
          ItemTransferencia(Transferencia(400.00, 1000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              debugPrint('chegou no then do feture');
              debugPrint('$transferenciaRecebida');
            });
          }),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  ItemTransferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_tranferencia.valor.toString()),
        subtitle: Text(_tranferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia{ valor: $valor, numeroConta: $numeroConta }';
  }
}
