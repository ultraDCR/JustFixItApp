import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/domain/cubit/searchService/search_service_cubit.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';
import 'package:just_fix_it/shared/components/gap.dart';

class ServiceSearchPage extends StatefulWidget {
  const ServiceSearchPage({super.key});

  @override
  State<ServiceSearchPage> createState() => _ServiceSearchPageState();
}

class _ServiceSearchPageState extends State<ServiceSearchPage> {
  final _controller = TextEditingController();
  Timer? _debounce;

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        context.read<SearchServiceCubit>().onSearch(keyword: query);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Padding(
          padding: const EdgeInsets.only( left: 8.0,right: 8.0,bottom: 10,top: 20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    controller: _controller,
                    onChanged: _onSearchChanged,
                    autofocus: true,
                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon:  Image.asset("assets/images/search.png"),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                  },
                ),
                )

              ],
            ) : SizedBox();
          },
        ),
      ),
    );
  }
}
