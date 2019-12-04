import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final counterTextFinder = find.byValueKey('counter');
    final incrementButtonFinder = find.byValueKey('increment');
    final navigateToNextFinder = find.byValueKey('navigation_next');
    final navigationToPreviousFinder = find.byValueKey('navigation_previous');
    final textFieldFinder = find.byValueKey('textfield');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.screenshot();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      await driver.tap(incrementButtonFinder);

      expect(await driver.getText(counterTextFinder), "1");
    });

    test('navigate to next page', () {
      driver.tap(navigateToNextFinder);
    });

    test('text update in text field', () async {
      await driver.tap(textFieldFinder);
      await driver.enterText('Hello!');
      await driver.waitFor(find.text('Hello!'));
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText('World!');
      await driver.waitFor(find.text('World!'));
    });
    test('navigate to previous page', () {
      driver.tap(navigationToPreviousFinder);
    });
  });
}
