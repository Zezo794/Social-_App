class SocialApp_ChatModel
{

  String ? UIdSender;
  String ? UIdReciver;
  String ? message;
  String ? dateTime;
  String ? image;


  SocialApp_ChatModel({this.UIdSender, this.UIdReciver, this.message,
      this.dateTime , this.image});

  SocialApp_ChatModel.fromjson(Map<String,dynamic>?json)
  {
    UIdSender=json!['UIdSender'];
    UIdReciver=json['UIdReciver'];
    message=json['message'];
    dateTime=json['dateTime'];
    image=json['image'];
  }

  Map<String,dynamic> toMap()
  {
    return{
      'UIdSender':UIdSender,
      'UIdReciver':UIdReciver,
      'message':message,
      'dateTime':dateTime,
      'image':image,

    };
  }

}