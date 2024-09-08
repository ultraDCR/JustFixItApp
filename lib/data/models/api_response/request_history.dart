/// _id : "66dd7c9441155f45118727cd"
/// status : "pending"
/// request_date : "2024-09-08T10:29:40.837Z"
/// servicename : "ranjan"
/// category : "Plumbing"
/// serviceprovidername : "RanjanParajuli"

class RequestHistory {
  RequestHistory({
      String? id, 
      String? status, 
      String? requestDate, 
      String? servicename, 
      String? category, 
      String? serviceprovidername,}){
    _id = id;
    _status = status;
    _requestDate = requestDate;
    _servicename = servicename;
    _category = category;
    _serviceprovidername = serviceprovidername;
}

  static List<RequestHistory> fromJsonListModel(List json) =>
      json.map((element) => RequestHistory.fromJson(element)).toList();



  RequestHistory.fromJson(dynamic json) {
    _id = json['_id'];
    _status = json['status'];
    _requestDate = json['request_date'];
    _servicename = json['servicename'];
    _category = json['category'];
    _serviceprovidername = json['serviceprovidername'];
  }
  String? _id;
  String? _status;
  String? _requestDate;
  String? _servicename;
  String? _category;
  String? _serviceprovidername;
RequestHistory copyWith({  String? id,
  String? status,
  String? requestDate,
  String? servicename,
  String? category,
  String? serviceprovidername,
}) => RequestHistory(  id: id ?? _id,
  status: status ?? _status,
  requestDate: requestDate ?? _requestDate,
  servicename: servicename ?? _servicename,
  category: category ?? _category,
  serviceprovidername: serviceprovidername ?? _serviceprovidername,
);
  String? get id => _id;
  String? get status => _status;
  String? get requestDate => _requestDate;
  String? get servicename => _servicename;
  String? get category => _category;
  String? get serviceprovidername => _serviceprovidername;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['status'] = _status;
    map['request_date'] = _requestDate;
    map['servicename'] = _servicename;
    map['category'] = _category;
    map['serviceprovidername'] = _serviceprovidername;
    return map;
  }

}