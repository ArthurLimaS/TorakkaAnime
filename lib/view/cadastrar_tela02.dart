import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase/supabase.dart' as supabase;
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/view/widgets/fundo_inicial.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/aux_func.dart';

class CadastrarTela02 extends StatefulWidget {
  const CadastrarTela02({Key? key}) : super(key: key);

  @override
  State<CadastrarTela02> createState() => _CadastrarTela02State();
}

class _CadastrarTela02State extends State<CadastrarTela02> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email = '';
  String _password = '';

  Future _onSignUpPress(BuildContext context) async {
    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      final response = await createNewUser(_email, _password);
      if (response.error != null) {
        showMessage('Sign up failed: ${response.error!.message}');
      } else if (response.data == null && response.user == null) {
        showMessage(
            "Please check your email and follow the instructions to verify your email address.");
      } else {
        Navigator.of(context).pushReplacementNamed("/entrar");
      }
    }
  }

  void showMessage(String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Stack(children: [
          Container(
            // --------------------------------------------------------- plano de fundo -------------------------------------------------------------------------------
            child: const FundoInicial(title: 'background'),
          ),
          ListView(
            children: [
              Stack(children: [
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    // --------------------------------------------------------- img -------------------------------------------------------------------------------
                    // logo -------------
                    height: 150,
                    width: 375,
                    child: Image.asset('assets/img/logo2.png'),
                  ),
                  Form(
                    key: formKey,
                    // ================================== NICK NAME =============================================== NICK NAME
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: Container(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Nickname',
                                    hintStyle: const TextStyle(
                                        color: Color.fromARGB(60, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21),
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000))),
                                onChanged: (value) {
                                  // do something
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          // ====================================== EMAIL ================================= EMAIL
                          child: Center(
                            child: Container(
                              width: 300,
                              child: TextFormField(
                                onSaved: (value) => _email = value ?? '',
                                validator: (val) => validateEmail(val),
                                keyboardType: TextInputType.emailAddress,
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
                                        borderRadius:
                                            BorderRadius.circular(1000))),
                                onChanged: (value) {
                                  // do something
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          // ================================= PASSWORD ============================ PASSWORD
                          child: Center(
                            child: Container(
                              width: 300,
                              child: TextFormField(
                                onSaved: (value) => _password = value ?? '',
                                validator: (val) => validatePassword(val),
                                obscureText: true,
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
                                        borderRadius:
                                            BorderRadius.circular(1000))),
                                onChanged: (value) {
                                  // do something
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  const SizedBox(height: 55),
                  GestureDetector(
                    onTap: () {
                      _onSignUpPress(context);
                    },
                    child: Container(
                      // --------------------------------------------------------- Sign up -------------------------------------------------------------------------------
                      // botao
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 11, 53, 205),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ]),
            ],
          ),
        ]));
  }
}
