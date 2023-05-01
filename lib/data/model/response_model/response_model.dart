
class ResponseModel<T> {
  int? count;
  int? id;
  String? next;
  String? previous;
  String? statusMessage;
  int? statusCode;
  dynamic results;
  String? action;
  int? totalPage;
  int? perPage;
  int? page;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;

  ResponseModel({
    this.count,
    this.id,
    this.next,
    this.previous,
    this.statusMessage,
    this.statusCode,
    this.results,
    this.action,
    this.totalPage,
    this.perPage,
    this.page,
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
  });

  ResponseModel.fromJson(Map<String, dynamic> json, T fromJson(Map<String, dynamic> json)) {
    count = json['count'];
    id = json['id'];
    next = json['next'];
    previous = json['previous'];
    statusMessage = json['status_message'];
    statusCode = json['status_code'];
    action = json['action'];

    if (json["results"] != null && fromJson != null) {
      if (json['results'].toString()[0] == "[") {
        results = List<T>.from(json['results'].map((x) => fromJson(x)));
      } else {
        results = fromJson(json['results']);
      }
    }

    totalPage = json['total_pages'];
    perPage = json['per_page'];
    page = json['page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    from = json['from'];
    to = json['to'];

  }

  ResponseModel<T> copyWith({
    int? nextcount,
    int? id,
    String? nextprevious,
    String? errorprevious,
    String? statusMessage,
    int? statusCode,
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
      id: id ?? this.id,
      next: nextprevious ?? this.next,
      previous: errorprevious ?? this.previous,
      statusMessage: statusMessage ?? this.statusMessage,
      statusCode: statusCode ?? this.statusCode,
      action: action ?? this.action,
      results: results ?? this.results,
      totalPage: total ?? this.totalPage,
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
     id: 0,
      page: 0,
      next: '',
      previous: '',
      results: results,
      action: '',
    );
  }
}
