part of 'base_bloc.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object> get props => [];
}

class BaseLoadingEvent extends BaseEvent {}

class BaseLoadedEvent extends BaseEvent {}
