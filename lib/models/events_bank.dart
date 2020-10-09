import 'event.dart';

import"package:scrappy/models/event.dart";


class EventBank {

  List<Event> vault;
  Page page;
  Dates dates;
  EventBank({this.vault, this.page, this.dates});

  appendEvent(event){
    vault.add(event);
  }

}

//This call keeps track of the current page number the size of the page number and the total number of pages
class Page {
   int current;
   int size;
   int total;
  Page({ this.current, this.size, this.total});


  factory Page.fromJson(Map<String, dynamic> data){
     return Page(
       current: data["current"],
       size: data["size"],
       total: data["total"]
     );
  }

}

//This class
class Dates{
  String first;
  String last;
  Dates({this.first, this.last});

  factory Dates.fromJson(Map<String, dynamic> data){
     return Dates(
       first: data["first"],
       last: data["last"],
     );
  }
}