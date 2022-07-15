import 'dart:convert';

import 'package:http/http.dart' as http;

class JsonServer {
   String countryId;
  
   JsonServer({required this.countryId});
   String mainurl = "https://ezapi.jemistry.live/";
  

  countryData() async {
  

    var url = Uri.parse( mainurl + "country/" + countryId );
    
    var response = await http.get(url);
    
    var JsonDecode = jsonDecode(response.body);
    
    return JsonDecode;
    
}

   infoData() async {
      var url = Uri.parse(mainurl + "country/documents/" + countryId );
    var response = await http.get(url);
    var JsonDecode = jsonDecode(response.body);
    return JsonDecode;

}

}
