class Validator {
  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return 'Введите имя';
    }
    if (name.length < 2 || name.length > 13) {
      return 'Введите действительное имя';
    }
    if (name.contains(RegExp('[0-9]'))) {
      return 'Пожалуйста, используйте буквы';
    }

    return null;
  }
  static String? validateLastName({required String name}) {
    if (name.isEmpty) {
      return 'Введите фамилию';
    }
    if (name.length < 2 || name.length > 13) {
      return 'Введите действительную фамилию';
    }
    if (name.contains(RegExp('[0-9]'))) {
      return 'Пожалуйста, используйте буквы';
    }

    return null;
  }
}