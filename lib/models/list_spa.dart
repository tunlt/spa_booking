// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:spa_booking/models/service.dart';
// import 'package:spa_booking/models/spa.dart';
// class ListSpa{
//   List<Spa> _list=[];
//   List<Service> _allService=[];
//   ListSpa(){
//     Spa spa1 =Spa("Vân Anh Spa", 4.5, "50 Hậu giang, Q6",0.4,97,"0777997001");
//     //Massage
//     spa1.services.add(Service("30' Aromatic", 4, 150,"Massage",20,spa1));
//     spa1.services.add(Service("60' Aromatic", 4, 225,"Massage",25,spa1));
//     spa1.services.add(Service("30' Swedish", 5, 100,"Massage",20,spa1));
//     spa1.services.add(Service("60' Swedish", 4.5, 150,"Massage",20,spa1));
//     spa1.services.add(Service("30' Shoulder", 3, 70,"Massage",15,spa1));
//     spa1.services.add(Service("60' Shoulder", 4, 90,"Massage",0,spa1));
//     spa1.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa1));
//     //Facial
//     spa1.services.add(Service("Original", 4.2, 89,"Facial",0,spa1));
//     spa1.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa1));
//     spa1.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa1));
//     spa1.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",35,spa1));
//     spa1.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa1));
//     spa1.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa1));
//     //Sauna
//     spa1.services.add(Service("Original", 4.2, 89,"Sauna",0,spa1));
//     spa1.services.add(Service("Special", 4.3, 100,"Sauna",0,spa1));
//     spa1.services.add(Service("Private (max 6 people)", 5, 200,"Sauna",0,spa1));
//     //Hot stone therapy
//     spa1.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa1));
//     spa1.services.add(Service("Special", 4.7, 280,"Hot stone therapy",40,spa1));


//     Spa spa2 =Spa("Ý Nhi Spa", 4.5, "50 Hậu giang, Q6",5.6,89,"0946788818");
//     //Massage
//     spa2.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa2));
//     spa2.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa2));
//     spa2.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa2));
//     spa2.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa2));
//     spa2.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa2));
//     spa2.services.add(Service("60' Shoulder", 4, 90,"Massage",15,spa2));
//     spa2.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa2));
//     //Facial
//     spa2.services.add(Service("Original", 4.2, 89,"Facial",0,spa2));
//     spa2.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa2));
//     spa2.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa2));
//     spa2.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa2));
//     spa2.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa2));
//     spa2.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa2));
//     //Sauna
//     spa2.services.add(Service("Original", 4.2, 89,"Sauna",0,spa2));
//     spa2.services.add(Service("Special", 4.3, 100,"Sauna",0,spa2));
//     spa2.services.add(Service("Private (max 6 people)", 5, 200,"Sauna",0,spa2));
//     //Hot stone therapy
//     spa2.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa2));
//     spa2.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa2));



//     Spa spa3 =Spa("Khuynh Thành Spa", 4.5, "50 Hậu giang, Q6",4.3,73,"0987654321");
//     //Massage
//     spa3.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa3));
//     spa3.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa3));
//     spa3.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa3));
//     spa3.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa3));
//     spa3.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa3));
//     spa3.services.add(Service("60' Shoulder", 4, 90,"Massage",0,spa3));
//     spa3.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa3));
//     //Facial
//     spa3.services.add(Service("Original", 4.2, 89,"Facial",0,spa3));
//     spa3.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa3));
//     spa3.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa3));
//     spa3.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa3));
//     spa3.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa3));
//     spa3.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa3));
//     //Sauna
//     spa3.services.add(Service("Original", 4.2, 89,"Sauna",0,spa3));
//     spa3.services.add(Service("Special", 4.3, 100,"Sauna",0,spa3));
//     spa3.services.add(Service("King", 5, 200,"Sauna",0,spa3));
//     //Hot stone therapy
//     spa3.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa3));
//     spa3.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa3));


//     Spa spa4 =Spa("Anh Đào Spa", 4.5, "50 Hậu giang, Q6",3.5,62,"0912479586");
//     //Massage
//     spa4.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa4));
//     spa4.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa4));
//     spa4.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa4));
//     spa4.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa4));
//     spa4.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa4));
//     spa4.services.add(Service("60' Shoulder", 4, 90,"Massage",0,spa4));
//     spa4.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa4));
//     //Facial
//     spa4.services.add(Service("Original", 4.2, 89,"Facial",0,spa4));
//     spa4.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa4));
//     spa4.services.add(Service("Gasde technology", 3, 115,"Facial",0,spa4));
//     spa4.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa4));
//     spa4.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa4));
//     spa4.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa4));
//     //Sauna
//     spa4.services.add(Service("Original", 4.2, 89,"Sauna",0,spa4));
//     spa4.services.add(Service("Special", 4.3, 100,"Sauna",50,spa4));
//     spa4.services.add(Service("Private (max 6 people)", 3.9, 200,"Sauna",0,spa4));
//     //Hot stone therapy
//     spa4.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa4));
//     spa4.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa4));



