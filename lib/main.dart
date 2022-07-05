import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: const ListaTransferencias(),
        appBar: AppBar(
          title: const Text('Transferência'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton clicked');
          },
          child: const Icon(Icons.add),
        ),
      ),
    ));

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.00, 1000)),
        ItemTransferencia(Transferencia(200.00, 1001)),
        ItemTransferencia(Transferencia(300.00, 1002)),
        ItemTransferencia(Transferencia(400.00, 1000)),
      ],
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
}
