import 'package:flutter_template/core/constants/local_storage_keys.dart';
import 'package:flutter_template/core/services/device_id/device_id_service.dart';
import 'package:flutter_template/core/services/local_storage/local_storage_service_impl.dart';
import 'package:uuid/uuid.dart';

class DeviceIdServiceImpl implements DeviceIdService {

  final LocalStorageServiceImpl localStorageService;

  DeviceIdServiceImpl({required this.localStorageService});

  @override
  Future<String> getDeviceId() async {

    String? deviceId = await localStorageService.getValue(key: LocalStorageKeys.DEVICE_ID);

    if (deviceId == null) {

      deviceId = const Uuid().v4(); 

      await localStorageService.setValue(key: LocalStorageKeys.DEVICE_ID, value: deviceId);
    }

    return deviceId;

  }

}
