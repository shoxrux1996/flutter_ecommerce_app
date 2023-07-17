import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/section_model.dart';

part 'section_event.dart';
part 'section_state.dart';

class SectionBloc extends Bloc<SectionEvent, SectionState> {
  SectionBloc() : super(SectionLoadingState()) {
    on<LoadSectionEvent>((event, emit) async {
      try {
        emit(SectionLoadingState());

        await Future.delayed(
          const Duration(seconds: 3),
        );

        emit(
          SectionLoadedState(sections: Section.sections),
        );
      } catch (e) {
        emit(SectionErrorState());
      }
    });
  }
}
