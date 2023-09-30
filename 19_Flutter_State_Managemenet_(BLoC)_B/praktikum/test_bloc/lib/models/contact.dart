import 'dart:ui';

class Contact {
  final String name;
  final String phone;
  final String date;
  final Color color;
  final String fileName;

  Contact({
    required this.name,
    required this.phone,
    required this.date,
    required this.color,
    required this.fileName,
  });

  // Buat factory constructor untuk mengkonversi Map ke objek Contact jika diperlukan
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'],
      phone: map['phone'],
      date: map['date'],
      color: Color(int.parse(map['color'])),
      fileName: map['fileName'],
    );
  }

  // Buat method untuk mengkonversi objek Contact ke Map jika diperlukan
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'date': date,
      'color': color.value.toString(),
      'fileName': fileName,
    };
  }
}
