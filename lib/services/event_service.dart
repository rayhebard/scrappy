import 'dart:convert';
import 'package:http/http.dart';
import 'package:scrappy/models/event.dart';
import 'package:http/http.dart' as http;



class EventService {

  static const String url = 'https://calendar.kennesaw.edu/api/2/events/34430138657092';

  static Future<List<Event>> getEvent() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Event> event = event.FromJson(response.body);
        return event;
      } else {
        return List<Event>();
      }
    } catch (e) {
      return List<Event>();
    }
  }
}




/*
class EventService {

//TODO - Create Properties of Event Object
  Future initiate() async {
    // Make API call to Hackernews homepage
    var client = Client();
    try{
      Response response = await client.get('https://calendar.kennesaw.edu/api/2/events?pp=20&page=1&days=90');
      print(response.statusCode);
      var data = json.decode(response.body);
      var page = data["page"];
      var dateRange = data["date"];
      List list = data["events"].toList();
      print(list);
    }catch(e){
      print(e);
    } finally{
      client.close();
    }

  }

  getEventById(eventId) async{
    int id = eventId;

    var client = Client();
    try{
      Response response = await client.get('https://calendar.kennesaw.edu/api/2/events/34430138657092');
      var data = json.decode(response.body);
      var event = Event.fromJSON(data["event"]);
      print(event.description);
    }catch(e){
      print(e);
    } finally{
      client.close();
    }
  }
*/


