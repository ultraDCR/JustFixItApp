import 'package:just_fix_it/data/models/api_response/request.dart';
import 'package:just_fix_it/data/models/api_response/request_history.dart';
import 'package:just_fix_it/data/models/api_response/service_request.dart';
import 'package:just_fix_it/shared/constants/enums.dart';

import '../models/api_response/service.dart';
import '../network_service.dart';

class ServiceRepository {
  final NetworkService networkService;

  ServiceRepository({required this.networkService});

  Future<dynamic> getServices() async {
    var serviceResponse = await networkService.getServices();
    var serviceList = Service.fromJsonListModel(serviceResponse);
    return serviceList;
  }
  Future<dynamic> getServicesWithId({required String serviceId}) async {
    var serviceResponse = await networkService.getServicesById(serviceId: serviceId);
    return serviceResponse;
  }

  Future<dynamic> addService({required String name, required String description, required String price, required String image, required ServiceCategory category}) async {
    var serviceResponse = await networkService.addService(name: name, description: description, price: price, image: image, category: category);
    return serviceResponse;
  }

  Future<dynamic> searchServices({String? serviceName}) async {
    var serviceResponse = await networkService.searchServices(serviceName: serviceName);
    var serviceList = Service.fromJsonListModel(serviceResponse);
    return serviceList;
  }
  Future<dynamic> searchServicesByType({required String serviceType}) async {
    var serviceResponse = await networkService.searchServicesByCategory(serviceType: serviceType);
    var serviceList = Service.fromJsonListModel(serviceResponse);
    return serviceList;
  }

   Future<dynamic> getServiceRequestHistory() async {
    var serviceResponse = await networkService.getServiceRequestHistory();
    var serviceList = RequestHistory.fromJsonListModel(serviceResponse["requestHistory"]);
    return serviceList;
  }

   Future<dynamic> getProviderServiceRequest() async {
    var serviceResponse = await networkService.getProviderServiceRequest();
    var requestList = ServiceRequest.fromJsonListModel(serviceResponse["requests"]);
    return requestList;
  }

  Future<dynamic> requestForService({required String serviceId}) async{
    var requestResponse = await networkService.createRequest(serviceId: serviceId, status: "Pending");
    var requestData = Request.fromJson(requestResponse);
    return requestData;
  }

Future<dynamic> approveServiceRequest({required String requestId}) async{
    var requestResponse = await networkService.approveServiceRequest(requestId: requestId);
    return requestResponse;
  }


Future<dynamic> cancelServiceRequest({required String requestId}) async{
    var requestResponse = await networkService.cancelServiceRequest(requestId: requestId);
    return requestResponse;
  }




}

