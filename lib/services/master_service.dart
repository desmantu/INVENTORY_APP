import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/count_dashboard_barang_model.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/dashboard_category_barang_model.dart';
import 'package:notes_app/services/main_service.dart';

class MasterService extends MainService{

    Future<Either<String, CountDashboardBarangModel>> getCountDashboardBarang() async {
    print("DESMANTU CEK MASUK SINI 1");
    final uri = "$network/get-dashboard-item";
    try {
    final data = await http.get(Uri.parse(uri));
    print("data ?? ${data.statusCode}" );
    if (data.statusCode == 200) {
      print('AKU DONE MASEE ');
      Map<String, dynamic> res = json.decode(data.body)["data"];
      final hasil = CountDashboardBarangModel.fromJson(res);
      return Right(hasil);
    }else{
      print("AKU GAGAL MASE");
      return Left(data.body);
    }

    } catch (e) {
      print(e.toString());
     return Left("ERORR INTERNET LU"); 
    }

  }


  Future<Either<String, List<DashboardCategoryBarangModel>>> getDashboardCategory() async {
    print("DESMANTU CEK MASUK SINI 1");
    final uri = "$network/get-dashboard-category";
    try {
    final data = await http.get(Uri.parse(uri));
    print("data ?? ${data.statusCode}" );
    if (data.statusCode == 200) {
      print('AKU DONE MASEE ');
      List listdata = json.decode(data.body)["data"];
      final hasil = listdata.map((e) => DashboardCategoryBarangModel.fromJson(e)).toList();
      return Right(hasil);
    }else{
      print("AKU GAGAL MASE");
      return Left(data.body);
    }

    } catch (e) {
      print(e.toString());
     return Left("ERORR INTERNET LU"); 
    }

  }



}



  MasterService masterService = MasterService();