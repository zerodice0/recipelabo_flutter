import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('기본 위젯 테스트', (WidgetTester tester) async {
    // 간단한 위젯 테스트
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('Hello World'),
        ),
      ),
    );

    // 텍스트가 렌더링되는지 확인
    expect(find.text('Hello World'), findsOneWidget);
  });
}