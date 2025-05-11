import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/core.dart';

final deviceIdServideDi = Provider<DeviceIdService>((ref) {

  final LocalStorageServiceImpl localStorageService = ref.read(localStorageServiceProvider);

  return DeviceIdServiceImpl(
    localStorageService: localStorageService,
  );

});