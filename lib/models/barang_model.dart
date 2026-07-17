import 'package:notes_app/models/custom_id_name.dart';

class BarangModel {
  String? sysIdTrBarang;
  String? number;
  String? nameTrBarang;
  String? category;
  String? merk;
  String? tipe;
  String? serialNumber;
  DateTime? tanggalPembelian;
  double? harga;
  String? keterangan;
  String? state;
  CustomIdName? idNameCategory;
  CustomIdName? idNameState;

  BarangModel({
    this.sysIdTrBarang,
    this.number,
    this.nameTrBarang,
    this.category,
    this.merk,
    this.tipe,
    this.serialNumber,
    this.tanggalPembelian,
    this.harga,
    this.keterangan,
    this.state,
    this.idNameCategory,
    this.idNameState,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      sysIdTrBarang: json['sysIdTrBarang'],
      number: json['number'],
      nameTrBarang: json['nameTrBarang'],
      category: json['category'],
      merk: json['merk'],
      tipe: json['tipe'],
      serialNumber: json['serialNumber'],
      tanggalPembelian: json['tanggalPembelian'] != null
          ? DateTime.parse(json['tanggalPembelian'])
          : null,
      harga: json['harga'] != null ? (json['harga'] as num).toDouble() : null,
      keterangan: json['keterangan'],
      state: json['state'],
      idNameCategory: CustomIdName.fromJson(json["idNameCategory"]),
      idNameState: CustomIdName.fromJson(json["idNameState"])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sysIdTrBarang': sysIdTrBarang,
      'number': number,
      'nameTrBarang': nameTrBarang,
      'category': category,
      'merk': merk,
      'tipe': tipe,
      'serialNumber': serialNumber,
      'tanggalPembelian': tanggalPembelian?.toIso8601String(),
      'harga': harga,
      'keterangan': keterangan,
      'state': state,
    };
  }
}
