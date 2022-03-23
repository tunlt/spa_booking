// import 'dart:io';
//
// import 'package:flutter/services.dart';
// import 'package:spa_booking/models/service.dart';
// import 'package:spa_booking/models/spa.dart';
// import 'package:spa_booking/models/spatest.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'dart:io';
//
// class DBHelper {
//   DBHelper();
//
//   Database? _db;
//
//   Future<Database?> get db async {
//     if (_db != null) return _db;
//     _db = await initDb();
//     return _db;
//   }
//
//   Future<Database> initDb() async {
//     //String dbPath = await getDatabasesPath();
//     String path = "/data/data/com.hci.spabooking.spa_booking/databases/spa.db";
//     //var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
//      var theDb = await  openDatabase(path,version: 1);
//     return theDb;
//   }
//
//   void _onCreate(Database db, int version) async {
//     //String dbPath = await getDatabasesPath();
//     String path = "/data/data/com.hci.spabooking.spa_booking/databases/spa.db";
//     // Load database from asset and copy
//     ByteData data = await rootBundle.load(join('assets', 'spa.db'));
//     List<int> bytes =
//         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//
//     // Save copied asset to documents
//     await new File(path).writeAsBytes(bytes);
//
//     db = await openDatabase(path, readOnly: true);
//   }
//
//   Future<List<SpaTest>> getAllSpa() async{
//     List<SpaTest> list=[];
//     var data=await db;
//     List<Map<String,dynamic>> map=await data!.query("Spa");
//     for(int i=0;i<map.length;i++){
//       list.add(
//         SpaTest(
//             name: map[i]['name'],
//             address: map[i]['address'])
//       );
//     }
//     return list;
//   }
//   Future<Spa> getSpaById(int spaId) async {
//     var data = await db;
//     List<Map<String, dynamic>> map =
//         await data!.query("Spa", where: "id = ?", whereArgs: [spaId]);
//
//     return Spa(
//         name: map[0]['name'],
//         address: map[0]['address'],
//         distance: map[0]['distance'],
//         image: map[0]['image'],
//         phone: map[0]['phone'],
//         rate: map[0]['rate'],
//         totalRate: map[0]['totalRate']);
//   }
//   Future<Service> getServiceById(int id) async {
//     var data = await db;
//     String sql =
//         "select s.name, s.rate, s.price,s.cateType,s.sale,s.spaId,p.distance "
//         "from Service s, Spa p "
//         "where s.spaId=p.spaId and s.id = ?";
//     List<Map<String, dynamic>> map = await data!.rawQuery(sql,[id]);
//       return Service(
//           name: map[0]['name'],
//           rate: map[0]['rate'],
//           price: map[0]['price'],
//           cateType: map[0]['cateType'],
//           sale: map[0]['sale'],
//           spaId: map[0]['spaId'],
//           distance: map[0]['distance']
//       );
//
//   }
//   Future<List<Service>> getServicesByCate(String cateType) async {
//     List<Service> list = [];
//     var data = await db;
//     String sql =
//         "select s.name, s.rate, s.price,s.cateType,s.sale,s.spaId,p.distance "
//         "from Service s, Spa p "
//         "where s.spaId=p.spaId and s.cateType = ?";
//     List<Map<String, dynamic>> map = await data!.rawQuery(sql,[cateType]);
//     for (int i = 0; i < map.length; i++) {
//       list.add(Service(
//           name: map[i]['name'],
//           rate: map[i]['rate'],
//           price: map[i]['price'],
//           cateType: map[i]['cateType'],
//           sale: map[i]['sale'],
//           spaId: map[i]['spaId'],
//           distance: map[i]['distance']));
//     }
//     return list;
//   }
//   Future<List<Service>> getNearByService() async {
//     List<Service> list = [];
//     var data = await db;
//     String sql =
//         "select s.name, s.rate, s.price,s.cateType,s.sale,s.spaId,p.distance "
//         "from Service s, Spa p "
//         "where s.spaId=p.id "
//         "order by p.distance asc "
//         "limit 5";
//     List<Map<String, dynamic>> map = await data!.rawQuery(sql);
//     for (int i = 0; i < map.length; i++) {
//       list.add(Service(
//           name: map[i]['name'],
//           rate: map[i]['rate'],
//           price: map[i]['price'],
//           cateType: map[i]['cateType'],
//           sale: map[i]['sale'],
//           spaId: map[i]['spaId'],
//           distance: map[i]['distance']));
//     }
//     return list;
//   }
//
//   Future<List<Service>> getPromotionService() async {
//     List<Service> list = [];
//     var data = await db;
//     String sql =
//         "select s.name, s.rate, s.price,s.cateType,s.sale,s.spaId,p.distance "
//         "from Service s, Spa p "
//         "where s.spaId=p.id "
//         "order by s.sale dsc "
//         "limit 5";
//     List<Map<String, dynamic>> map = await data!.rawQuery(sql);
//     for (int i = 0; i < map.length; i++) {
//       list.add(Service(
//           name: map[i]['name'],
//           rate: map[i]['rate'],
//           price: map[i]['price'],
//           cateType: map[i]['cateType'],
//           sale: map[i]['sale'],
//           spaId: map[i]['spaId'],
//           distance: map[i]['distance']));
//     }
//     return list;
//   }
//
//   Future<List<Service>> getHighRatingService() async {
//     List<Service> list = [];
//     var data = await db;
//     String sql =
//         "select s.name, s.rate, s.price,s.cateType,s.sale,s.spaId,p.distance "
//         "from Service s, Spa p "
//         "where s.spaId=p.id "
//         "order by s.sale dsc "
//         "limit 5";
//     List<Map<String, dynamic>> map = await data!.rawQuery(sql);
//     for (int i = 0; i < map.length; i++) {
//       list.add(Service(
//           name: map[i]['name'],
//           rate: map[i]['rate'],
//           price: map[i]['price'],
//           cateType: map[i]['cateType'],
//           sale: map[i]['sale'],
//           spaId: map[i]['spaId'],
//           distance: map[i]['distance']));
//     }
//     return list;
//   }
// }
