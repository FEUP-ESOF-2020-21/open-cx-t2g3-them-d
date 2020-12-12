import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smartcon_app/screens/insertConference/conferenceSessions.dart';
import 'package:smartcon_app/screens/insertConference/newSession.dart';

void main() {
  group('Conference Sessions', () {
    testWidgets('Pressing +', (WidgetTester tester) async {
      await tester.pumpWidget(conferenceSessions());
      await tester.tap(find.byElementType(FloatingActionButton));
      await tester.pump();
      expect(find.text('New Session'), findsOneWidget);
    });
    testWidgets('Pressing Okay button', (WidgetTester tester) async {
      await tester.pumpWidget(conferenceSessions());
      await tester.tap(find.byKey(Key('btn2')));
      await tester.pump();
      expect(find.text('Smart Con'), findsOneWidget);
    });
  });
  group('New Session', () {
    testWidgets('Pressing Insert Topics', (WidgetTester tester) async {
      await tester.pumpWidget(NewSession());
      await tester.tap(find.byKey(Key('topicsButtonn')));
      await tester.pump();
      expect(find.text('Insert Topics'), findsOneWidget);
    });
  });
}
