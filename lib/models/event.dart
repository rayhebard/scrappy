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
    List<String> event_target_audience;
    List<String> event_types;
    String localist_url;
    String localist_ics_url;
    String photourl;
    String venue_url;
    List<String> deparments;

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
      this.photourl,
      this.venue_url,
      this.deparments,
      });

    factory Event.fromJSON(Map<String, dynamic> data){
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
        // keywords: data["keywords"].toList(),
        // tags: data["tags"].toList(),
        description_text: data["description_text"],
        photo_id: data["photo_id"],
        detail_views: data["detail_views"],
        address: data["address"],
        description: data["description"],
        featured: data["featured"],
        // filters: data["filters"],
        // event_target_audience: data["filters"]["event_target_audience"],
        // event_types: data["filters"]["event_types"],
        localist_url: data["localist_url"],
        localist_ics_url: data["localist_ics_ur"],
        photourl: data["photourl"],
        venue_url: data["venue_url"],
        // deparments: data["department"].toList(),
      );
    }


    // Override toString to have a beautiful log of student object
    @override
    String toString() {
      return 'Event: {id = $id, title = $title}';
    }

}