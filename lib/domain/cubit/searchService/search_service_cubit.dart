import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/models/api_response/service.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';

part 'search_service_state.dart';

class SearchServiceCubit extends Cubit<SearchServiceState> {
  final ServiceRepository serviceRepository;
  SearchServiceCubit({required this.serviceRepository}) : super(SearchServiceInitial());

  void onSearch({required String keyword})async{
    emit(SearchServiceLoading());
    try {
      dynamic serviceData = await serviceRepository.searchServices(
        serviceName: keyword,
      );
      if (serviceData != null) {


        emit(SearchServiceSuccessful(searchService: serviceData));
      } else {
        emit(const SearchServiceError(message: "Something went wrong"));
      }
    } catch (e) {

      print('SearchService cubit error:$e');
      emit(SearchServiceError(message: e.toString()));
    }
  }

  void onSearchByCategory({required String serviceType})async{
    emit(SearchServiceLoading());
    try {
      dynamic serviceData = await serviceRepository.searchServicesByType(
          serviceType: serviceType
      );
      if (serviceData != null) {


        emit(SearchServiceSuccessful(searchService: serviceData));
      } else {
        emit(const SearchServiceError(message: "Something went wrong"));
      }
    } catch (e) {

      print('SearchService cubit error:$e');
      emit(SearchServiceError(message: e.toString()));
    }
  }
}
