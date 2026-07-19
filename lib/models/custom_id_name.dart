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



  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  @override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is CustomIdName &&
        runtimeType == other.runtimeType &&
        id == other.id;

@override
int get hashCode => id.hashCode;
}