class EmptyValidator {

  static String? empty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '*Campo obrigatório';
    }
    return null;
  }
}