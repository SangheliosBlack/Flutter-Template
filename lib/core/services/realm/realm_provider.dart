import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/realm/realm_implementation.dart';

final realmServiceProvider = Provider<RealmServiceImplementation>((ref) {

  final realmService = RealmServiceImplementation();
  
  realmService.initService();

  ref.onDispose(() => realmService.close());

  return realmService;
  
});
