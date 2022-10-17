class SocialApp_UserModel
{
  String ? name;
  String ? email;
  String ? phone;
  String ? UId;
  String ? coverImage;
  String ? profilImage;
  String ? bio;
  bool ? isverified;


  SocialApp_UserModel({this.name, this.email, this.phone, this.UId,
      this.coverImage, this.profilImage, this.bio, this.isverified});

  SocialApp_UserModel.fromjson(Map<String,dynamic>?json)
  {
    name=json!['name'];
    email=json['email'];
    phone=json['phone'];
    UId=json['UId'];
    coverImage=json['coverImage'];
    profilImage=json['profilImage'];
    bio=json['bio'];
    isverified=json['isverified'];
  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'UId':UId,
      'coverImage':coverImage,
      'profilImage':profilImage,
      'bio':bio,
      'isverified':isverified
    };
  }

}