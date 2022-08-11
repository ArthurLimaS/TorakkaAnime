import 'package:flutter/material.dart';

class TopContainer extends StatefulWidget {
  const TopContainer({Key? key, required this.nome}) : super(key: key);

  final String nome;
  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  get nome => widget.nome;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: const Color.fromARGB(255, 10, 34, 57),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            nome,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                  fontSize: 20,
                )),
                onPressed: () {
                  Navigator.of(context).pushNamed("/more", arguments: nome);
                },
                child:
                    const Text('More', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
