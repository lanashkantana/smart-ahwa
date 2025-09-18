enum DrinkType { shai, turkishCoffee, hibiscus, karkadeh, other }

extension DrinkTypeExt on DrinkType {
  String get label {
    switch (this) {
      case DrinkType.shai:
        return 'Shai (شاي)';
      case DrinkType.turkishCoffee:
        return 'Turkish Coffee (قهوة تركي)';
      case DrinkType.hibiscus:
        return 'Hibiscus (كركديه)';
      case DrinkType.karkadeh:
        return 'Karkadeh (كركديه بديل)';
      case DrinkType.other:
        return 'Other';
    }
  }
}
