
class ResponseModel<T> {
  int? count;
  String? next;
  String? previous;
  dynamic results;
  String? action;
  int? total;
  int? perPage;
  int? page;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;

  ResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.action,
    this.total,
    this.perPage,
    this.page,
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
  });

  ResponseModel.fromJson(Map<String, dynamic> json, T fromJson(Map<String, dynamic> json)) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    action = json['action'];

    if (json["results"] != null && fromJson != null) {
      if (json['results'].toString()[0] == "[") {
        results = List<T>.from(json['results'].map((x) => fromJson(x)));
      } else {
        results = fromJson(json['results']);
      }
    }

    total = json['total'];
    perPage = json['per_page'];
    page = json['page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    from = json['from'];
    to = json['to'];

  }

  ResponseModel<T> copyWith({
    int? nextcount,
    String? nextprevious,
    String? errorprevious,
    String? action,
    dynamic results,
    int? total,
    int? perPage,
    int? page,
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    List<T>? result,
  }) {
    return ResponseModel<T>(
      count: nextcount ?? this.count,
      next: nextprevious ?? this.next,
      previous: errorprevious ?? this.previous,
      action: action ?? this.action,
      results: results ?? this.results,
      total: total ?? this.total,
      perPage: perPage ?? this.perPage,
      page: page ?? this.page,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  static void empty(Map<String, dynamic> json) {
    return;
  }

  static ResponseModel resultsEmpty({dynamic results}) {
    return ResponseModel(
     count: 0,
      page: 0,
      next: '',
      previous: '',
      results: results,
      action: '',
    );
  }
}
