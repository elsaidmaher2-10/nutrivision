import 'package:firebase_auth/firebase_auth.dart';

abstract final class AuthErrorMapper {
  static String map(FirebaseAuthException e) {
    return switch (e.code) {
      'user-not-found' => 'البريد الإلكتروني غير مسجل لدينا',
      'wrong-password' => 'كلمة المرور غير صحيحة',
      'invalid-credential' => 'البريد الإلكتروني أو كلمة المرور غير صحيحة',
      'invalid-email' => 'صيغة البريد الإلكتروني غير صحيحة',
      'user-disabled' => 'تم تعطيل هذا الحساب مؤقتاً',
      'email-already-in-use' => 'هذا البريد الإلكتروني مسجل بالفعل',
      'weak-password' => 'كلمة المرور ضعيفة جداً',
      'network-request-failed' => 'يرجى التحقق من اتصالك بالإنترنت',
      'too-many-requests' => 'محاولات كثيرة خاطئة، يرجى الانتظار والمحاولة لاحقاً',
      _ => e.message ?? 'حدث خطأ أثناء المصادقة، يرجى المحاولة لاحقاً',
    };
  }
}
