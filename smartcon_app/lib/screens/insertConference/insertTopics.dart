import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnDelete();

class InsertTopics extends StatefulWidget {
  List<String> topics;
  List<TopicForm> topicsForms = [];
  InsertTopics({Key key, this.topics}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InsertTopicsState();
  }
}

class _InsertTopicsState extends State<InsertTopics> {

  @override
  void initState() {
    super.initState();

    // add previous forms
    for (var topic in widget.topics) {
      widget.topicsForms.add(TopicForm(topic: topic, onDelete: () => onDelete(topic),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: <Widget>[
        // Header
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset('images/pageHeader.png', fit: BoxFit.fill),
        ),

        // Title
        Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Insert Topics",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    child: widget.topicsForms.length <= 0
                        ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Add Topic by tapping + button",style: TextStyle(fontSize: 17.0, fontFamily: 'Rubik', color: Colors.black38, fontWeight: FontWeight.w400)),
                    )
                        : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      addAutomaticKeepAlives: true,
                      itemCount: widget.topicsForms.length,
                      itemBuilder: (_, i) => widget.topicsForms[i],
                    ),
                  )
                ])),

        SizedBox(height: 50),
      ]),
      floatingActionButton:
      Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.08),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  child: Icon(Icons.add),
                  backgroundColor: Color(0xFF5BBDB8),
                  onPressed: onAddForm,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: "btn2",
                child: Icon(Icons.done),
                backgroundColor: Color(0xFF5BBDB8),
                onPressed: onSave,
                foregroundColor: Colors.white,
              ),
            ),
          ]
      ),
    );
  }

  //on add form
  void onAddForm() {
    setState(() {
      var _topic = "";
      widget.topicsForms.add(TopicForm(topic: _topic, onDelete: () => onDelete(_topic),));
    });
  }

  //on form user deleted
  void onDelete(String _topic) {
    setState(() {
      var find = widget.topicsForms.firstWhere(
            (it) => it.topic == _topic,
        orElse: () => null,
      );
      if (find != null) widget.topicsForms.removeAt(widget.topicsForms.indexOf(find));
    });
  }

  //on save forms
  void onSave() {
    if (widget.topicsForms.length > 0) {
      var allValid = true;
      widget.topicsForms.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        widget.topics = widget.topicsForms.map((it) => it.topic).toList();
        Navigator.pop(context, widget.topics);
      }
    }
  }
}

class TopicForm extends StatefulWidget {
  String topic;
  final state = _TopicFormState();
  final OnDelete onDelete;

  TopicForm({Key key, this.topic, this.onDelete}) : super(key: key);
  @override
  _TopicFormState createState() => state;

  bool isValid() => state.validate();
}

class _TopicFormState extends State<TopicForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: form,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('Topic'),
                backgroundColor: Color(0xFF5BBDB8),
                automaticallyImplyLeading: false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              TextFormField(
                initialValue: widget.topic,
                onSaved: (val) => widget.topic = val,
                validator: (val) =>
                val.length > 2 ? null : 'Topic\'s name is invalid',
                decoration: InputDecoration(
                  labelText: 'Topic\'s name',
                  hintText: 'Topic\'s name',
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ));
  }

  // form validator
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }

}