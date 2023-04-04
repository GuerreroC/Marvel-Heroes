import 'dart:convert';

class MarvelData {
  MarvelData({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  HeroesList? data;

  factory MarvelData.fromRawJson(String str) =>
      MarvelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarvelData.fromJson(Map<String, dynamic> json) => MarvelData(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : HeroesList.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toJson(),
      };
}

class HeroesList {
  HeroesList({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Heroe>? results;

  factory HeroesList.fromRawJson(String str) =>
      HeroesList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeroesList.fromJson(Map<String, dynamic> json) => HeroesList(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<Heroe>.from(json["results"]!.map((x) => Heroe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Heroe {
  Heroe({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  ComicsList? comics;
  SeriesList? series;
  StoriesList? stories;
  EventsList? events;
  List<UrlData>? urls;

  factory Heroe.fromRawJson(String str) => Heroe.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Heroe.fromJson(Map<String, dynamic> json) => Heroe(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics:
            json["comics"] == null ? null : ComicsList.fromJson(json["comics"]),
        series:
            json["series"] == null ? null : SeriesList.fromJson(json["series"]),
        stories: json["stories"] == null
            ? null
            : StoriesList.fromJson(json["stories"]),
        events:
            json["events"] == null ? null : EventsList.fromJson(json["events"]),
        urls: json["urls"] == null
            ? []
            : List<UrlData>.from(json["urls"]!.map((x) => UrlData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail?.toJson(),
        "resourceURI": resourceUri,
        "comics": comics?.toJson(),
        "series": series?.toJson(),
        "stories": stories?.toJson(),
        "events": events?.toJson(),
        "urls": urls == null
            ? []
            : List<dynamic>.from(urls!.map((x) => x.toJson())),
      };
}

class ComicsList {
  ComicsList({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Comics>? items;
  int? returned;

  factory ComicsList.fromRawJson(String str) =>
      ComicsList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicsList.fromJson(Map<String, dynamic> json) => ComicsList(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<Comics>.from(json["items"]!.map((x) => Comics.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class Comics {
  Comics({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory Comics.fromRawJson(String str) => Comics.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class SeriesList {
  SeriesList({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Series>? items;
  int? returned;

  factory SeriesList.fromRawJson(String str) =>
      SeriesList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeriesList.fromJson(Map<String, dynamic> json) => SeriesList(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<Series>.from(json["items"]!.map((x) => Series.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory Series.fromRawJson(String str) => Series.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class StoriesList {
  StoriesList({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Stories>? items;
  int? returned;

  factory StoriesList.fromRawJson(String str) =>
      StoriesList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoriesList.fromJson(Map<String, dynamic> json) => StoriesList(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<Stories>.from(
                json["items"]!.map((x) => Stories.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class Stories {
  Stories({
    this.resourceUri,
    this.name,
    this.type,
  });

  String? resourceUri;
  String? name;
  String? type;

  factory Stories.fromRawJson(String str) => Stories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}

class EventsList {
  EventsList({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Events>? items;
  int? returned;

  factory EventsList.fromRawJson(String str) =>
      EventsList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventsList.fromJson(Map<String, dynamic> json) => EventsList(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<Events>.from(json["items"]!.map((x) => Events.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class Events {
  Events({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory Events.fromRawJson(String str) => Events.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Thumbnail {
  Thumbnail({
    this.path,
    this.ext,
  });

  String? path;
  String? ext;

  factory Thumbnail.fromRawJson(String str) =>
      Thumbnail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        ext: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": ext,
      };
}

class UrlData {
  UrlData({
    this.type,
    this.url,
  });

  String? type;
  String? url;

  factory UrlData.fromRawJson(String str) => UrlData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UrlData.fromJson(Map<String, dynamic> json) => UrlData(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}
