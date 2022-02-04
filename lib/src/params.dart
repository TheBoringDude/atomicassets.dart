// small function to parse params
String parseParams(Map<String, dynamic> data) {
  var params = "";

  data.forEach((key, value) {
    if (value != null) {
      if (params == "") {
        params += "$key=$value";
        return;
      }

      params += "&$key=$value";
    }
  });

  return params;
}
