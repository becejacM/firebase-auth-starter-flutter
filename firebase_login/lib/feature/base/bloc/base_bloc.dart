import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'base_event.dart';
part 'base_state.dart';

@injectable
class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseInitial()) {
    on<BaseLoadingEvent>((event, emit) => emit(BaseLoading()));
    on<BaseLoadedEvent>((event, emit) => emit(BaseLoaded()));
  }
}
