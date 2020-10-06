class StringUtil {
  static String shortenString(String characters) {
    String trimmedChars = characters;
    return (trimmedChars.length <= 14)
        ? trimmedChars
        : '${trimmedChars.substring(0, 14)}...';
  }

  static String replaceWhitespaceWithPlus(String characters) {
    String trimmedChars = characters;
    return trimmedChars.replaceAll(' ', '+');
  }
}
