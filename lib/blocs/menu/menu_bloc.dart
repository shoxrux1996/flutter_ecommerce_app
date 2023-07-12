import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuLoadingState()) {
    on<LoadMenuEvent>((event, emit) async {
      try {
        emit(MenuLoadingState());

        await Future.delayed(
          const Duration(seconds: 1),
        );

        emit(
          MenuLoadedState(
            menuItem: MenuItem.menu(),
          ),
        );
      } catch (e) {
        emit(MenuErrorState());
      }
    });
  }
}
