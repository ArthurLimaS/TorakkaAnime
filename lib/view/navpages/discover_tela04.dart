import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Discover_Tela04 extends StatefulWidget {
  const Discover_Tela04({Key? key}) : super(key: key);

  @override
  State<Discover_Tela04> createState() => _Discover_Tela04State();
}

class _Discover_Tela04State extends State<Discover_Tela04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ------------------------------------------- APP BAR -----------------------------------------
        titleSpacing: 0.0,
        title: Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    padding: const EdgeInsets.only(bottom: 0, top: 30),
                    iconSize: 55,
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle_rounded)),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text('Home',
                      style: TextStyle(
                        shadows: [
                          Shadow(color: Colors.white, offset: Offset(0, -10))
                        ],
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 3,
                      )),
                ),
              ],
            ),
            const SizedBox(width: 90),
            SizedBox(
                child: Center(
                    child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Image.asset("assets/img/logo3.png")))),
          ],
        ),
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      body: Container(
        color: Color.fromARGB(255, 255, 0, 0),
      ),
    );
  }
}
