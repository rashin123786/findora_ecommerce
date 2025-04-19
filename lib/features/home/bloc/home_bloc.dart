import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/models/get_all_product_model.dart';
import 'package:ecommerce_app/features/home/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo = HomeRepo();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeEventGetAllProducts>(_fetchAllProducts);
  }
  Future<void> _fetchAllProducts(
      HomeEventGetAllProducts event, Emitter<HomeState> emit) async {
    emit(HomeStateScreenLoading());
    try {
      final productList = await homeRepo.getAllProduct();
      emit(HomeStateScreenSuccess(getAllProductList: productList));
    } catch (e) {
      emit(HomeStateScreenError(errorMessage: "Something went wrong"));
    }
  }
}
