//TODO: add your SUPABASE_URL / SUPABASE_KEY here
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://xtvvmuslbpdcgzlbpkdw.supabase.co/';
const supabaseAnnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh0dnZtdXNsYnBkY2d6bGJwa2R3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTkxNTQ1NDUsImV4cCI6MTk3NDczMDU0NX0.b6TjHEpFj40jYFy-v0hs38xlDkCGdm2xnpM4xrr_wKo';

//supabase cliente
final supabase = Supabase.instance.client;

//TODO: add your MYANIMELIST_URL / MYANIMELIST_KEY
const malUrl = 'https://api.myanimelist.net/v2/';
const malKey = '6e5f66c52a149f1c14b8cfb968373f3e';

