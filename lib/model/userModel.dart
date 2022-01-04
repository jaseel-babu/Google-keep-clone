class UserModel {
  String? id;
  String? displayName;
  String? email;
  String? imageurl;
  UserModel({this.id,this.displayName,this.email,this.imageurl});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      displayName: map['displayname'],
       email: map['email'], imageurl: map['photourl'],
    );
  }
  Map<String, dynamic> toMap() {
    return {  "id": id,
        "email": email,
        "photourl":imageurl,
        "displayname": displayName};
  }
}
