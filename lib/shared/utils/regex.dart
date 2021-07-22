class Regex {
  static bool isEmail(String email) {
    RegExp regExp = new RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*');
    return regExp.hasMatch(email);
  }

  static bool isNickname(String nickname) {
    RegExp regExp = new RegExp(r'^[a-zA-Z0-9ㄱ-ㅎ가-힣]+$');
    return regExp.hasMatch(nickname);
  }


  static bool isPassword(String password) {
    RegExp regExp = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$');
    return regExp.hasMatch(password);
  }




}
