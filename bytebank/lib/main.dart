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
          Editor(
              controlador: _controladorCampoNumConta,
              dica: '0000',
              rotulo: 'Número da Conta'),
          Editor(
            controlador: _controladorCampoValor,
            dica: '0.00',
            rotulo: 'Valor',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () {
              _criaTransferencia(context);
            },
            child: Text("Confirmar"),
          )
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numconta = int.tryParse(_controladorCampoNumConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numconta != null && valor != null) {
      final transferenciacriada = Transferencia(valor, numconta);
      debugPrint('criando transferencia');
      debugPrint('$transferenciacriada');
      Navigator.pop(context, transferenciacriada);
    }
    ;
  }
}

class Editor extends StatelessWidget {
  @override
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  // Para parâmteros necessários que não podem ser nulos, utilizamos o required no construtor, para parâmteros que podem ser nulos, declaramos seu tipo com ?, assumindo que podem receber valores nulos
  const Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
      ),
    );
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  final List<Transferencia?> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    _transferencias.add(
      Transferencia(122, 12344),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
          future.then((transferenciaRecebida) {
            debugPrint("Uma transferência foi recebida");
            debugPrint('$transferenciaRecebida');
            _transferencias.add(transferenciaRecebida);
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia? _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia!.valor.toString()),
        subtitle: Text(_transferencia!.numConta.toString()),
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
    return 'Transferencia{valor : $valor, numConta : $numConta}';
  }
}
