/// name : "morpheus"
/// job : "leader"
/// id : "908"
/// createdAt : "2021-09-14T14:44:47.705Z"

class UserProfile {
  String? _name;
  String? _job;
  String? _id;
  String? _createdAt;

  String? get name => _name;
  String? get job => _job;
  String? get id => _id;
  String? get createdAt => _createdAt;

  UserProfile({
      String? name, 
      String? job, 
      String? id, 
      String? createdAt}){
    _name = name;
    _job = job;
    _id = id;
    _createdAt = createdAt;
}

  UserProfile.fromJson(dynamic json) {
    _name = json['name'];
    _job = json['job'];
    _id = json['id'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['job'] = _job;
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    return map;
  }

}