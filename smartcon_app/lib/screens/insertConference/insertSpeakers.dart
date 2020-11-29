import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnDelete();

class InsertSpeakers extends StatefulWidget {
  List<String> speakers;
  List<SpeakerForm> speakersForms = [];
  InsertSpeakers({Key key, this.speakers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InsertSpeakersState();
  }
}

class _InsertSpeakersState extends State<InsertSpeakers> {

  @override
  void initState() {
    super.initState();

    // add previous forms
    for (var spk in widget.speakers) {
      widget.speakersForms.add(SpeakerForm(speaker: spk, onDelete: () => onDelete(spk),));
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
                      "Insert Speakers",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    child: widget.speakersForms.length <= 0
                        ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Add Speaker by tapping + button",style: TextStyle(fontSize: 17.0, fontFamily: 'Rubik', color: Colors.black38, fontWeight: FontWeight.w400)),
                        )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            addAutomaticKeepAlives: true,
                            itemCount: widget.speakersForms.length,
                            itemBuilder: (_, i) => widget.speakersForms[i],
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
      var _speaker = "";
      widget.speakersForms.add(SpeakerForm(speaker: _speaker, onDelete: () => onDelete(_speaker),));
    });
  }

  //on form user deleted
  void onDelete(String _speaker) {
    setState(() {
      var find = widget.speakersForms.firstWhere(
            (it) => it.speaker == _speaker,
        orElse: () => null,
      );
      if (find != null) widget.speakersForms.removeAt(widget.speakersForms.indexOf(find));
    });
  }

  //on save forms
  void onSave() {
    if (widget.speakersForms.length > 0) {
      var allValid = true;
      widget.speakersForms.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        widget.speakers = widget.speakersForms.map((it) => it.speaker).toList();
        Navigator.pop(context, widget.speakers);
      }
    }
  }
}

class SpeakerForm extends StatefulWidget {
  String speaker;
  final state = _SpeakerFormState();
  final OnDelete onDelete;

  SpeakerForm({Key key, this.speaker, this.onDelete}) : super(key: key);
  @override
  _SpeakerFormState createState() => state;

  bool isValid() => state.validate();
}

class _SpeakerFormState extends State<SpeakerForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: form,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('Speaker'),
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
                initialValue: widget.speaker,
                onSaved: (val) => widget.speaker = val,
                validator: (val) =>
                  val.length > 2 ? null : 'Speaker\'s name is invalid',
                decoration: InputDecoration(
                  labelText: 'Speaker\'s name',
                  hintText: 'Speaker\'s name',
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