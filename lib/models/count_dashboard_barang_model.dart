class CountDashboardBarangModel {
  int? totalBarang;
  int? totalTersedia;
  int? totalPinjam;
  int? totalRusak;



  CountDashboardBarangModel({
    this.totalBarang,
    this.totalTersedia,
    this.totalPinjam,
    this.totalRusak
  });



  factory CountDashboardBarangModel.fromJson(Map<String,dynamic> json){
    return CountDashboardBarangModel(
      totalBarang: json["TOTAL_BARANG"],
      totalTersedia: json["BARANG_TERSEDIA"],
      totalPinjam: json["BARANG_DIPINJAM"],
      totalRusak: json["BARANG_RUSAK"]
    );
  }





}