import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/core/utils/responsive.dart';
import 'package:ecommerce_app/features/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/features/home/models/get_all_product_model.dart';
import 'package:ecommerce_app/shared/screens/api_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/each_product_card_widget.dart';
import '../widget/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.albescentWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'Where Fashion Meets\nFunction',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.lemonGrassColor,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            HomeScreeSearchWidget(),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    context.read<HomeBloc>().add(HomeEventGetAllProducts());
                  }
                  if (state is HomeStateScreenLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeStateScreenSuccess) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7, crossAxisCount: 2),
                        itemCount: state.getAllProductList.length,
                        itemBuilder: (context, index) {
                          final data = state.getAllProductList[index];
                          return EachProductCard(data: data);
                        },
                      ),
                    );
                  } else if (state is HomeStateScreenError) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return ApiErrorScreen();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
