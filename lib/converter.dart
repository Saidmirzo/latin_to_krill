class Converter {
  String cyrillicToLatin(String input) {
    Map<String, String> cyrillicToLatinMap = {
      'А': 'A',
      " ": " ",
      'Б': 'B',
      'В': 'V',
      'Г': 'G',
      'Д': 'D',
      'Е': 'E',
      'Ё': 'Yo',
      'Ж': 'Zh',
      'З': 'Z',
      'И': 'I',
      'Й': 'Y',
      'К': 'K',
      'Л': 'L',
      'М': 'M',
      'Н': 'N',
      'О': 'O',
      'П': 'P',
      'Р': 'R',
      'С': 'S',
      'Т': 'T',
      'У': 'U',
      'Ф': 'F',
      'Х': 'X',
      'Ц': 'Ts',
      'Ч': 'Ch',
      'Ш': 'Sh',
      'Щ': 'Sch',
      'Ъ': '\'',
      'Ы': 'Y',
      'Ь': '\'',
      'Э': 'E',
      'Ю': 'Yu',
      'Я': 'Ya',
      'а': 'a',
      'б': 'b',
      'в': 'v',
      'г': 'g',
      'д': 'd',
      'е': 'e',
      'ё': 'yo',
      'ж': 'zh',
      'з': 'z',
      'и': 'i',
      'й': 'y',
      'к': 'k',
      'л': 'l',
      'м': 'm',
      'н': 'n',
      'о': 'o',
      'п': 'p',
      'р': 'r',
      'с': 's',
      'т': 't',
      'у': 'u',
      'ф': 'f',
      'х': 'x',
      'ц': 'ts',
      'ч': 'ch',
      'ш': 'sh',
      'щ': 'sch',
      'ъ': '\'',
      'ы': 'y',
      'ь': '\'',
      'э': 'e',
      'ю': 'yu',
      'я': 'ya',
    };

    final String result =
        input.split('').map((char) => cyrillicToLatinMap[char] ?? ' ').join('');
    return result;
  }

  String latinToCyrillic(String input) {
    Map<String, String> latinToCyrillicMap = {
      'A': 'А',
      " ": " ",
      'B': 'Б',
      'V': 'В',
      'G': 'Г',
      'D': 'Д',
      'E': 'Е',
      'Yo': 'Ё',
      'Zh': 'Ж',
      'Z': 'З',
      'I': 'И',
      'Y': 'Й',
      'K': 'К',
      'L': 'Л',
      'M': 'М',
      'N': 'Н',
      'O': 'О',
      'P': 'П',
      'R': 'Р',
      'S': 'С',
      'T': 'Т',
      'U': 'У',
      'F': 'Ф',
      'X': 'Х',
      'Ts': 'Ц',
      'Ch': 'Ч',
      'Sh': 'Ш',
      'Sch': 'Щ',
      '\'': 'Ъ',
      'Y': 'Ы',
      '\'': 'Ь',
      'E': 'Э',
      'Yu': 'Ю',
      'Ya': 'Я',
      'a': 'а',
      'b': 'б',
      'v': 'в',
      'g': 'г',
      'd': 'д',
      'e': 'е',
      'yo': 'ё',
      'zh': 'ж',
      'z': 'з',
      'i': 'и',
      'y': 'й',
      'k': 'к',
      'l': 'л',
      'm': 'м',
      'n': 'н',
      'o': 'о',
      'p': 'п',
      'r': 'р',
      's': 'с',
      't': 'т',
      'u': 'у',
      'f': 'ф',
      'x': 'х',
      'ts': 'ц',
      'ch': 'ч',
      'sh': 'ш',
      'sch': 'щ',
      '\'': 'ъ',
      'y': 'ы',
      '\'': 'ь',
      'e': 'э',
      'yu': 'ю',
      'ya': 'я',
    };
    StringBuffer output = StringBuffer();
    int i = 0;

    while (i < input.length) {
      // Check for two-character digraphs first
      if (i + 1 < input.length) {
        String twoChar = input.substring(i, i + 2);
        if (latinToCyrillicMap.containsKey(twoChar)) {
          output.write(latinToCyrillicMap[twoChar]);
          i += 2;
          continue;
        }
      }

      // Check for single-character mappings
      String oneChar = input[i];
      if (latinToCyrillicMap.containsKey(oneChar)) {
        output.write(latinToCyrillicMap[oneChar]);
      } else {
        output.write(oneChar); // If not in map, keep the character as is
      }
      i++;
    }

    return output.toString();
  }

  // String latinToCyrillic(String input) {

  //   final String result =
  //       input.split('').map((char) => latinToCyrillicMap[char] ?? ' ').join('');
  //   return result;
  // }
}
