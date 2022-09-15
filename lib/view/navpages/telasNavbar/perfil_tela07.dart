import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PerfilTela07 extends StatefulWidget {
  const PerfilTela07({Key? key}) : super(key: key);

  @override
  State<PerfilTela07> createState() => _PerfilTela07State();
}

class _PerfilTela07State extends State<PerfilTela07> {
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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 217,
                color: const Color.fromARGB(255, 10, 34, 57),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    child: const Text('My Profile',
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
                ),
              ),
              Container(
                height: 400,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Container(
                      // ================================================================== IMG DO ANIME =============================================
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Align(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 185,
                            height: 285,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(""),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // ================================================================================ NOME ==============================================================================
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 20),
                            height: 50,
                            width: 140,
                            child: Text(
                              'GG_desu',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 218, 218, 218),
                            thickness: 1,
                          ),
                          Align(
                            child: Container(
                              // ================================================================================ LISTA DE ANIME ======================================================================
                              height: 40,
                              width: 140,
                              child: Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 10, 34, 57),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Anime List',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 218, 218, 218),
                            thickness: 1,
                          ),
                          const SizedBox(height: 70),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            // ================================================================================ STATUS DO ANIME ======================================================================
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Anime Stats',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 10, 34, 57),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Total Entries',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 10, 34, 57),
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        '788',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 10, 34, 57),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  // ================================================================================ WATCHING ======================================================================
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 36, 255, 0)),
                    ),
                    Text(
                      'Watching',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 10, 34, 57),
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        '21',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 10, 34, 57),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  // ================================================================================ DROPPED ======================================================================
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 161, 0, 0)),
                    ),
                    Text(
                      'Dropped',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 10, 34, 57),
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        '38',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 10, 34, 57),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  // ================================================================================ COMPLETED ======================================================================
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 11, 54, 205)),
                    ),
                    Text(
                      'Completed',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 10, 34, 57),
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        '607',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 10, 34, 57),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  // ================================================================================ PLAN TO WATCH ======================================================================
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 102, 102, 102)),
                    ),
                    Text(
                      'Plan to Watch',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 10, 34, 57),
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        '122',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 10, 34, 57),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(color: Colors.grey, thickness: 1),
          const SizedBox(height: 15),
          Container(
            // ================================================================================ FAVORITES ======================================================================
            padding: EdgeInsets.only(left: 20),
            child: const Text(
              'Favorites',
              style: TextStyle(
                color: Color.fromARGB(255, 10, 34, 57),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: 115,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.myanimelist.net/images/anime/1880/118484.jpg"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: 115,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.myanimelist.net/images/anime/1880/118484.jpg"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: 115,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.myanimelist.net/images/anime/1880/118484.jpg"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: 115,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.myanimelist.net/images/anime/1880/118484.jpg"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: 115,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.myanimelist.net/images/anime/1880/118484.jpg"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
