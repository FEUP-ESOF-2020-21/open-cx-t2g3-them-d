class Session {
  final String sessionId;
  final String name;
  final List<String> topics;
  final List<String> speakers;
  final String website;
  final DateTime date;
  final String description;

  Session({this.sessionId, this.name, this.topics, this.speakers, this.website, this.date, this.description});
}

class SessionQuestion {
  final String sessionId;
  final String question;
  final List<String> options;
  final int required;
  final String type;
  final List<int> answers;

  SessionQuestion({this.sessionId, this.question, this.options, this.required, this.type, this.answers});
}