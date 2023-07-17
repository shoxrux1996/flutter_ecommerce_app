part of 'section_bloc.dart';

abstract class SectionEvent extends Equatable {
  const SectionEvent();

  @override
  List<Object> get props => [];
}

class LoadSectionEvent extends SectionEvent {}
