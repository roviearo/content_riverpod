class AuthException implements Exception {
  AuthException([
    this.message = 'Login Error',
  ]);
  final String message;

  factory AuthException.fromCode(String code) {
    switch (code) {
      case 'invalid-credential':
        return AuthException(
          'Kredensial yang diterima rusak atau telah kedaluwarsa.',
        );
      case 'operation-not-allowed':
        return AuthException(
          'Operasi tidak diperbolehkan. Silahkan hubungi IT Support.',
        );
      case 'user-disabled':
        return AuthException(
          'Pengguna ini telah dinonaktifkan. Silahkan hubungi IT Support untuk bantuan.',
        );
      case 'user-not-found':
        return AuthException(
          'Email tidak ditemukan, silahkan hubungi IT Support untuk buat akun.',
        );
      case 'wrong-password':
        return AuthException(
          'Kata sandi salah, silahkan coba lagi.',
        );
      default:
        return AuthException();
    }
  }
}
