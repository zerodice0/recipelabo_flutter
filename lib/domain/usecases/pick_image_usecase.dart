import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipick_flutter/core/services/image_storage_service.dart';

part 'pick_image_usecase.g.dart';

enum ImageSourceType { camera, gallery }

class PickImageUseCase {
  final ImagePicker _imagePicker;
  final ImageStorageService _imageStorageService;

  PickImageUseCase(this._imagePicker, this._imageStorageService);

  /// 이미지를 선택하고 앱 내부 저장소에 저장합니다
  ///
  /// [sourceType] 이미지를 가져올 소스 (카메라 또는 갤러리)
  /// [customFileName] 사용자 정의 파일명 (선택사항)
  ///
  /// Returns: 저장된 이미지 파일의 경로, 취소되면 null
  Future<String?> call(
    ImageSourceType sourceType, {
    String? customFileName,
  }) async {
    try {
      final ImageSource source = sourceType == ImageSourceType.camera
          ? ImageSource.camera
          : ImageSource.gallery;

      final XFile? pickedFile = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (pickedFile == null) {
        return null; // 사용자가 취소함
      }

      // 선택된 이미지를 앱 내부 저장소에 저장
      final File imageFile = File(pickedFile.path);
      final String savedPath = await _imageStorageService.saveImageFile(
        imageFile,
        customFileName: customFileName,
      );

      return savedPath;
    } catch (e) {
      throw Exception('이미지 선택 중 오류가 발생했습니다: $e');
    }
  }

  /// 여러 이미지를 선택하고 앱 내부 저장소에 저장합니다
  ///
  /// [maxImages] 최대 선택 가능한 이미지 수 (기본값: 5)
  ///
  /// Returns: 저장된 이미지 파일들의 경로 목록
  Future<List<String>> pickMultipleImages({int maxImages = 5}) async {
    try {
      final List<XFile> pickedFiles = await _imagePicker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (pickedFiles.isEmpty) {
        return []; // 사용자가 취소하거나 선택하지 않음
      }

      // 최대 개수 제한
      final List<XFile> limitedFiles = pickedFiles.take(maxImages).toList();
      final List<String> savedPaths = [];

      for (final XFile pickedFile in limitedFiles) {
        final File imageFile = File(pickedFile.path);
        final String savedPath = await _imageStorageService.saveImageFile(
          imageFile,
        );
        savedPaths.add(savedPath);
      }

      return savedPaths;
    } catch (e) {
      throw Exception('이미지 선택 중 오류가 발생했습니다: $e');
    }
  }
}

@riverpod
PickImageUseCase pickImageUseCase(Ref ref) {
  final imagePicker = ref.watch(imagePickerProvider);
  final imageStorageService = ref.watch(imageStorageServiceProvider);
  return PickImageUseCase(imagePicker, imageStorageService);
}

@riverpod
ImagePicker imagePicker(Ref ref) {
  return ImagePicker();
}

@riverpod
ImageStorageService imageStorageService(Ref ref) {
  return ImageStorageService();
}
