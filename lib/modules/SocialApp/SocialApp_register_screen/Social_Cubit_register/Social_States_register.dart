abstract class SocialRegisterStates {}
class IntialRegisterSocialState extends SocialRegisterStates{}

class SocialRegisterLoadingState extends SocialRegisterStates{}
class SocialRegisterSucsessState extends SocialRegisterStates{}
class SocialRegistererorrState extends SocialRegisterStates{
  final String ? erorr;

  SocialRegistererorrState(this.erorr);
}

class SocialRegisterChangePassword extends SocialRegisterStates{}

class SocialCreateUserSucsessState extends SocialRegisterStates{
  final String ? UId;

  SocialCreateUserSucsessState(this.UId);
}
class SocialCreateUsererorrState extends SocialRegisterStates{
  final String ? erorr;

  SocialCreateUsererorrState(this.erorr);
}