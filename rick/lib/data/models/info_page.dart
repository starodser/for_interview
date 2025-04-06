class InfoPage {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  InfoPage({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory InfoPage.fromJson(Map<String, dynamic> json) {
    return InfoPage(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}