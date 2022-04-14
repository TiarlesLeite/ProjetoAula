import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Este widget é a raiz do seu aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Este é o tema da sua aplicação.
        //
        // Tente executar seu aplicativo com "flutter run". Você verá o
        // o aplicativo tem uma barra de ferramentas azul. Então, sem sair do aplicativo, tente
        // alterando o primarySwatch abaixo para Colors.green e invocando
        // "hot reload" (pressione "r" no console onde você executou "flutter run",
        // ou simplesmente salve suas alterações em "hot reload" em um Flutter IDE).
        // Observe que o contador não voltou a zero; a aplicação
        // não é reiniciado.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

// Este widget é a página inicial do seu aplicativo. É stateful, ou seja,
  // que possui um objeto State (definido abaixo) que contém campos que afetam
  // como fica.

  // Esta classe é a configuração para o estado. Ele mantém os valores (neste
  // case o título) fornecido pelo pai (neste caso o widget App) e
  // usado pelo método build do State. Os campos em uma subclasse Widget são
  // sempre marcado como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta chamada para setState diz ao framework Flutter que algo tem
      // alterado neste estado, o que faz com que ele execute novamente o método de compilação abaixo
      // para que a exibição possa refletir os valores atualizados. se nós mudássemos
      // _counter sem chamar setState(), então o método build não seria
      // chamado novamente, e então nada parece acontecer.

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente toda vez que setState é chamado, por exemplo, como feito
    // pelo método _incrementCounter acima.
    //
    // O framework Flutter foi otimizado para fazer reexecutar métodos de compilação
    // rápido, para que você possa reconstruir qualquer coisa que precise de atualização em vez de
    // do que ter que alterar individualmente as instâncias de widgets.
    return Scaffold(
      appBar: AppBar(
        // Aqui pegamos o valor do objeto MyHomePage que foi criado por
        // o método App.build e use-o para definir o título da nossa barra de aplicativos.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout. Ele pega uma única criança e a posiciona
        // no meio do pai.
        child: Column(
          // A coluna também é um widget de layout. É preciso uma lista de crianças e
          // organiza-os verticalmente. Por padrão, ele se dimensiona para caber em seu
          // filhos horizontalmente e tenta ser tão alto quanto seu pai.
          //
          // Invoca "debug painting" (pressione "p" no console, escolha o
          // Ação "Toggle Debug Paint" do Flutter Inspector no Android
          // Studio ou o comando "Toggle Debug Paint" no Visual Studio Code)
          // para ver o wireframe de cada widget.
          //
          // A coluna tem várias propriedades para controlar como ela se dimensiona e
          // como ele posiciona seus filhos. Aqui usamos mainAxisAlignment para
          // centraliza os filhos verticalmente; o eixo principal aqui é a vertical
          // eixo porque as colunas são verticais (o eixo cruzado seria
          //horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você apertou o botão várias vezes:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incremento',
        child: const Icon(Icons.add),
      ), // Esta vírgula à direita torna a formatação automática mais agradável para métodos de construção.
    );
  }
}
