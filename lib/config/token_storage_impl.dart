import 'package:fresh_dio/fresh_dio.dart';

import '../model/model.dart';

class TokenStorageImpl implements TokenStorage<LoggedInUserData> {
  @override
  Future<LoggedInUserData?> read() async {
    // TODO: Read from Local Storage
    return null;
  }

  @override
  Future<void> write(LoggedInUserData token) async {
    // TODO: Write to Local Storage.
  }

  @override
  Future<void> delete() async {
    // TODO: Delete from Local Storage.
  }
}
