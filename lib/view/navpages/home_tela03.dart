import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/widgets/topAnime.dart';

class Home_Tela03 extends StatefulWidget {
  const Home_Tela03({Key? key}) : super(key: key);

  @override
  State<Home_Tela03> createState() => _Home_Tela03State();
}

class _Home_Tela03State extends State<Home_Tela03> {
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
      backgroundColor: Colors.white,
      // ================================================================= BODY ========================================================================
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //============================================================== TOP AIRING ANIME======================================================
                height: 400,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  Container(
                    height: 50,
                    color: const Color.fromARGB(255, 10, 34, 57),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Top Airing Anime",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                              onPressed: () {},
                              child: const Text('More',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const TopAnime(
                      // ========================================================== TOP 1 ===============================================
                      numero: '1',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TopAnime(
                      // ========================================================== TOP 2 ===============================================
                      numero: '2',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(height: 5),
                  const TopAnime(
                      // ========================================================== TOP 3 ===============================================
                      numero: '3',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                ]),
              ),
              const SizedBox(height: 30),
              Container(
                //============================================================== TOP ANIME======================================================
                height: 400,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  Container(
                    height: 50,
                    color: const Color.fromARGB(255, 10, 34, 57),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Top Anime",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                              onPressed: () {},
                              child: const Text('More',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const TopAnime(
                      // ========================================================== TOP 1 ===============================================
                      numero: '1',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TopAnime(
                      // ========================================================== TOP 2 ===============================================
                      numero: '2',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(height: 5),
                  const TopAnime(
                      // ========================================================== TOP 3 ===============================================
                      numero: '3',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                ]),
              ),
              const SizedBox(height: 30),
              Container(
                //============================================================== TOP UPCOMING ANIME======================================================
                height: 400,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  Container(
                    height: 50,
                    color: const Color.fromARGB(255, 10, 34, 57),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Top Upcoming Anime",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                              onPressed: () {},
                              child: const Text('More',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const TopAnime(
                      // ========================================================== TOP 1 ===============================================
                      numero: '1',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TopAnime(
                      // ========================================================== TOP 2 ===============================================
                      numero: '2',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(height: 5),
                  const TopAnime(
                      // ========================================================== TOP 3 ===============================================
                      numero: '3',
                      imgLink:
                          "https://s3-alpha-sig.figma.com/img/a9fb/1f64/64c5a4e2112ab9a41a0526cf1b1c8b14?Expires=1659916800&Signature=T3HPQqeR0Dw~qGMB7PMnPh9RvgjLX4gdpsQ9ReeYI5DwTcpgrcdTfN5ImsBkDpfEBu71SA7PfAX3QAJogfGFc5SYddYsNCOxcza6i~hjq8kOMgXqQk6QIWX5WFphi-484L5e5MGLC~OSh2cJK2y8rHP7SBIpnhiFXmdcQmx9G-Bw2fMDdiyUQqIDUSGXWHJI6X4ir34rTiTtwzLNYR4OR~bxJHlGNHMyC5wFzkikuaNDegaR5GoNONMCzTqn848zYjg0YzUzoeZqe-mz6-XduSLyh3Xn4XqeQfBJxW6PCWhjj2PbLdSv6zzC-5hhKivx9auVNYnTZS4r3lqKE4AKGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                ]),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
