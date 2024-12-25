
import 'package:flutter_template/core/services/realm/realm_service.dart';

class RealmServiceImplementation implements RealmService {
  @override
  void close() {
  }

  @override
  void initService() {
  }

  @override
  void write() {
  }

  /*

  late Realm realm;

  @override
  void initService (){

    //var config = Configuration.local([UserEntity.schema]);
    
    //realm = Realm(config);  

    log('Realm database path: ${realm.config.path}');

  }

  @override
  void write({required RealmObject object}){

    realm.write((){

      realm.add(object);

    });

  }

  @override
  void close(){

    realm.close();

  }

  */

}