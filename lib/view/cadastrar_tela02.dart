import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase/supabase.dart';
import 'package:torakka_anime/components/auth_state.dart';
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/utils/constants.dart';
import 'package:torakka_anime/view/widgets/fundoInicial.dart';

import '../utils/aux_func.dart';

class Cadastrar_Tela02 extends StatefulWidget {
  const Cadastrar_Tela02({Key? key}) : super(key: key);

  @override
  State<Cadastrar_Tela02> createState() => _Cadastrar_Tela02State();
}

class _Cadastrar_Tela02State extends AuthState<Cadastrar_Tela02> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email = '';
  String _password = '';
  String _nickname = '';

  Future _onSignUpPress(BuildContext context) async {
    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      //usar o userMetadata para mandar o nickname
      final response = await Supabase.instance.client.auth.signUp(
          _email, _password,
          options: AuthOptions(redirectTo: myAuthRedirectUrl));

      //debugPrint(response.data!.toJson().toString());
      if (response.error != null) {
        showToastMessage('Sign up failed: ${response.error!.message}');
      } else if (response.data == null && response.user == null) {
        showToastMessage(
            "Please check your email and follow the instructions to verify your email address.");
      } else {
        showToastMessage('Registration Success', isError: false);
        /*print(response.data?.user?.id);
        try {
          final res = await supabase.from('USER').insert([
            {
              'name': _nickname,
              'email': _email,
            }
          ]).execute();
          print(res.error!.message);
        } catch (e) {
          throw Exception(e);
        }*/

        //When a BuildContext is used from a StatefulWidget, the mounted property must be checked after an asynchronous gap.
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed("/entrar");
      }
    }
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
                              child: TextFormField(
                                onSaved: (value) => _nickname = value ?? '',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter some text';
                                  } else if (value.length < 4) {
                                    return 'less than 4 character';
                                  } else {
                                    return null;
                                  }
                                },
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
