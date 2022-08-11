import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/utils/constants.dart';

Future supabaseInitialize() async {
  //init supabase singleton
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnnonKey);
}

Future<void> createNewUser(
    context, String email, String password, String nickname) async {
  final res = await supabase.auth.signUp(email, password,
      options: AuthOptions(redirectTo: myAuthRedirectUrl));

  //debugPrint(res.data!.toJson().toString());

  if (res.error != null) {
    showToastMessage('Sign up failed: ${res.error!.message}', isError: true);
  } else if (res.data != null) {
    /*try {
      await supabase.from('user').insert([
        {'name': nickname, 'email': email, 'id_user': res.data!.user!.id}
      ]).execute();
    } catch (e) {
      throw Exception(e);
    }*/
    showToastMessage('Registration Success', isError: false);
    Navigator.of(context).pushReplacementNamed("/entrar");
  }
}

Future<void> signInExistingUser(context, String email, String? password) async {
  final res = await supabase.auth.signIn(
    email: email,
    password: password,
  );

  debugPrint(res.data!.toJson().toString());

  if (res.data != null) {
    showToastMessage('Login Success', isError: false);
    Navigator.pushReplacementNamed(context, '/home');
  } else if (res.error != null) {
    showToastMessage('Erro ${res.error!.message.toString()}', isError: true);
  }
}

Future<GotrueResponse> signOutActiveUser(context) async {
  final res = await supabase.auth.signOut();
  Navigator.pushReplacementNamed(context, '/entrar');

  return res;
}

User? getActiveUser() {
  final user = supabase.auth.user();

  return user;
}
/*
Future<GotrueJsonResponse> resetExistingUserPassword(
      String email, String? urlPath) async {
    final res = await supabase.auth.api.resetPasswordForEmail(
      email,
      options: AuthOptions(
        redirectTo: urlPath,
      ),
    );

    return res;
  }*/