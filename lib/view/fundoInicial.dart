import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

class fundoInicial extends StatefulWidget {
  const fundoInicial({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<fundoInicial> createState() => _fundoInicialState();
}

// ignore: camel_case_types
class _fundoInicialState extends State<fundoInicial> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/capa.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor:
                const Color.fromARGB(1, 10, 34, 57).withOpacity(0.965)),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.5, sigmaY: 6.5),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    ]);
  }
}
