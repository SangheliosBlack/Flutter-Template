abstract interface class CacheService<T>{
  Future<void> storeData({required String key,required T data,Duration ttl = const Duration(hours: 24)});
  T? getData({required String key});
  Future<void> deleteData({required String key});
}