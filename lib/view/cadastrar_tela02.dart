import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/FundoInicial.dart';
import 'package:torakka_anime/view/FundoInicial.dart';

class Cadastrar_Tela02 extends StatefulWidget {
  const Cadastrar_Tela02({Key? key}) : super(key: key);

  @override
  State<Cadastrar_Tela02> createState() => _Cadastrar_Tela02State();
}

class _Cadastrar_Tela02State extends State<Cadastrar_Tela02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        // --------------------------------------------------------- plano de fundo -------------------------------------------------------------------------------
        child: const FundoInicial(title: 'background'),
      ),
      Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            // --------------------------------------------------------- img -------------------------------------------------------------------------------
            // logo -------------
            height: 180,
            width: 375,
            child: Image.asset('assets/img/logo2.png'),
          ),
          Container(
            // ================================== NICK NAME =============================================== NICK NAME
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nickname',
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
                Container(
                  // ====================================== GENDER ====================================== GENDER
                  child: Center(
                    child: Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Gender',
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
                Container(
                  // ====================================== EMAIL ================================= EMAIL
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
                ),
                const SizedBox(height: 15),
                Container(
                  // ================================= PASSWORD ============================ PASSWORD
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
                Container(
                  // =============================== RE-PASSWORD ================== RE-PASSWORD
                  child: Center(
                    child: Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Re-Password',
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
              ],
            ),
          ),
          const SizedBox(height: 55),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/entrar");
            },
            child: Container(
              // --------------------------------------------------------- Sign up -------------------------------------------------------------------------------
              // botao
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 53, 205),
                borderRadius: BorderRadius.circular(21),
              ),
              child: const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    ]));
  }
}
