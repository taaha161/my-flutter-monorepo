import 'package:flutter/material.dart';
import 'store.dart';

/// A widget that rebuilds when the store changes
class StoreBuilder<T> extends StatelessWidget {
  final Store<T> store;
  final Widget Function(BuildContext context, T state) builder;

  const StoreBuilder({
    super.key,
    required this.store,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) => builder(context, store.state),
    );
  }
}

/// A controller mixin for managing state
mixin Controller<T> {
  late final Store<T> _store;

  Store<T> get store => _store;

  void initStore(T initialState) {
    _store = Store(initialState);
  }

  void dispose() {
    _store.dispose();
  }
}
