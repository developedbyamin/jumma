extension BracketExtension on String {
  String get sn {
    String result ='';
    int bracketIndex = toString().indexOf('(');
    if (bracketIndex != -1) {
    result = toString().substring(0, bracketIndex).trim(); 
  }
    return result;
  }
}