//     Spa spa5 =Spa("Lâm Khang Spa", 4.5, "50 Hậu giang, Q6",0.3,54,"0913589885");
//     //Massage
//     spa5.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa5));
//     spa5.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa5));
//     spa5.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa5));
//     spa5.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa5));
//     spa5.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa5));
//     spa5.services.add(Service("60' Shoulder", 4, 90,"Massage",30,spa5));
//     spa5.services.add(Service("Thai Massage", 3.5, 220,"Massage",10,spa5));
//     //Facial
//     spa5.services.add(Service("Original", 4.2, 89,"Facial",0,spa5));
//     spa5.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa5));
//     spa5.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa5));
//     spa5.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa5));
//     spa5.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa5));
//     spa5.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa5));
//     //Sauna
//     spa5.services.add(Service("Original", 4.2, 89,"Sauna",0,spa5));
//     spa5.services.add(Service("Special", 4.3, 100,"Sauna",0,spa5));
//     spa5.services.add(Service("Private (max 6 people)", 3, 200,"Sauna",0,spa5));
//     //Hot stone therapy
//     spa5.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa5));
//     spa5.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa5));


//     Spa spa6 =Spa("Thủy Trúc Spa", 4.5, "50 Hậu giang, Q6",0.6,19,"0933539713");
//     //Massage
//     spa6.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa6));
//     spa6.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa6));
//     spa6.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa6));
//     spa6.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa6));
//     spa6.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa6));
//     spa6.services.add(Service("60' Shoulder", 4, 90,"Massage",0,spa6));
//     spa6.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa6));
//     //Facial
//     spa6.services.add(Service("Original", 4.2, 89,"Facial",0,spa6));
//     spa6.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa6));
//     spa6.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa6));
//     spa6.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa6));
//     spa6.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa6));
//     spa6.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa6));
//     //Sauna
//     spa6.services.add(Service("Original", 4.2, 89,"Sauna",0,spa6));
//     spa6.services.add(Service("Special", 4.3, 100,"Sauna",0,spa6));
//     spa6.services.add(Service("Primal", 3.5, 200,"Sauna",0,spa6));
//     //Hot stone therapy
//     spa6.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa6));
//     spa6.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa6));


//     Spa spa7 =Spa("Thùy Trang Spa", 4.5, "50 Hậu giang, Q6",1.0,17,"0977778477");
//     //Massage
//     spa7.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa7));
//     spa7.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa7));
//     spa7.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa7));
//     spa7.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa7));
//     spa7.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa7));
//     spa7.services.add(Service("60' Shoulder", 4, 90,"Massage",0,spa7));
//     spa7.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa7));
//     //Facial
//     spa7.services.add(Service("Original", 4.2, 89,"Facial",0,spa7));
//     spa7.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa7));
//     spa7.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa7));
//     spa7.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa7));
//     spa7.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa7));
//     spa7.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa7));
//     //Sauna
//     spa7.services.add(Service("Original", 4.2, 89,"Sauna",0,spa7));
//     spa7.services.add(Service("Special", 4.3, 100,"Sauna",0,spa7));
//     spa7.services.add(Service("Private (max 6 people)", 3.6, 200,"Sauna",0,spa7));
//     //Hot stone therapy
//     spa7.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa7));
//     spa7.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa7));

//     Spa spa8 =Spa("Diễm Phúc Spa", 4.5, "50 Hậu giang, Q6",2.4,47,"0912545211");
//     //Massage
//     spa8.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa8));
//     spa8.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa8));
//     spa8.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa8));
//     spa8.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa8));
//     spa8.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa8));
//     spa8.services.add(Service("60' Shoulder", 4, 90,"Massage",0,spa8));
//     spa8.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa8));
//     //Facial
//     spa8.services.add(Service("Original", 4.2, 89,"Facial",0,spa8));
//     spa8.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa8));
//     spa8.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa8));
//     spa8.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa8));
//     spa8.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa8));
//     spa8.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa8));
//     //Sauna
//     spa8.services.add(Service("Original", 4.2, 89,"Sauna",0,spa8));
//     spa8.services.add(Service("Special", 4.3, 100,"Sauna",0,spa8));
//     spa8.services.add(Service("Private (max 6 people)", 5, 200,"Sauna",0,spa8));
//     //Hot stone therapy
//     spa8.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa8));
//     spa8.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa8));



