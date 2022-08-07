import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/utils/constants.dart';

Future supabaseInitialize() async {
  //init supabase singleton
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnnonKey);
  //await Supabase.initialize(url: )
}
