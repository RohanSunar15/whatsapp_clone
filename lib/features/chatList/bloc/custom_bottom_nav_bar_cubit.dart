import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_bottom_nav_bar_state.dart';

class CustomBottomNavBarCubit extends Cubit<int> {
  CustomBottomNavBarCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
