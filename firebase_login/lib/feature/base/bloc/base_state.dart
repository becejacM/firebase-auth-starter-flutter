part of 'base_bloc.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class BaseInitial extends BaseState {}

class BaseLoading extends BaseState {}

class BaseLoaded extends BaseState {}
