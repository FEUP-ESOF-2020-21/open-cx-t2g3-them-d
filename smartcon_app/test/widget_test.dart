import 'dart:io';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/screens/insertConference/conferenceSessions.dart';
import 'package:smartcon_app/screens/insertConference/insertConference.dart';
import 'package:smartcon_app/screens/insertConference/newSession.dart';

class MockConf extends Mock implements Conference {}

void main() {
  group('HomePage', () {
    testWidgets('Pressing Insert Conference', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: InsertConference()));
      final insertConferencesPage = find.text("Insert Conference");
      expect(insertConferencesPage, findsOneWidget);
      expect(find.byType(TextFormField),
          findsNWidgets(3)); //Name, Description, Website
      expect(find.byType(RaisedButton), findsOneWidget); //Next
      expect(find.byType(MaterialButton), findsOneWidget); //Date
      expect(find.byType(DropDownFormField),
          findsNWidgets(2)); //District and Category
    });
  });

  group('Insert Conference', () {
    testWidgets('Errors if pressing NEXT and form is not filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: InsertConference()));

      await tester.tap(find.byKey(Key('insert_conference_next')));
      await tester.pump();
      final nameError = find.text('Name is Required');
      final districtError = find.text('Please choose a district');
      final dateError = find.text('Must Pick a date');
      final categoryError = find.text('Please choose a category');
      final descriptiveError = find.text('Description is Required');
      expect(nameError, findsOneWidget);
      expect(districtError, findsOneWidget);
      expect(dateError, findsOneWidget);
      expect(categoryError, findsOneWidget);
      expect(descriptiveError, findsOneWidget);
    });

    testWidgets('Pressing NEXT should go to Conference Sessions',
        (WidgetTester tester) async {
      final conf = MockConf();

      await tester.pumpWidget(MaterialApp(home: InsertConference()));

      await tester.enterText(find.byKey(Key('name_field')), 'Conf');

      await tester.tap(find.text('Choose a district'));
      await tester.tap(find.text("Porto"));

      /*await tester.tap(find.byType(MaterialButton));
      expect(find.text('December 2020'), findsOneWidget);*/

      await tester.tap(find.text('Description'));
      await tester.tap(find.text("Technology"));

      /* await tester.enterText(
          find.byKey(Key('description_field')), 'description');*/

      await tester.pump();

      final confPage =
          find.text('Insert Conference' /* 'Conference Sessions'*/);
      expect(confPage, findsOneWidget);
    });
  });

  group('Conference Sessions', () {
    /*setUp(
      var model = MockConference();
      await model.initialise();
    );*/
    testWidgets('Pressing okay symbol', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: conferenceSessions()));
      await tester.tap(find.byKey(Key('btn2')));
      await tester.pump();
      /*final popupFinder = find.byWidget(AlertDialog);
      var popupFinderExists = await FlutterDriverUtils.isPresent(world.driver, popupFinder);
      expectMatch(true, popupFinderExists);*/
      expect(
          find.text(
              'The attendees can now get session suggestions by using this code.'),
          findsOneWidget);
    });

    testWidgets('Pressing + symbol', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: conferenceSessions()));
      await tester.tap(find.byKey(Key('btn1')));
      //await tester.pump();
      expect(find.text('New Session'), findsOneWidget);
    });
  });

  group('New Session', () {
    testWidgets('Pressing NEXT shoud go to quiz form',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: NewSession()));
      await tester.tap(find.byType(RaisedButton));
      await tester.pump();
      expect(find.text('New Session'), findsOneWidget);
    });
  });
}
