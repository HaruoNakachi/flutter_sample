// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/services/CounterServices.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(CounterServices().counter, 0);
    });

    test('value should be incremented', () {
      final counter = CounterServices();

      counter.increment();

      expect(counter.counter, 1);
    });

    test('value should be decremented', () {
      final counter = CounterServices();

      counter.decrement();

      expect(counter.counter, -1);
    });
  });
}
