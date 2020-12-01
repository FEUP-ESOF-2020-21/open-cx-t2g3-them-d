class Session {
  String sessionId;
  String name;
  List<String> topics;
  List<String> speakers;
  String website;
  DateTime date;
  String description;
  SessionQuestion question;

  Session({this.sessionId, this.name, this.topics, this.speakers, this.website, this.date, this.description});

  Session.emptySession({this.sessionId='', this.name = '', this.website = '', this.description=''});

  void addQuestion(SessionQuestion question){
    this.question = question;
  }
}

class SessionQuestion {
  final String sessionId;
  final String question;
  final List<String> options;
  final int required;
  final String type;
  final List<int> answers;

  SessionQuestion({this.sessionId='', this.question, this.options, this.required, this.type, this.answers});
}