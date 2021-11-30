import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Transferências'),
          ),
          body: ListaTransferencia(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => {},
          ),
        ),
      ),
    );

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTranferencia(Transferencia(100, 1000)),
        ItemTranferencia(Transferencia(200, 2000)),
        ItemTranferencia(Transferencia(300, 3000)),
        ItemTranferencia(Transferencia(400, 4000)),
      ],
    );
  }
}

class ItemTranferencia extends StatelessWidget {
  
  final Transferencia _transferencia;

  ItemTranferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numConta.toString()),
      ),
    );
  }
}


class Transferencia {
  final double valor;
  final int numConta;

  Transferencia(this.valor, this.numConta);
}
