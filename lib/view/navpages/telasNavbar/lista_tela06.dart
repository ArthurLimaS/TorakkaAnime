import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListaTela06 extends StatefulWidget {
  const ListaTela06({Key? key}) : super(key: key);

  @override
  State<ListaTela06> createState() => _ListaTela06State();
}

class _ListaTela06State extends State<ListaTela06> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // ------------------------------------------- APP BAR -----------------------------------------
        title: Center(
            child: SizedBox(
                height: 65,
                width: 65,
                child: Image.asset("assets/img/logo3.png"))),
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      backgroundColor: Colors.white,
      body: ListView(),
    );
  }
}
