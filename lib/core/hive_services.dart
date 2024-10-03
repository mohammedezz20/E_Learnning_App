import 'package:hive/hive.dart';

class HiveService{

    static void save<ListType>(key,List<ListType> dataList, String boxName) {
    var box = Hive.box(boxName);
    box.put(key,dataList).then((value){
      print('Hive saved all data');
    });
  }

// static void save<entityType>(String key, value,String boxName) {
//   var box = Hive.box<entityType>(boxName);
//   box.put(key,value);
// }

static void clear(String boxName) {
  var box = Hive.box(boxName);
  box.clear();
}
}