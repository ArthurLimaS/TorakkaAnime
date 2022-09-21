import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/utils/constants.dart';

String? validatePassword(String? value) {
  return value == null || value.isEmpty ? 'Invalid password' : null;
}

String? validateEmail(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  final RegExp regex = RegExp(pattern);
  if (value == null || !regex.hasMatch(value)) {
    return 'Not a valid email.';
  } else {
    return null;
  }
}

showToastMessage(String message, {bool isError = false}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: isError ? Colors.red : Colors.green);
}


//função para recuperar senha
/*Future _onPasswordRecoveryPress(BuildContext context) async {
  final form = formKey.currentState;

  if (form != null && form.validade()) {
    form.save();
    FocusScope.of(context).unfocus();

    final response = await supabase.auth.api.resetPasswordForEmail(_email,
        options: AuthOptions(redirectTo: myAuthRedirectUrl));
    if (response.error != null) {
      showToastMessage('Password recovery failed: ${response.error!.message}');
    } else {
      showToastMessage('please check your email for further instructions.');
    }
  }
}*/

//funcao para mudar senha
/*Future _onPasswordChangePress(BuildContext context) async {
  try {
    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      final userAttributes = UserAttributes(password: _password);
      final response = await supabase.auth.update(userAttributes);

      if (response.error != null) {
        throw 'password change failed: ${response.error!.message}';
      }

      showToastMessage('Password Update');
      //if(Navigator.canPop(context)){}
    } else {
      Navigator.of(context).pushReplacementNamed("/home");
    }
  } catch (e) {
    showToastMessage(e.toString());
  }
}*/
