import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/utils/constants.dart';

Future supabaseInitialize() async {
  //init supabase singleton
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnnonKey);
}

Future<GotrueSessionResponse> createNewUser(
    String email, String password) async {
  final res = await supabase.auth.signUp(email, password,
      options: AuthOptions(redirectTo: myAuthRedirectUrl));

  return res;
}

Future<GotrueSessionResponse> signInExistingUser(
    String email, String? password) async {
  final res = await supabase.auth.signIn(
    email: email,
    password: password,
  );

  return res;
}

Future<GotrueResponse> signOutActiveUser() async {
  final res = await supabase.auth.signOut();

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