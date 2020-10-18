import 'dart:convert';
import 'package:http/http.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';



class EventService {

//TODO - Create Properties of Event Object
  Future getEvents() async {
    var client = Client();
    try{
      Response response = await client.get('https://calendar.kennesaw.edu/api/2/events?pp=20&page=1&days=90');
      print( "Status code: " + response.statusCode.toString());

      var data = json.decode(response.body);
      //Get the list of events within the data object
      var list = data["events"] as List;

      EventBank eventBank = EventBank(vault:list.map((json) => Event.fromJSON(json['event'])).toList(),
                                      dates: Dates.fromJson(data["date"]),
                                      page: Page.fromJson(data["page"])
                            );
      return eventBank;
    }catch(e){
      print(e);
    } finally{
      client.close();
    }

  }

  Future getEventById(eventId) async{
    Event event;

    var client = Client();
    try{
      Response response = await client.get('https://calendar.kennesaw.edu/api/2/events/$eventId');
      var data = json.decode(response.body);
      event = Event.fromJSON(data["event"]);
    }catch(e){
      print(e);
    } finally{
      client.close();
      // ignore: control_flow_in_finally
      return event ;
    }
  }


  Future getComputingEvents() async {
    var client = Client();
    try{
      Response response = await client.get('https://calendar.kennesaw.edu/api/2/events/search?search=computing&days=90');
      print(response.statusCode);

      var data = json.decode(response.body);
      //Get the list of events within the data object
      var list = data["events"] as List;

      EventBank eventBank = EventBank(vault:list.map((json) => Event.fromJSON(json['event'])).toList(),
          dates: Dates.fromJson(data["date"]),
          page: Page.fromJson(data["page"])
      );
      return eventBank;
    }catch(e){
      print(e);
    } finally{
      client.close();
    }

  }




}