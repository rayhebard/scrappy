import 'dart:convert';
import 'package:http/http.dart';
import 'package:scrappy/models/event.dart';



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
    }catch(e){
      print(e);
    } finally{
      client.close();
    }

  }

  Future getEventById(eventId) async{
    int id = eventId;
    Event event;

    var client = Client();
    try{
      Response response = await client.get('https://calendar.kennesaw.edu/api/2/events/34493879638912');
      var data = json.decode(response.body);
      event = Event.fromJSON(data["event"]);
      print(event.description);
    }catch(e){
      print(e);
    } finally{
      client.close();
      // ignore: control_flow_in_finally
      return event ;
    }
  }



}