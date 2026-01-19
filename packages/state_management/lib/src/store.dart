import 'package:flutter/foundation.dart';

/// A simple store for managing application state
class Store<T> extends ChangeNotifier {
  T _state;

  Store(this._state);

  T get state => _state;

  void update(T newState) {
    _state = newState;
    notifyListeners();
  }

  void setState(T Function(T current) updater) {
    _state = updater(_state);
    notifyListeners();
  }
}
