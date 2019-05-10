import 'package:http/http.dart' show get;
import 'dart:convert';


void async_req() async{
  var async_req = await get("https://swapi.co/api/people");
  print("Way 2 Output: ${async_req.statusCode}");
}

void main(List<String> args){

  // way 1
  print("Way 1");
  get("https://swapi.co/api/people")
    .then((response){
      var data = json.decode(response.body);
      print("Way 1 Output: ${data['count']}");
    })
    .whenComplete((){
      print("Complete");
    });

  // way 2
  print("Way 2");
  async_req();

}
