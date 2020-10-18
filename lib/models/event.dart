import 'dart:convert';


class Event {

    //TODO - Create Properties of Event Object

    int id;
    String title;
    String url;
    String updated_at;
    String created_at;
    String first_date;
    String last_date;
    String hashtag;
    String urlname;
    int user_id;
    bool allows_reviews;
    bool allows_attendance;
    String location;
    String location_name;
    String status;
    String experince;
    String stream_url;
    String stream_info;
    String stream_embed_code;
    int created_by;
    int updated_by;
    int school_id;
    int campus_id;
    bool recurring;
    bool free;
    bool private;
    bool verified;
    bool rejected;
    bool sponsored;
    int venue_id;
    String ticket_url;
    String ticket_cost;
    List<String> keywords;
    List<String> tags;
    String description_text;
    int photo_id;
    int detail_views;
    String address;
    String description;
    bool featured;
    List<String> filters;
    List<EventTargetAudience> event_target_audience;
    List<EventType> event_types;
    String localist_url;
    String localist_ics_url;
    String photo_url;
    String venue_url;
    List<Department> departments;

    Event( {
      this.id,
      this.title,
      this.url,
      this.updated_at,
      this.created_at,
      this.first_date,
      this.last_date,
      this.hashtag,
      this.urlname,
      this.user_id,
      this.allows_reviews,
      this.allows_attendance,
      this.location,
      this.location_name,
      this.status,
      this.experince,
      this.stream_url,
      this.stream_info,
      this.stream_embed_code,
      this.created_by,
      this.updated_by,
      this.school_id,
      this.campus_id,
      this.recurring,
      this.free,
      this.private,
      this.verified,
      this.rejected,
      this.sponsored,
      this.venue_id,
      this.ticket_url,
      this.ticket_cost,
      this.keywords,
      this.tags,
      this.description_text,
      this.photo_id,
      this.detail_views,
      this.address,
      this.description,
      this.featured,
      this.filters,
      this.event_target_audience,
      this.event_types,
      this.localist_url,
      this.localist_ics_url,
      this.photo_url,
      this.venue_url,
      this.departments,
      });

    factory Event.fromJSON(Map<String, dynamic> data){

      //Create list for nested list inside the event object

      var keywords = data["keywords"] as List;
      List<String> keywordList =  keywords != null && keywords.length > 0 ? new List<String>.from(keywords) : [];

      var tags = data["tags"] as List;
      List<String> tagList =  tags != null && tags.length > 0 ?  new List<String>.from(tags) : [];


      // var eventTypes = filters["event_types"] as List;
      // List<EventType> eventTypeList =  eventTypes.length > 0 ? eventTypes.map((item) => EventType.fromJson(item)).toList() : [];

       // var eventTargets = filters["event_target_audience"] as List;
      // List<EventTargetAudience> eventTargetList = eventTargets.length > 0 ? eventTargets.map(item) => EventTargetAudience.fromJson(item)).toList()  : [];
      //
      var eventDepartments = data["departments"] as List;
      List<Department> departmentList = eventDepartments != null && eventDepartments.length > 0 ? eventDepartments.map((item) => Department.fromJson(item)).toList()  : [];

      return new Event( id: data["id"],
        title: data['title'],
        url: data['url'],
        updated_at: data['updated_at'],
        created_at: data["created_at"],
        first_date: data["first_date"],
        last_date: data["last_date"],
        hashtag: data["hashtag"],
        urlname: data["urlname"],
        user_id: data[" user_id"],
        allows_reviews: data["allows_reviews"],
        allows_attendance: data["allows_attendance"],
        location: data['location'],
        location_name: data['location_name'],
        status: data["status"],
        experince: data["experince"],
        stream_url: data["stream_url"],
        stream_info: data["stream_info"],
        stream_embed_code: data["stream_embed_cod"],
        created_by: data['created_by'],
        updated_by: data['updated_by'],
        school_id: data["school_id"],
        campus_id: data["campus_id"],
        recurring: data["recurring"],
        free: data["free"],
        private: data['private'],
        verified: data["verifie"],
        rejected: data["rejected"],
        sponsored: data["sponsored"],
        venue_id: data["venue_id"],
        ticket_url: data["ticket_url"],
        ticket_cost: data["ticket_cost"],
        keywords: keywordList,
        tags: tagList,
        description_text: data["description_text"],
        photo_id: data["photo_id"],
        detail_views: data["detail_views"],
        address: data["address"],
        description: data["description"],
        featured: data["featured"],
        // event_target_audience: eventTargetList,
        // event_types: eventTypeList,
        localist_url: data["localist_url"],
        localist_ics_url: data["localist_ics_ur"],
        photo_url: data["photo_url"],
        venue_url: data["venue_url"],
        departments: departmentList,
      );
    }


    // Override toString to have a beautiful log of student object
    @override
    String toString() {
      return 'Event: {id = $id, title = $title}';
    }

}


class Filter{
  List<EventType> eventTypes;
  List<EventTargetAudience> audiences;
  Filter({this.eventTypes, this.audiences});

  factory Filter.fromJson(Map<String, dynamic> data){

      var audiences = data["event_target_audience"] as List;
      var  types = data["event_target_audience"] as List;


    return Filter(
       eventTypes: types,
       audiences: audiences,
    );
  }
}

class EventType{
  int id;
  String name;

  EventType({this.id, this.name});

  factory EventType.fromJson(Map<String, dynamic> data){
    return EventType(
      id: data["id"],
      name: data["name"],
    );
  }
}

class EventTargetAudience{
  int id;
  String name;

  EventTargetAudience({this.id, this.name});

  factory EventTargetAudience.fromJson(Map<String, dynamic> data){
    return EventTargetAudience(
      id: data["id"],
      name: data["name"],
    );
  }
}

class Department{
  int id;
  String name;

  Department({this.id, this.name});

  factory Department.fromJson(Map<String, dynamic> data){
    return Department(
      id: data["id"],
      name: data["name"],
    );
  }

  // Override toString to have a beautiful log of student object
  @override
  String toString() {
    return 'Department: {id = $id, name = $name}';
  }
}