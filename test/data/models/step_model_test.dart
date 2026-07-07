import 'package:flutter_test/flutter_test.dart';
import 'package:recipick_flutter/data/models/step_model.dart';
import 'package:recipick_flutter/domain/entities/step_entity.dart';

void main() {
  group('StepModel timer mapping', () {
    test('preserves timer fields through map and entity conversions', () {
      final now = DateTime.utc(2026, 7, 7, 9);
      final model = StepModel(
        id: 'step-1',
        recipeVersionId: 'version-1',
        stepNumber: 1,
        description: '면을 삶는다',
        timerMinutes: 7,
        timerSeconds: 30,
        timerName: '면 삶기',
        createdAt: now,
        updatedAt: now,
      );

      final map = model.toMap();
      final restoredModel = StepModelExtension.fromMap(map);
      final entity = restoredModel.toEntity();
      final modelFromEntity = StepModelEntityExtension.fromEntity(entity);

      expect(map['timerMinutes'], 7);
      expect(map['timerSeconds'], 30);
      expect(map['timerName'], '면 삶기');
      expect(restoredModel.timerMinutes, 7);
      expect(restoredModel.timerSeconds, 30);
      expect(restoredModel.timerName, '면 삶기');
      expect(entity.timerMinutes, 7);
      expect(entity.timerSeconds, 30);
      expect(entity.timerName, '면 삶기');
      expect(modelFromEntity.timerMinutes, 7);
      expect(modelFromEntity.timerSeconds, 30);
      expect(modelFromEntity.timerName, '면 삶기');
    });

    test('reads legacy maps without timer columns as timerless steps', () {
      final legacyModel = StepModelExtension.fromMap({
        'id': 'step-legacy',
        'recipeVersionId': 'version-legacy',
        'stepNumber': 2,
        'description': '소스를 넣는다',
        'imageUrl': null,
        'createdAt': '2026-07-07T09:00:00.000Z',
        'updatedAt': '2026-07-07T09:00:00.000Z',
        'isDeleted': 0,
      });

      expect(legacyModel.timerMinutes, isNull);
      expect(legacyModel.timerSeconds, isNull);
      expect(legacyModel.timerName, isNull);
    });

    test('converts timer entity to model', () {
      const entity = StepEntity(
        id: 'step-entity',
        recipeVersionId: 'version-entity',
        stepNumber: 3,
        description: '뜸을 들인다',
        timerMinutes: 10,
        timerSeconds: 0,
        timerName: '뜸들이기',
      );

      final model = StepModelEntityExtension.fromEntity(entity);

      expect(model.timerMinutes, 10);
      expect(model.timerSeconds, 0);
      expect(model.timerName, '뜸들이기');
    });
  });
}
