import 'package:flutter/material.dart';

class DiscoverTela04 extends StatefulWidget {
  const DiscoverTela04({Key? key}) : super(key: key);

  @override
  State<DiscoverTela04> createState() => _DiscoverTela04State();
}

class _DiscoverTela04State extends State<DiscoverTela04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // ------------------------------------------- APP BAR -----------------------------------------
        title: Column(
          children: [
            SizedBox(
              width: 10000,
              child: Center(
                  child: SizedBox(
                      height: 45,
                      width: 65,
                      child: Image.asset("assets/img/logo3.png"))),
            ),
            SizedBox(
              width: 400,
              height: 30,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Discover',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(60, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1000))),
                onChanged: (value) {
                  // do something
                },
              ),
            ),
          ],
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      backgroundColor: Colors.white,
      body: ListView(),
    );
  }
}
