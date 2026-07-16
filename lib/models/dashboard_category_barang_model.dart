class DashboardCategoryBarangModel {
  String? idCategory;
  String? nameCategory;
  int? totalBarang;



  DashboardCategoryBarangModel({
    this.idCategory,
    this.nameCategory,
    this.totalBarang
  });


  factory DashboardCategoryBarangModel.fromJson(Map<String,dynamic> json){
    return DashboardCategoryBarangModel(
      idCategory: json["ID_CATEGORY"],
      nameCategory: json["NAME_CATEGORY"],
      totalBarang: json["TOTAL_BARANG"]
    );
  }


  Map toJson(){
    return {
      "ID_CATEGORY" : idCategory ?? "",
      "NAME_CATEGORY" : nameCategory ?? "",
      "TOTAL_BARANG" : totalBarang ?? "",
    };
  }


}