class HadeelValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'الرجاء إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (value.length != 9) {
      return 'يجب أن يكون رقم الهاتف 9 أرقام';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'الرجاء إدخال أرقام فقط';
    }
    return null;
  }

  static String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }
}
