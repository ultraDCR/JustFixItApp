/// _id : "66dc2e5370a2c6d38d3ec6ab"
/// status : "approved"
/// request_date : "2024-09-07T10:43:31.714Z"
/// customerDetails : {"fullname":"Sany","email":"r@gmail.com"}
/// serviceDetails : {"name":"Clean Vibes test"}

class ServiceRequest {
  ServiceRequest({
      String? id, 
      String? status, 
      String? requestDate, 
      CustomerDetails? customerDetails, 
      ServiceDetails? serviceDetails,}){
    _id = id;
    _status = status;
    _requestDate = requestDate;
    _customerDetails = customerDetails;
    _serviceDetails = serviceDetails;
}

  static List<ServiceRequest> fromJsonListModel(List json) =>
      json.map((element) => ServiceRequest.fromJson(element)).toList();


  ServiceRequest.fromJson(dynamic json) {
    _id = json['_id'];
    _status = json['status'];
    _requestDate = json['request_date'];
    _customerDetails = json['customerDetails'] != null ? CustomerDetails.fromJson(json['customerDetails']) : null;
    _serviceDetails = json['serviceDetails'] != null ? ServiceDetails.fromJson(json['serviceDetails']) : null;
  }
  String? _id;
  String? _status;
  String? _requestDate;
  CustomerDetails? _customerDetails;
  ServiceDetails? _serviceDetails;
ServiceRequest copyWith({  String? id,
  String? status,
  String? requestDate,
  CustomerDetails? customerDetails,
  ServiceDetails? serviceDetails,
}) => ServiceRequest(  id: id ?? _id,
  status: status ?? _status,
  requestDate: requestDate ?? _requestDate,
  customerDetails: customerDetails ?? _customerDetails,
  serviceDetails: serviceDetails ?? _serviceDetails,
);
  String? get id => _id;
  String? get status => _status;
  String? get requestDate => _requestDate;
  CustomerDetails? get customerDetails => _customerDetails;
  ServiceDetails? get serviceDetails => _serviceDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['status'] = _status;
    map['request_date'] = _requestDate;
    if (_customerDetails != null) {
      map['customerDetails'] = _customerDetails?.toJson();
    }
    if (_serviceDetails != null) {
      map['serviceDetails'] = _serviceDetails?.toJson();
    }
    return map;
  }

}

/// name : "Clean Vibes test"

class ServiceDetails {
  ServiceDetails({
      String? name,}){
    _name = name;
}

  ServiceDetails.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
ServiceDetails copyWith({  String? name,
}) => ServiceDetails(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}

/// fullname : "Sany"
/// email : "r@gmail.com"

class CustomerDetails {
  CustomerDetails({
      String? fullname, 
      String? email,}){
    _fullname = fullname;
    _email = email;
}

  CustomerDetails.fromJson(dynamic json) {
    _fullname = json['fullname'];
    _email = json['email'];
  }
  String? _fullname;
  String? _email;
CustomerDetails copyWith({  String? fullname,
  String? email,
}) => CustomerDetails(  fullname: fullname ?? _fullname,
  email: email ?? _email,
);
  String? get fullname => _fullname;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = _fullname;
    map['email'] = _email;
    return map;
  }

}