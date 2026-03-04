import 'package:school_app/core/config/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._();

  static final _instance = SupabaseService._();
  static SupabaseService get instance => _instance;
  final SupabaseClient _client = Supabase.instance.client;
  SupabaseClient get client => _client;

  init() async {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
    );
  }
}
