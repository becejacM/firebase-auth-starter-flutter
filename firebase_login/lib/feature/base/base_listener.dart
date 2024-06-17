import 'package:firebase_login/feature/base/bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocStateListener<S> = void Function(BuildContext context, S state);

class BaseListener<B extends BlocBase<S>, S> extends StatelessWidget {
  final Widget child;
  final BlocStateListener<S>? listener;

  const BaseListener({required this.child, this.listener, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: (context, state) {
        if (state is BaseLoading) {
          context.read<BaseBloc>().add(BaseLoadingEvent());
        } else {
          context.read<BaseBloc>().add(BaseLoadedEvent());
        }

        if (listener != null) {
          listener!(context, state);
        }
      },
      child: child,
    );
  }
}
