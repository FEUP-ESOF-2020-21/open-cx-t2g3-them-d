class Session {
  final String sessionId;
  final String name;
  final List<String> topics;
  final List<String> speakers;
  final String website;
  final DateTime date;

  Session({this.sessionId, this.name, this.topics, this.speakers, this.website, this.date});
}

class SessionQuestion {
  final String sessionId;
  final String question;
  final List<String> options;
  final int required;

  SessionQuestion({this.sessionId, this.question, this.options, this.required});
}