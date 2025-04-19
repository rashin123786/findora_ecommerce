part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeStateScreenLoading extends HomeState {}

final class HomeStateScreenError extends HomeState {
  final String errorMessage;
  HomeStateScreenError({required this.errorMessage});
}

final class HomeStateScreenSuccess extends HomeState {
  final List<GetAllProductModel> getAllProductList;
  HomeStateScreenSuccess({required this.getAllProductList});
}