//     Spa spa9 =Spa("Thúy Nga Spa", 4.5, "50 Hậu giang, Q6",0.8,23,"0913633474");
//     //Massage
//     spa9.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa9));
//     spa9.services.add(Service("60' Aromatic", 4, 225,"Massage",0,spa9));
//     spa9.services.add(Service("30' Swedish", 5, 100,"Massage",0,spa9));
//     spa9.services.add(Service("60' Swedish", 4.5, 150,"Massage",0,spa9));
//     spa9.services.add(Service("30' Shoulder", 3, 70,"Massage",0,spa9));
//     spa9.services.add(Service("60' Shoulder", 4, 90,"Massage",0,spa9));
//     spa9.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa9));
//     //Facial
//     spa9.services.add(Service("Original", 4.2, 89,"Facial",0,spa9));
//     spa9.services.add(Service("Eliminate toxins", 4.3, 100,"Facial",0,spa9));
//     spa9.services.add(Service("Gasde technology", 5, 115,"Facial",0,spa9));
//     spa9.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa9));
//     spa9.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa9));
//     spa9.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa9));
//     //Sauna
//     spa9.services.add(Service("Original", 4.2, 89,"Sauna",0,spa9));
//     spa9.services.add(Service("Special", 4.3, 100,"Sauna",0,spa9));
//     spa9.services.add(Service("Big Room", 4, 200,"Sauna",0,spa9));
//     //Hot stone therapy
//     spa9.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa9));
//     spa9.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa9));


//     Spa spa20 =Spa("Hoàng Tú Spa", 4.5, "50 Hậu giang, Q6",0.2,45,"0912522298");
//     //Massage
//     spa20.services.add(Service("30' Aromatic", 4, 150,"Massage",0,spa20));
//     spa20.services.add(Service("Thai Massage", 3.5, 220,"Massage",0,spa20));
//     //Facial
//     spa20.services.add(Service("Original", 4.2, 89,"Facial",0,spa20));
//     spa20.services.add(Service("Eliminate toxins", 4.8, 100,"Facial",0,spa20));
//     spa20.services.add(Service("Gasdej technology", 5, 115,"Facial",0,spa20));
//     spa20.services.add(Service("Detox Co2 DJ Carbon", 4.5, 128,"Facial",0,spa20));
//     spa20.services.add(Service("Nano implant", 3.7, 135,"Facial",0,spa20));
//     spa20.services.add(Service("Special heirloom", 4, 210,"Facial",0,spa20));
//     //Sauna
//     spa20.services.add(Service("Original", 4.2, 89,"Sauna",0,spa20));
//     spa20.services.add(Service("Special", 5, 100,"Sauna",0,spa20));
//     spa20.services.add(Service("Best Service ", 4.5, 200,"Sauna",0,spa20));
//     //Hot stone therapy
//     spa20.services.add(Service("Original", 4.6, 248,"Hot stone therapy",0,spa20));
//     spa20.services.add(Service("Special", 4.7, 280,"Hot stone therapy",0,spa20));

//     list.add(spa1);
//     list.add(spa2);
//     list.add(spa3);
//     list.add(spa4);
//     list.add(spa5);
//     list.add(spa6);
//     list.add(spa7);
//     list.add(spa8);
//     list.add(spa9);
//     list.add(spa20);

//     //set all Service
//     list.forEach((Spa spa) {
//       spa.services.forEach((Service service) {
//         service.distance=spa.distance;
//         allService.add(service);
//       });
//     });
    
//   }
//   List<Spa> get list => _list;
//   List<Service> get allService => _allService;
//   List<Service> getByDistance(){
//     List<Spa> spa=[];
//     List<Service> result=[];
//     spa.addAll(list);
//     spa.sort((Spa s1, Spa s2){
//       return s1.distance.compareTo(s2.distance);
//     });
//     spa.forEach((Spa x) {
//       x.services.forEach((Service service) {
//         result.add(service);
//       });
//     });
//     return result;
//   }
//   List<Service> getByRate() {
//     List<Service> result= [];
//     result.addAll(allService);
//     result.sort((Service s1, Service s2) {
//       return s2.rate.compareTo(s1.rate);
//     });
//     return result;
//   }
//   List<Service> getBySale() {
//     List<Service> result=[];
//     result.addAll(allService);
//     result.removeWhere((element) => element.sale == 0);
//     result.sort(( s1,  s2) {
//       return s2.sale.compareTo(s1.sale);
//     });
//     return result;
//   }


// }