import 'dart:async';
import 'package:fudge/Services/users_service.dart';
import 'package:fudge/Models/user.dart';

class UserBLoC {
  Stream<List<User>> get usersList async* {
    yield await UserService.getUsers();
  }

  final StreamController<int> _userCounter = StreamController<int>();

  Stream<int> get userCounter => _userCounter.stream;

  UserBLoC() {
    usersList.listen((list) => _userCounter.add(list.length));
  }
}
