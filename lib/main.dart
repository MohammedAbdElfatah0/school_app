import 'package:flutter/material.dart';
import 'package:school_app/school_app.dart';

import 'core/networks/supabase_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SupabaseService.instance.init();
  runApp(const SchoolApp());
}
