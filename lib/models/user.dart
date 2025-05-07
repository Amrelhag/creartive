class User{
  String? id;
  String? name;
  String? email;
  String? feedback;
  int? following;
  int? followers;
  int? project;

  User({ this.id,
    this.name,
    this.email,
  this.feedback,
    this.following,
    this.followers,
    this.project

  });

  User.fromFireStore(Map<String,dynamic>? data){
    id = data?["id"];
    name = data?["name"];
    email = data?["email"];
    feedback = data?["feedback"];
    following = data?["following"];
    followers = data?["followers"];
    project = data?["project"];
  }

  Map<String,dynamic> toFireStore(){
    return {
      "id":id,
      "name":name,
      "email":email,
      "feedback":feedback,
      "following":following,
      "followers":followers,
      "project":project,

    };
  }
}