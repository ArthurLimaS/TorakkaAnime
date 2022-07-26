import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/fundoInicial.dart';

class inicial_tela00 extends StatefulWidget {
  const inicial_tela00({Key? key}) : super(key: key);

  @override
  State<inicial_tela00> createState() => _inicial_tela00State();
}

class _inicial_tela00State extends State<inicial_tela00> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: const fundoInicial(title: 'background'),
        ),
        Container(
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              child: Image.asset('assets/img/logo1.png'),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 400),
              Container(
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 53, 205),
                  borderRadius: BorderRadius.circular(1000),
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
              const SizedBox(height: 15),
              Container(
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: const Center(
                  child: Text(
                    "Sing up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
