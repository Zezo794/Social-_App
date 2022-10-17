abstract class StatesHome_SocialApp{}
class SocialInitialStates extends StatesHome_SocialApp{}
class SocialAppLoadingGetUsreStates extends StatesHome_SocialApp{}
class SocialAppSucsessGetUsreStates extends StatesHome_SocialApp{}
class SocialAppErorrGetUsreStates extends StatesHome_SocialApp{
  final String ? erorr;

  SocialAppErorrGetUsreStates(this.erorr);
}

class SocialAppChangeNavBarStates extends StatesHome_SocialApp{}
class SocialAppNewPostStates extends StatesHome_SocialApp{}

class SocialAppSucsessPickProfileImageStates extends StatesHome_SocialApp{}
class SocialAppErorrPickProfileImageStates extends StatesHome_SocialApp{}

class SocialAppSucsessPickCoverImageStates extends StatesHome_SocialApp{}
class SocialAppErorrPickCoverImageStates extends StatesHome_SocialApp{}

class SocialAppSucsessUploadProfileImageStates extends StatesHome_SocialApp{}
class SocialAppErorrUploadProfileImageStates extends StatesHome_SocialApp{}

class SocialAppSucsessUploadCoverImageStates extends StatesHome_SocialApp{}
class SocialAppErorrUploadCoverImageStates extends StatesHome_SocialApp{}

class SocialAppLoadingUpdateUserStates extends StatesHome_SocialApp{}
class SocialAppErorrUpdateUserStates extends StatesHome_SocialApp{}


class SocialAppLoadingPickPostImageStates extends StatesHome_SocialApp{}
class SocialAppSucsessPickPostImageStates extends StatesHome_SocialApp{}
class SocialAppErorrPickPostImageStates extends StatesHome_SocialApp{}

class SocialAppErorrUploadPostImageStates extends StatesHome_SocialApp{}
class SocialAppRemovePostImageStates extends StatesHome_SocialApp{}


class SocialAppLoadingGetPostsStates extends StatesHome_SocialApp{}
class SocialAppSucsessGetPostsStates extends StatesHome_SocialApp{}
class SocialAppErorrGetPostsStates extends StatesHome_SocialApp{
  final String ? erorr;

  SocialAppErorrGetPostsStates(this.erorr);
}


class SocialAppSucsessPostLikeStates extends StatesHome_SocialApp{}
class SocialAppErorrPostLikeStates extends StatesHome_SocialApp{}



class SocialAppLoadingGetAllUsreStates extends StatesHome_SocialApp{}
class SocialAppSucsessGetAllUsreStates extends StatesHome_SocialApp{}
class SocialAppErorrGetAllUsreStates extends StatesHome_SocialApp{
  final String ? erorr;

  SocialAppErorrGetAllUsreStates(this.erorr);
}



class SocialAppSucsessSendMessageStates extends StatesHome_SocialApp{}
class SocialAppErorrSendMessageStates extends StatesHome_SocialApp{}

class SocialAppSucsessgetMessageStates extends StatesHome_SocialApp{}


class SocialAppLoadingPickChatImageStates extends StatesHome_SocialApp{}
class SocialAppSucsessPickChatImageStates extends StatesHome_SocialApp{}
class SocialAppErorrPickChatImageStates extends StatesHome_SocialApp{}

class SocialAppErorrUploadchatImageStates extends StatesHome_SocialApp{}