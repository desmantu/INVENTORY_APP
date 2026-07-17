class  CustomIdName {
  String? id;
  String? name;
  
  CustomIdName({
    this.id,
    this.name,
  });

  factory CustomIdName.fromJson(Map<String, dynamic> json) {
    return CustomIdName(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return { 
      'id' : id,
      'name' : name,
    };}
}