class Book {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Book(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class BookStore {
  List<Book> books = [];
  int _nextId = 1;

  void tambahBuku(String judul, String penerbit, double harga, String kategori) {
    Book newBook = Book(_nextId, judul, penerbit, harga, kategori);
    _nextId++;
    books.add(newBook);
    print("Buku dengan judul '${newBook.judul}' telah ditambahkan.");
  }

  List<Book> semuaBuku() {
    return books;
  }

  void hapusBuku(int id) {
    try {
      Book bookToRemove = books.firstWhere((book) => book.id == id);
      books.remove(bookToRemove);
      print("Buku dengan judul '${bookToRemove.judul}' telah dihapus.");
    } catch (e) {
      print("Buku dengan ID $id tidak ditemukan.");
    }
  }
}

void main() {
  BookStore bookStore = BookStore();

  bookStore.tambahBuku("Dart Programming", "Publisher A", 25.0, "Programming");
  bookStore.tambahBuku("Flutter Basics", "Publisher B", 30.0, "Mobile Development");
  bookStore.tambahBuku("Data Structures", "Publisher C", 40.0, "Computer Science");

  print("Semua Buku:");
  bookStore.semuaBuku().forEach((book) {
    print("ID: ${book.id}, Judul: ${book.judul}, Penerbit: ${book.penerbit}, Harga: ${book.harga}, Kategori: ${book.kategori}");
  });

  bookStore.hapusBuku(2);

  print("Setelah Penghapusan:");
  bookStore.semuaBuku().forEach((book) {
    print("ID: ${book.id}, Judul: ${book.judul}, Penerbit: ${book.penerbit}, Harga: ${book.harga}, Kategori: ${book.kategori}");
  });
}
