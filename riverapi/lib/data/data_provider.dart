import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapi/main.dart';
import 'package:riverapi/models/user_model.dart';
import 'package:riverapi/service/service.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async { 
  final query =  ref.watch(queryProvider);
  return ref.watch(userProvider).getUsers(query.q);
});
