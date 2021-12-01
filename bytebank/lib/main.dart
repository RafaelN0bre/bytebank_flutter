import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumConta,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoValor,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint("Clicou no Pressionar");
              final int? numconta =
                  int.tryParse(_controladorCampoNumConta.text);
              final double? valor =
                  double.tryParse(_controladorCampoValor.text);
              if (numconta != null && valor != null) {
                final transferenciacriada = Transferencia(valor, numconta);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferenciacriada'),
                    action: SnackBarAction(
                      label: 'Action',
                      onPressed: () {
                        // Code to execute.
                      },
                    ),
                  ),
                );
              }
            },
            child: Text("Confirmar"),
          )
        ],
      ),
    );
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTranferencia(Transferencia(100, 1000)),
          ItemTranferencia(Transferencia(200, 2000)),
          ItemTranferencia(Transferencia(300, 3000)),
          ItemTranferencia(Transferencia(500, 5000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {},
      ),
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

  @override
  String toString() {
    return 'Transferencia{valor : $valor, numConta : $numConta';
  }
}
