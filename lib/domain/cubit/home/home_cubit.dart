import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';

import '../../../data/models/api_response/service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ServiceRepository serviceRepository;

  HomeCubit({required this.serviceRepository}) : super(HomeInitial()){fetchServices();}

  Future<void> fetchServices() async {
    emit(ServiceListLoading());
    try {
      List<Service> serviceDto = await serviceRepository.getServices(
      );
      if (serviceDto.isNotEmpty) {
        print(serviceDto);

        emit(ServiceListSuccessful(serviceList: serviceDto));
      } else {
        emit(const ServiceError(message: "Something went wrong"));
      }
    } catch (e) {

      print('Login cubit error:$e');
      emit(ServiceError(message: e.toString()));
    }
  }
}
