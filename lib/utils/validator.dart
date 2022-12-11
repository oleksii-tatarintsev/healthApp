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
  static String? validateUpperPressure({required String pressure}) {
    
    if(pressure.isEmpty){
      return '';
    }
    if(int.parse(pressure) < 40 && int.parse(pressure) > 200){
      return 'Введите действительное значение';
    }

    return null;
  }

  static String? validateLowerPressure({required String pressure}) {
    if(pressure.isEmpty){
      return '';
    }
    if(int.parse(pressure) < 30 && int.parse(pressure) > 150){
      return 'Введите действительное значение';
    }

    return null;
  }
}
