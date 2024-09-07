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
}

