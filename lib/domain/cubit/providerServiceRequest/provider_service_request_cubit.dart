import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/models/api_response/request.dart';
import 'package:just_fix_it/data/models/api_response/service_request.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';

part 'provider_service_request_state.dart';

class ProviderServiceRequestCubit extends Cubit<ProviderServiceRequestState> {
  final ServiceRepository serviceRepository;
  ProviderServiceRequestCubit({required this.serviceRepository}) : super(ProviderServiceRequestInitial()){
    _getServiceRequest();
  }

  void _getServiceRequest()async{
    emit(ProviderServiceRequestLoading());
    try {
      List<ServiceRequest> serviceData = await serviceRepository.getProviderServiceRequest();
      if (serviceData.isNotEmpty) {
        emit(ProviderServiceRequestSuccessful(providerServiceRequest: serviceData));
      } else {
        emit(const ProviderServiceRequestError(message: "Something went wrong"));
      }
    } catch (e) {

      print('ProviderServiceRequest cubit error:$e');
      emit(ProviderServiceRequestError(message: e.toString()));
    }

  }

  void approveRequest({required String requestId}) async{
    emit(ProviderServiceRequestLoading());
    try {
      dynamic requestData = await serviceRepository.approveServiceRequest(requestId: requestId);
      if (requestData != null) {
        _getServiceRequest();
      } else {
        emit(const ProviderServiceRequestError(message: "Something went wrong"));
      }
    } catch (e) {

      print('ProviderServiceRequest cubit error:$e');
      emit(ProviderServiceRequestError(message: e.toString()));
    }


  }

  void cancelRequest({required String requestId}) async{
    emit(ProviderServiceRequestLoading());
    try {
      dynamic requestData = await serviceRepository.cancelServiceRequest(requestId: requestId);
      if (requestData != null) {
        _getServiceRequest();
      } else {
        emit(const ProviderServiceRequestError(message: "Something went wrong"));
      }
    } catch (e) {

      print('ProviderServiceRequest cubit error:$e');
      emit(ProviderServiceRequestError(message: e.toString()));
    }


  }
}
