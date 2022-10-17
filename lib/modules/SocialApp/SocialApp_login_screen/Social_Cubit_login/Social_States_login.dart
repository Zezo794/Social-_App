abstract class SocialLoginStates {}
class IntialSocialState extends SocialLoginStates{}

class SocialLoginLoadingState extends SocialLoginStates{}
class SocialLoginSucsessState extends SocialLoginStates{
  final String ? UId;

  SocialLoginSucsessState(this.UId);
}
class SocialLoginErorrState extends SocialLoginStates{
  final String ? erorr;

  SocialLoginErorrState(this.erorr);
}

class SocialChangePassword extends SocialLoginStates{}