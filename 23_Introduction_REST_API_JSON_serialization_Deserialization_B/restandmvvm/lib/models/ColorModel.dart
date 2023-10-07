class ColorModel {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  ColorModel({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      year: json['year'] ?? 0,
      color: json['color'] ?? '',
      pantoneValue: json['pantone_value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'color': color,
      'pantone_value': pantoneValue,
    };
  }
}
