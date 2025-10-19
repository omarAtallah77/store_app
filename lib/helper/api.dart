import 'dart:convert';
import 'package:http/http.dart' as http;

class Api
{
  Future <http.Response> get({required String url , String ?token }) async
  {
    Map <String , String> headers = {};
    if (token != null)
    {
      headers.addAll({
        'Authorization' : token
      });
    }
    http.Response response = await http.get(Uri.parse(url) , headers: headers);
    if (response.statusCode == 200)
    {
      return  response ;
    }
    else
    {
      throw Exception('There is a problem with statu code ${response.statusCode}');
    }
  }

  Future <dynamic> post ({required String url , dynamic body , String  ? token}) async
  {
    Map <String , String> headers = {};
    if (token != null)
      {
        headers.addAll({
          'Authorization' : token
        });
      }
    http.Response response =  await http.post(Uri.parse(url) ,
      body: body ,
      headers: headers

    );

    if (response.statusCode == 200)
    {
      Map <String , dynamic> data = jsonDecode(response.body);
      return data ;
    }
    else
    {
      throw Exception('There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }

  }


  Future <dynamic> put ({required String url , dynamic body , String  ? token}) async
  {
    Map <String , String> headers = {};
    headers.addAll({
      'Content-Type' :'application/x-www-form-urlencoded'
    });
    if (token != null)
    {
      headers.addAll({
        'Authorization' : token ,
      });
    }
    http.Response response =  await http.post(Uri.parse(url) ,
        body: body ,
        headers: headers

    );

    if (response.statusCode == 200)
    {
      Map <String , dynamic> data = jsonDecode(response.body);
      return data ;
    }
    else
    {
      throw Exception('There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }

  }

}