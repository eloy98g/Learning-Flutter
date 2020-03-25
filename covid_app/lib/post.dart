/*
class Post{
  final int userID;
  final int id;
  final String title;
  final String body;

  Post({
    this.userID,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userID: json['userID'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Post{
  final Countrydata countrydata;
  final Countrynewsitems countrynewsitems;

  Post({
    this.countrydata,
    this.countrynewsitems,
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      countrydata: Countrydata.fromJson(json['countrydata']),
      //countrynewsitems: Countrynewsitems.fromJson(json['countrynewsitems']),
    );
  }

}

class Countrydata {
  final Info info;
  final int total_cases;
  final int total_recovered;
  final int total_unresolved;
  final int total_deaths;
  final int total_new_cases_today;
  final int total_new_deaths_today;
  final int total_active_cases;
  final int total_serius_cases;

  Countrydata({
    this.info,
    this.total_cases,
    this.total_recovered,
    this.total_unresolved,
    this.total_deaths,
    this.total_new_cases_today,
    this.total_new_deaths_today,
    this.total_active_cases,
    this.total_serius_cases,
  });

  factory Countrydata.fromJson(Map<String, dynamic> json){
    return Countrydata(
      info: Info.fromJson(json['info']),
      total_cases: json['total_cases'],
      total_recovered: json['total_recovered'],
      total_unresolved: json['total_unresolved'],
      total_deaths: json['total_deaths'],
      total_new_cases_today: json['total_new_cases_today'],
      total_new_deaths_today: json['total_new_deaths_today'],
      total_active_cases: json['total_active_cases'],
      total_serius_cases: json['total_serius_cases'],
    );
  }
}

class Info{
  final int ourid;
  final String title;
  final String code;
  final String source;

  Info({
    this.ourid,
    this.title,
    this.code,
    this.source,
  });

  factory Info.fromJson(Map<String, dynamic> json){
    return Info(
      ourid: json['ourid'],
      title: json['title'],
      code: json['code'],
      source: json['source'],
    );
  }
}

class Countrynewsitems {
  //TODO: parsear una key dinamica jajaxd
}*/


class Global{
  final List<Results> results;
  final String stat;

  Global({
    this.results,
    this.stat,
  });

  factory Global.fromJson(Map<String, dynamic> json){

    var list = json['results'] as List;
    print(list.runtimeType); //returns List<dynamic>
    List<Results> resultsList = list.map((i) => Results.fromJson(i)).toList();

    return Global(
      results: resultsList,
      stat: json['stat'],
    );
  }
}

class Results{
  final int totalCases;
  final int total_recovered;
  final int total_unresolved;
  final int total_deaths;
  final int total_new_cases_today;
  final int total_new_deaths_today;
  final int total_active_cases;
  final int total_serius_cases;
  final Source source;

  Results({
    this.totalCases,
    this.total_recovered,
    this.total_unresolved,
    this.total_deaths,
    this.total_new_cases_today,
    this.total_new_deaths_today,
    this.total_active_cases,
    this.total_serius_cases,
    this.source,
  });

  factory Results.fromJson(Map<String, dynamic> json){
    return Results(
      totalCases: json['total_cases'],
      total_recovered: json['total_recovered'],
      total_unresolved: json['total_unresolved'],
      total_deaths: json['total_deaths'],
      total_new_cases_today: json['total_new_cases_today'],
      total_new_deaths_today: json['total_new_deaths_today'],
      total_active_cases: json['total_active_cases'],
      total_serius_cases: json['total_serius_cases'],
      source: Source.fromJson(json['source']),
    );
  }
}

class Source{
  final String url;

  Source({
    this.url,
  });

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      url: json['url'],
    );
  }
}