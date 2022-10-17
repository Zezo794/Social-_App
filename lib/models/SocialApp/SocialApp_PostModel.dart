class SocialApp_PostModel
{
  String ? name;
  String ? UId;
  String ? profilImage;
  String ? postImage;
  String ? text;
  String ? dateTime;


  SocialApp_PostModel({this.name, this.UId, this.profilImage, this.postImage,
      this.text, this.dateTime});

  SocialApp_PostModel.fromjson(Map<String,dynamic>?json)
  {
    name=json!['name'];
    UId=json['UId'];
    postImage=json['postImage'];
    profilImage=json['profilImage'];
    text=json['text'];
    dateTime=json['dateTime'];
  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,

      'UId':UId,
      'postImage':postImage,
      'profilImage':profilImage,
      'text':text,
      'dateTime':dateTime
    };
  }

}