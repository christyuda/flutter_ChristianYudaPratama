class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw Exception("Cannot divide by zero");
    }
    return a / b;
  }
}

class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
    print("Course '${course.judul}' ditambahkan ke daftar course milik $nama.");
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
    print("Course '${course.judul}' dihapus dari daftar course milik $nama.");
  }

  void lihatDaftarCourse() {
    if (daftarCourse.isEmpty) {
      print("$nama belum memiliki course.");
    } else {
      print("Daftar course milik $nama:");
      for (var course in daftarCourse) {
        print("- ${course.judul}: ${course.deskripsi}");
      }
    }
  }
}

void main() {
  // Penggunaan kelas Calculator
  Calculator calculator = Calculator();
  print("Penjumlahan: ${calculator.add(5, 3)}");
  print("Pengurangan: ${calculator.subtract(10, 4)}");
  print("Perkalian: ${calculator.multiply(7, 2)}");
  print("Pembagian: ${calculator.divide(15, 3)}");

  // Penggunaan kelas Course dan Student
  Course course1 = Course("Dart Programming", "Learn Dart programming language");
  Course course2 = Course("Flutter Basics", "Introduction to Flutter framework");

  Student student = Student("John Doe", "12A");
  student.tambahCourse(course1);
  student.tambahCourse(course2);
  student.lihatDaftarCourse();

  student.hapusCourse(course1);
  student.lihatDaftarCourse();
}
