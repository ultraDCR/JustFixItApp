import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/models/api_response/request.dart';
import 'package:just_fix_it/data/models/api_response/request_history.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';
import 'package:meta/meta.dart';

part 'request_history_state.dart';

class RequestHistoryCubit extends Cubit<RequestHistoryState> {
  final ServiceRepository serviceRepository;
  RequestHistoryCubit({required this.serviceRepository}) : super(RequestHistoryInitial()){
    _getServiceRequest();
  }
  
  void _getServiceRequest()async{
    emit(RequestHistoryLoading());
    try {
      dynamic serviceData = await serviceRepository.getServiceRequestHistory();
      if (serviceData != null) {
        emit(RequestHistorySuccessful(requestHistory: serviceData));
      } else {
        emit(const RequestHistoryError(message: "Something went wrong"));
      }
    } catch (e) {

      print('RequestHistory cubit error:$e');
      emit(RequestHistoryError(message: e.toString()));
    }
  
  }
}
