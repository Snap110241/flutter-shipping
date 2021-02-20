class ParamsOption {
  int offset;
  int limit;
  String field;
  String text;
  String filter;
  String s;
  String from;
  String to;

  ParamsOption(
      {this.offset,
        this.limit,
        this.field,
        this.text,
        this.filter,
        this.s,
        this.from,
        this.to});

  Map toJson() => {
    'offset': offset,
    'limit': limit,
    'field': field,
    'text': text,
    'filter': filter,
    's': s,
    'from': from,
    'to': to
  };

  String toParams(Map jsonParams) {
    try {
      String params = '';
      jsonParams.keys.toList().forEach((element) {
        if (jsonParams[element] != null)
          params += '$element=${jsonParams[element]}&';
      });
      params = '?${params.substring(0, params.length-1)}';
      return params;
    } catch (ex) {
      print('ParamsOption toParams ===> $ex');
      return '';
    }
  }
}
