import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';

import '../../../data/models/api_response/request.dart';

part 'service_details_state.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  final ServiceRepository serviceRepository;

  ServiceDetailsCubit({required this.serviceRepository}) : super(ServiceDetailsInitial());

  void requestForService({required String serviceId})async{
    emit(ServiceDetailsLoading());
    try {
      dynamic serviceData = await serviceRepository.requestForService(serviceId: serviceId);
      if (serviceData != null) {
        emit(ServiceRequestSuccessful(requestData: serviceData));
      } else {
        emit(const ServiceDetailsError(message: "Something went wrong"));
      }
    } catch (e) {

      print('RequestHistory cubit error:$e');
      emit(ServiceDetailsError(message: e.toString()));
    }

  }
}
