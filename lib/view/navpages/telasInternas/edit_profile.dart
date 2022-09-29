import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/components/auth_required_state.dart';
import 'package:torakka_anime/components/auth_state.dart';
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/utils/constants.dart';

import '../../../utils/aux_func.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends AuthRequiredState<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _nicknameController;

  Future _onSavePress() async {
    String message = 'nothing to update';
    int count = 0;

    if (_nicknameController.text.isNotEmpty) {
      debugPrint('atualizando nome de usuario - ${_nicknameController.text}');
      message =
          await SupabaseRequest().updateActiveUser(_nicknameController.text);
      count += 1;
    }

    if (_passwordController.text.isNotEmpty) {
      debugPrint('Atualizando senha de usuario');
      message = await passwordChange();
      count += 1;
    }

    showToastMessage((count == 2) ? 'Nickname and Password Updated' : message);
  }

  //funcao para mudar senha
  Future passwordChange() async {
    try {
      final form = _formKey.currentState;

      if (form != null && form.validate()) {
        form.save();
        FocusScope.of(context).unfocus();

        final userAttributes =
            UserAttributes(password: _passwordController.text);
        final response = await supabase.auth.update(userAttributes);

        if (response.error != null) {
          debugPrint('password change failed: ${response.error!.message}');
        }

        return ('Password Update');
        //if(Navigator.canPop(context)){}
      } else {
        Navigator.of(context).pushReplacementNamed("/home");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    _nicknameController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
      body: Builder(builder: (BuildContext) {
        if (true) {
          return ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    // ================================================================================================= password===========================================================================
                    const Text(
                      'Edit Password:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 10, 34, 57),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (val) => validatePassword(val, true),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your new password',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(60, 0, 0, 0),
                                fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1000))),
                        onChanged: (value) {
                          // do something
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    // ================================================================================================= nickname===========================================================================
                    const Text(
                      'Edit Nickname:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 10, 34, 57),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _nicknameController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your new nickname',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(60, 0, 0, 0),
                                fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1000))),
                        onChanged: (value) {
                          // do something
                        },
                      ),
                    ),
                    const SizedBox(height: 100),
                    Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 10, 34, 57),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _onSavePress();
                            }
                          },
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
