class Validators {
  static String? email(String? v) {
    if (v == null || v.isEmpty) return 'Enter email';
    final p = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$";
    if (!RegExp(p).hasMatch(v)) return 'Invalid email';
    return null;
  }
  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Enter password';
    if (v.length < 6) return 'Min 6 chars';
    return null;
  }
}