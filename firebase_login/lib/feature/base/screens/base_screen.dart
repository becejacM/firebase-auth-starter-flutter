import 'package:firebase_login/feature/base/base_listener.dart';
import 'package:firebase_login/feature/base/bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScreen<B extends BlocBase<S>, S> extends StatelessWidget {
  final Widget child;
  final BlocStateListener<S>? listener;

  const BaseScreen({required this.child, this.listener, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BaseListener<B, S>(
                    child: child,
                    listener: listener,
                  ),
                ),
              ),
              if (state is BaseLoading)
                Center(child: CircularProgressIndicator()),
              Positioned(
                bottom: 10,
                right: 10,
                child: Text('Powered by Milana 2024'),
              ),
            ],
          ),
        );
      },
    );
  }
}
