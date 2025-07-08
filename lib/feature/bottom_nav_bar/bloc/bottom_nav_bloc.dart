import 'package:AIChatBot/feature/bottom_nav_bar/bloc/bottom_nav_event.dart';
import 'package:AIChatBot/feature/bottom_nav_bar/bloc/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState(0)) {
    on<BottomNavItemSelected>((event, emit) {
      emit(BottomNavState(event.index));
    });
  }
}
