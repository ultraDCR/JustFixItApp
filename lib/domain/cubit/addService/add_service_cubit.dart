import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';
import 'package:meta/meta.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  final  ServiceRepository serviceRepository;
  AddServiceCubit({required this.serviceRepository}) : super(AddServiceInitial());
  
  
  void onServiceAdded({required String serviceName, required String description, required String price, required imagePath,required category}) async{

    emit(AddServiceLoading());
    try {
      dynamic serviceData = await serviceRepository.addService(
        name: serviceName,
        description: description,
        price: price,
        category: category,
        image: imagePath
      );
      if (serviceData != null) {
        emit(AddServiceSuccessful(serviceData: serviceData));
      } else {
        emit(const AddServiceError(message: "Something went wrong"));
      }
    } catch (e) {

      print('AddService cubit error:$e');
      emit(AddServiceError(message: e.toString()));
    }
    
    
  }


}
