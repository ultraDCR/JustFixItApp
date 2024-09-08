import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/domain/cubit/searchService/search_service_cubit.dart';
import 'package:just_fix_it/domain/cubit/searchService/search_service_cubit.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ServiceListPage extends StatefulWidget {
  final String? serviceType;
  const ServiceListPage(this.serviceType, {super.key});

  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage> {

  @override
  void initState() {
    context.read<SearchServiceCubit>().onSearchByCategory(serviceType: widget.serviceType ??"");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('${widget.serviceType} Services', style: context.textTheme.titleMedium,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SearchServiceCubit, SearchServiceState>(
          builder: (context, state) {
            return state is SearchServiceSuccessful ?  Column(
              children: [
                ...state.searchService.map((service)=> ServiceItemView(
                  name: service.name,
              image: service.image, onPress: () {
                  Navigator.pushNamed(
                      context,AppRouter.serviceDetails,arguments: service.toJson());
                },),
            )

              ],
            ) : SizedBox();
          },
        ),
      ),
    );
  }
}
