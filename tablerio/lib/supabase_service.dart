import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final _supabase = Supabase.instance.client;

  // Ejemplo: Obtener todos los juegos de la tabla 'games'
  Future<List<Map<String, dynamic>>> getGames() async {
    final response = await _supabase
        .from('games')
        .select();
    return response as List<Map<String, dynamic>>;
  }

  // Ejemplo: Obtener el perfil del usuario actual
  Future<Map<String, dynamic>?> getMyProfile() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;

    final response = await _supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();
    return response as Map<String, dynamic>?;
  }

  // Ejemplo: Cerrar sesión
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
