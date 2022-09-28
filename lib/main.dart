import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/view/login/cadastrar_tela02.dart';
import 'package:torakka_anime/view/login/entrar_tela01.dart';
import 'package:torakka_anime/view/navpages/main_navpag.dart';
import 'package:torakka_anime/view/navpages/telasInternas/tela_anime.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/lista_tela06.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/perfil_tela07.dart';
import 'package:torakka_anime/view/widgets/fundo_inicial.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/home_tela03.dart';
import 'package:torakka_anime/view/login/inicial_tela00.dart';
import 'package:torakka_anime/view/navpages/telasInternas/top_more.dart';

import 'requests/supabase_request.dart';

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
          "/more": (BuildContext context) => const TopMore(),
          "/anime": (BuildContext context) => const TelaAnime(),
        });
  }
}
