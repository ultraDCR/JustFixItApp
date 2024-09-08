

class Request {
  Request({
      String? userId, 
      String? serviceId, 
      String? status, 
      String? requestDate, 
      String? id, 
      }){
    _userId = userId;
    _serviceId = serviceId;
    _status = status;
    _requestDate = requestDate;
    _id = id;
}

  Request.fromJson(dynamic json) {
    _userId = json['user_id'];
    _serviceId = json['service_id'];
    _status = json['status'];
    _requestDate = json['request_date'];
    _id = json['_id'];
  }
  String? _userId;
  String? _serviceId;
  String? _status;
  String? _requestDate;
  String? _id;
Request copyWith({  String? userId,
  String? serviceId,
  String? status,
  String? requestDate,
  String? id,
}) => Request(  userId: userId ?? _userId,
  serviceId: serviceId ?? _serviceId,
  status: status ?? _status,
  requestDate: requestDate ?? _requestDate,
  id: id ?? _id,
);


  String? get userId => _userId;
  String? get serviceId => _serviceId;
  String? get status => _status;
  String? get requestDate => _requestDate;
  String? get id => _id;

  static List<Request> fromJsonListModel(List json) =>
      json.map((element) => Request.fromJson(element)).toList();


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['service_id'] = _serviceId;
    map['status'] = _status;
    map['request_date'] = _requestDate;
    map['_id'] = _id;
    return map;
  }

}