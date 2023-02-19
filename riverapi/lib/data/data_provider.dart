import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapi/models/user_model.dart';
import 'package:riverapi/service/service.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
