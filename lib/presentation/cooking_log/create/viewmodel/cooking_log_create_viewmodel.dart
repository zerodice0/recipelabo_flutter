import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/cooking_log_entity.dart';
import 'package:recipick_flutter/domain/usecases/save_cooking_log_usecase.dart';
import 'package:recipick_flutter/domain/usecases/pick_image_usecase.dart';

part 'cooking_log_create_viewmodel.freezed.dart';
part 'cooking_log_create_viewmodel.g.dart';

@freezed
abstract class CookingLogCreateState with _$CookingLogCreateState {
  const factory CookingLogCreateState({
    @Default('') String title,
    @Default('') String memo,
    String? base64EncodedImageData,
    DateTime? cookedAt,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isSaved,
  }) = _CookingLogCreateState;
}

@riverpod
class CookingLogCreateViewModel extends _$CookingLogCreateViewModel {
  @override
  CookingLogCreateState build() {
    return CookingLogCreateState(cookedAt: DateTime.now());
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateMemo(String memo) {
    state = state.copyWith(memo: memo);
  }

  void updateCookedAt(DateTime cookedAt) {
    state = state.copyWith(cookedAt: cookedAt);
  }

  void updateBase64EncodedImageData(String? base64EncodedImageData) {
    state = state.copyWith(base64EncodedImageData: base64EncodedImageData);
  }

  Future<void> pickImageFromCamera() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final useCase = ref.read(pickImageUseCaseProvider);
      final String? base64EncodedImageData = (await useCase.pickImageAsBase64(
        ImageSourceType.camera,
      ));

      state = state.copyWith(
        base64EncodedImageData: base64EncodedImageData,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> pickImageFromGallery() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final useCase = ref.read(pickImageUseCaseProvider);
      final String? base64EncodedImageData = (await useCase.pickImageAsBase64(
        ImageSourceType.gallery,
      ));

      state = state.copyWith(
        base64EncodedImageData: base64EncodedImageData,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void removeImage() {
    state = state.copyWith(base64EncodedImageData: null);
  }

  Future<void> saveCookingLog(String recipeVersionId, String authorId) async {
    if (state.title.trim().isEmpty) {
      state = state.copyWith(error: '제목을 입력해주세요.');
      return;
    }

    if (state.cookedAt == null) {
      state = state.copyWith(error: '요리한 날짜를 선택해주세요.');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final cookingLog = CookingLogEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        recipeVersionId: recipeVersionId,
        authorId: authorId,
        title: state.title.trim(),
        memo: state.memo.trim().isEmpty ? null : state.memo.trim(),
        base64EncodedImageData:
            state.base64EncodedImageData, // base64 인코딩된 이미지 데이터
        cookedAt: state.cookedAt!,
        createdAt: DateTime.now(),
      );

      final useCase = ref.read(saveCookingLogUseCaseProvider);
      await useCase(cookingLog);

      state = state.copyWith(isLoading: false, isSaved: true);
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void resetState() {
    state = CookingLogCreateState(cookedAt: DateTime.now());
  }
}
