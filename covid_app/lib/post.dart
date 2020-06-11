class Global{
  final List<Results> results;
  //final String stat;

  Global({
    this.results,
    //this.stat,
  });

  factory Global.fromJson(Map<String, dynamic> json){
    var list = json['results'] as List;
    List<Results> resultsList = list.map((i) => Results.fromJson(i)).toList();

    return Global(
      results: resultsList,
      //stat: json['stat'],
    );
  }
}

class Results{
  final int totalCases;//
  final int total_recovered;
  final int total_unresolved;
  final int total_deaths;
  final int total_new_cases_today;
  final int total_new_deaths_today;
  final int total_active_cases;
  final int total_serius_cases;
  //final Source source;

  Results({
    this.totalCases,
    this.total_recovered,
    this.total_unresolved,
    this.total_deaths,
    this.total_new_cases_today,
    this.total_new_deaths_today,
    this.total_active_cases,
    this.total_serius_cases,
    //this.source,
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
      //source: Source.fromJson(json['source']),
    );
  }
}

/////////////////////////////////////

class Country{
  final int ourid;
  final String title;
  final String code;
  final String source;
  final int total_cases;
  final int total_recovered;
  final int total_unresolved;
  final int total_deaths;
  final int total_new_cases_today;
  final int total_new_deaths_today;
  final int total_active_cases;
  final int total_serius_cases;

  Country({
    this.ourid,
    this.title,
    this.code,
    this.source,
    this.total_cases,
    this.total_recovered,
    this.total_unresolved,
    this.total_deaths,
    this.total_new_cases_today,
    this.total_new_deaths_today,
    this.total_active_cases,
    this.total_serius_cases,
  });

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      ourid: json['ourid'],
      title: json['title'],
      code: json['code'],
      source: json['source'],
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

class DateData{
  final String date;
  final int new_daily_cases;
  final int new_daily_deaths;
  final int total_cases;
  final int total_recoveries;
  final int total_deaths;

  DateData({
    this.date,
    this.new_daily_cases,
    this.new_daily_deaths,
    this.total_cases,
    this.total_recoveries,
    this.total_deaths,
  });

  factory DateData.fromJson(Map<String, dynamic> json){
    return DateData(
      date: json["date"],
      new_daily_cases: json["new_daily_cases"],
      new_daily_deaths: json["new_daily_deaths"],
      total_cases: json["total_cases"],
      total_recoveries: json["total_recoveries"],
      total_deaths: json["total_deaths"],
    );
  }
}

//String codigoPaises = {"AF","AL","DZ","AO","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CW","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KP","KR","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SX","SK","SI","SB","SO","ZA","GS","SS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","ZW"}
//////////////////////////////////////////////


