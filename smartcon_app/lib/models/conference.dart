import 'package:smartcon_app/models/session.dart';

class Conference {
  final String name;
  final String category;
  final String district;
  final String website;
  final String description;
  final DateTime beginDate;
  final DateTime endDate;
  final int rating;
  final List<Session> sessions;

  Conference({this.name, this.category, this.district, this.description, this.beginDate, this.endDate, this.website, this.rating, this.sessions});
}
