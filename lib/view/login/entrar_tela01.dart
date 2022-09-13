import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/view/widgets/fundo_inicial.dart';

class EntrarTela01 extends StatefulWidget {
  const EntrarTela01({Key? key}) : super(key: key);

  @override
  State<EntrarTela01> createState() => _EntrarTela01State();
}

class _EntrarTela01State extends State<EntrarTela01> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  /*String _email = '';
  String _password = '';*/

  Future _onSignInPress() async {
    final response = await Supabase.instance.client.auth.signIn(
        email: _emailController.text, password: _passwordController.text);
    print(response.error.toString());
    if (response.error != null) {
      showToastMessage(response.error!.message, isError: true);
    } else {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
        _emailController.clear();
        _passwordController.clear();
      }
    }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        // --------------------------------------------------------- PLANO DE FUNDO -------------------------------------------------------------------------------
        child: const FundoInicial(title: 'background'),
      ),
      ListView(
        children: [
          Stack(children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(height: 50),
              Container(
                // // --------------------------------------------------------- IMG -------------------------------------------------------------------------------
                child: Container(
                  height: 250,
                  width: 375,
                  child: Image.asset('assets/img/logo2.png'),
                ),
              ),
              Form(
                // --------------------------------------------------------- EMAIL -------------------------------------------------------------------------------
                key: _formKey,
                child: Center(
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      controller: _emailController,
                      validator: (val) => validateEmail(val),
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
                    ),
                  ),
                ),
                // email ------------------------------------------------------------
              ),
              const SizedBox(height: 15),
              Container(
                // --------------------------------------------------------- PASSWORD -------------------------------------------------------------------------------
                // password ------------------------------------------------------------
                child: Center(
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      validator: (val) => validatePassword(val),
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
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _onSignInPress();
                  }
                },
                child: Container(
                  // --------------------------------------------------------- LOG IN -------------------------------------------------------------------------------
                  // log in ------------------------------------------------------------
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 11, 53, 205),
                    borderRadius: BorderRadius.circular(21),
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
              ),
              const SizedBox(height: 30),
              Container(
                // --------------------------------------------------------- TEXTO -------------------------------------------------------------------------------
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "Don't have an account?",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 54, 205),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed("/cadastrar");
                        },
                        child: const Text('Create account',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ]),
        ],
      ),
    ]));
  }
}
