import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/FundoInicial.dart';

class Entrar_Tela01 extends StatefulWidget {
  const Entrar_Tela01({Key? key}) : super(key: key);

  @override
  State<Entrar_Tela01> createState() => _Entrar_Tela01State();
}

class _Entrar_Tela01State extends State<Entrar_Tela01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        // --------------------------------------------------------- PLANO DE FUNDO -------------------------------------------------------------------------------
        child: const FundoInicial(title: 'background'),
      ),
      Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 50),
          Container(
            // // --------------------------------------------------------- IMG -------------------------------------------------------------------------------
            child: Container(
              height: 250,
              width: 375,
              child: Image.asset('assets/img/logo2.png'),
            ),
          ),
          Container(
            // --------------------------------------------------------- EMAIL -------------------------------------------------------------------------------
            child: Center(
              child: Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'E-mail',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(60, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1000))),
                  onChanged: (value) {
                    // do something
                  },
                ),
              ),
            ),
            // email ------------------------------------------------------------
          ),
          const SizedBox(height: 15),
          Container(
            // --------------------------------------------------------- PASSWORD -------------------------------------------------------------------------------
            // password ------------------------------------------------------------
            child: Center(
              child: Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(60, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1000))),
                  onChanged: (value) {
                    // do something
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
            child: Container(
              // --------------------------------------------------------- LOG IN -------------------------------------------------------------------------------
              // log in ------------------------------------------------------------
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 53, 205),
                borderRadius: BorderRadius.circular(21),
              ),
              child: const Center(
                child: Text(
                  "Log in",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            // --------------------------------------------------------- TEXTO -------------------------------------------------------------------------------
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "Don't have an account?",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Color.fromARGB(255, 11, 54, 205),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/cadastrar");
                    },
                    child: const Text('Create account',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ]));
  }
}
