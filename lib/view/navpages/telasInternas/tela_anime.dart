import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TelaAnime extends StatefulWidget {
  const TelaAnime({Key? key}) : super(key: key);

  @override
  State<TelaAnime> createState() => _TelaAnimeState();
}

class _TelaAnimeState extends State<TelaAnime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        // ------------------------------------------- APP BAR -----------------------------------------
        title: SizedBox(
            height: 65, width: 65, child: Image.asset("assets/img/logo3.png")),
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                // ================================================================ TITULO ==================================================
                height: 205,
                color: const Color.fromARGB(255, 10, 34, 57),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Made in Abyss: Retsujitsu no Ougonkyou',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
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
                                image: NetworkImage(
                                    "https://cdn.myanimelist.net/images/anime/1864/122519.jpg"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // ================================================================================ STATUS DO ANIME =====================================
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 140,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Watching',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 218, 218, 218),
                            thickness: 1,
                          ),
                          Container(
                            // ================================================================================ EPISODES =====================================
                            height: 80,
                            width: 140,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Episodes',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '1/12',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle_outline_rounded,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 218, 218, 218),
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 50,
                            child: Center(
                              // ================================================================================ ADD FAVORITES =====================================
                              child: Text(
                                'Add to Favorites',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 10, 34, 57),
                                  fontSize: 20,
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            // ================================================================ INFO DO ANIME/RANK/POPULARITY... =========================================================
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rank',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '#37',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Popularity',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '#952',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Score',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '8.77',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalDivider(
                          color: Color.fromARGB(255, 218, 218, 218),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'TV',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Airing',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            '12 episodes',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              const Divider(
                color: Color.fromARGB(255, 218, 218, 218),
                thickness: 1,
              ),
              const SizedBox(height: 15),
              Container(
                // ================================================ INFO DO ANIME/TEMPORADA/TEMPO POR EP ======================================================
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Summer 2022 • Wednesdays at 22:30 • 24 min per ep.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 34, 57),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Color.fromARGB(255, 218, 218, 218),
                thickness: 1,
              ),
              const SizedBox(height: 15),
              Container(
                // ================================================ INFO DO ANIME/RATING/SOURCE.. ======================================================
                child: Column(children: [
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 34, 57),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.end,
                          'R - 17 +',
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 34, 57),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Source',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 34, 57),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.end,
                          'Web Manga',
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 34, 57),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Studio',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 34, 57),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.end,
                          'Kinema Citrus',
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 34, 57),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Aired',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 34, 57),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.end,
                          'Jul 6, 2022 to ?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 34, 57),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Color.fromARGB(255, 218, 218, 218),
                thickness: 1,
              ),
              const SizedBox(height: 15),
              Container(
                // ================================================ generos ======================================================
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 11, 53, 205),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: const Center(
                        child: Text(
                          'Adventure',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 11, 53, 205),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: const Center(
                        child: Text(
                          'Drama',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 11, 53, 205),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: const Center(
                        child: Text(
                          'Fantasy',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 11, 53, 205),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: const Center(
                        child: Text(
                          'Sci-Fi',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Color.fromARGB(255, 218, 218, 218),
                thickness: 1,
              ),
              const SizedBox(height: 15),
              Container(
                // ================================================ synopsys ======================================================
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Synopsis',
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Directly after the events of Made in Abyss Movie 3: Dawn of the Deep Soul, the fifth installment of Made in Abyss covers the adventure of Reg, Riko, and Nanachi in the Sixth Layer, The Capital of the Unreturned.',
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 65),
                          ]),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
