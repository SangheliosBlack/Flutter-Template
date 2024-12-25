// src/core/services/navigation_service.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/app_router.dart';

final navigationProvider = Provider((ref) {
  final router = ref.read(appRouterProvider);
  return (String path) {
    router.go(path); 
  };
});
