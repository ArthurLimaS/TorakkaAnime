import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/view/cadastrar_tela02.dart';
import 'package:torakka_anime/view/entrar_tela01.dart';
import 'package:torakka_anime/view/navpages/main_navpag.dart';
import 'package:torakka_anime/view/widgets/fundo_inicial.dart';
import 'package:torakka_anime/view/navpages/home_tela03.dart';
import 'package:torakka_anime/view/inicial_tela00.dart';

import 'requests/supabase_request.dart';
import 'utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await supabaseInitialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => const InicialTela00(),
          "/entrar": (BuildContext context) => const EntrarTela01(),
          "/cadastrar": (BuildContext context) => const CadastrarTela02(),
          "/home": (BuildContext context) => const MainNavPage(),
        });
  }
}



/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
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
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
