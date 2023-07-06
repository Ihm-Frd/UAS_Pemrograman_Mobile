//udh jadi ini
class Blog {
  final String ar;
  final String id;
  final String nomor;
  final String tr;

  const Blog({
    required this.ar,
    required this.id,
    required this.nomor,
    required this.tr,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      ar: json['ar'],
      id: json['id'],
      nomor: json['nomor'],
      tr: json['tr'],
    );
  }
}
