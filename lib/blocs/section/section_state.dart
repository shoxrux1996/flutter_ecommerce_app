part of 'section_bloc.dart';

abstract class SectionState extends Equatable {
  const SectionState();

  @override
  List<Object> get props => [];
}

class SectionLoadingState extends SectionState {}

class SectionLoadedState extends SectionState {
  final List<Section> sections;

  const SectionLoadedState({required this.sections});

  @override
  List<Object> get props => [sections];
}

class SectionErrorState extends SectionState {}
