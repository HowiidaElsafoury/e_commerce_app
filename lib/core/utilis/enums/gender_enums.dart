enum Gender { male, female }

extension GenderExtension on Gender {
  String toStr() {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
    }
  }
}
