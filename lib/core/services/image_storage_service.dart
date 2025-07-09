import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:image/image.dart' as img;

/// 이미지 저장 및 관리를 담당하는 서비스
class ImageStorageService {
  static const String _imagesFolder = 'images';
  static const Uuid _uuid = Uuid();

  /// 앱의 이미지 저장 디렉토리를 가져옵니다
  Future<Directory> _getImagesDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(path.join(appDir.path, _imagesFolder));

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    return imagesDir;
  }

  /// 이미지 파일을 앱 내부 저장소에 저장합니다
  ///
  /// [sourceFile] 원본 이미지 파일
  /// [customFileName] 사용자 정의 파일명 (선택사항)
  ///
  /// Returns: 저장된 파일의 절대 경로
  Future<String> saveImageFile(
    File sourceFile, {
    String? customFileName,
  }) async {
    try {
      final imagesDir = await _getImagesDirectory();
      final extension = path.extension(sourceFile.path);
      final fileName = customFileName ?? '${_uuid.v4()}$extension';
      final targetFile = File(path.join(imagesDir.path, fileName));

      // 파일 복사
      await sourceFile.copy(targetFile.path);

      return targetFile.path;
    } catch (e) {
      throw Exception('이미지 저장 중 오류가 발생했습니다: $e');
    }
  }

  /// 바이트 데이터를 이미지 파일로 저장합니다
  ///
  /// [imageBytes] 이미지 바이트 데이터
  /// [extension] 파일 확장자 (예: '.jpg', '.png')
  /// [customFileName] 사용자 정의 파일명 (선택사항)
  ///
  /// Returns: 저장된 파일의 절대 경로
  Future<String> saveImageBytes(
    Uint8List imageBytes,
    String extension, {
    String? customFileName,
  }) async {
    try {
      final imagesDir = await _getImagesDirectory();
      final fileName = customFileName ?? '${_uuid.v4()}$extension';
      final targetFile = File(path.join(imagesDir.path, fileName));

      // 바이트 데이터로 파일 생성
      await targetFile.writeAsBytes(imageBytes);

      return targetFile.path;
    } catch (e) {
      throw Exception('이미지 저장 중 오류가 발생했습니다: $e');
    }
  }

  /// 저장된 이미지 파일을 가져옵니다
  ///
  /// [imagePath] 이미지 파일 경로
  ///
  /// Returns: 이미지 파일, 존재하지 않으면 null
  Future<File?> getImageFile(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        return file;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// 이미지 파일을 삭제합니다
  ///
  /// [imagePath] 삭제할 이미지 파일 경로
  ///
  /// Returns: 삭제 성공 여부
  Future<bool> deleteImageFile(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// 저장된 모든 이미지 파일 목록을 가져옵니다
  Future<List<File>> getAllImageFiles() async {
    try {
      final imagesDir = await _getImagesDirectory();
      final files = imagesDir
          .listSync()
          .whereType<File>()
          .where((file) => _isImageFile(file.path))
          .toList();

      // 수정 시간 순으로 정렬 (최신순)
      files.sort(
        (a, b) => b.statSync().modified.compareTo(a.statSync().modified),
      );

      return files;
    } catch (e) {
      return [];
    }
  }

  /// 파일이 이미지 파일인지 확인합니다
  bool _isImageFile(String filePath) {
    final extension = path.extension(filePath).toLowerCase();
    return [
      '.jpg',
      '.jpeg',
      '.png',
      '.gif',
      '.bmp',
      '.webp',
    ].contains(extension);
  }

  /// 저장된 이미지들의 총 크기를 계산합니다 (바이트 단위)
  Future<int> getTotalImageSize() async {
    try {
      final files = await getAllImageFiles();
      int totalSize = 0;

      for (final file in files) {
        totalSize += await file.length();
      }

      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  /// 오래된 이미지 파일들을 정리합니다
  ///
  /// [daysOld] 몇 일 이전의 파일들을 삭제할지 (기본값: 30일)
  /// [maxFiles] 최대 보관할 파일 수 (기본값: 100개)
  Future<int> cleanupOldImages({int daysOld = 30, int maxFiles = 100}) async {
    try {
      final files = await getAllImageFiles();
      final cutoffDate = DateTime.now().subtract(Duration(days: daysOld));
      int deletedCount = 0;

      // 날짜 기준으로 오래된 파일 삭제
      for (final file in files) {
        final stat = file.statSync();
        if (stat.modified.isBefore(cutoffDate)) {
          await file.delete();
          deletedCount++;
        }
      }

      // 파일 수 기준으로 초과분 삭제
      final remainingFiles = await getAllImageFiles();
      if (remainingFiles.length > maxFiles) {
        final filesToDelete = remainingFiles.skip(maxFiles);
        for (final file in filesToDelete) {
          await file.delete();
          deletedCount++;
        }
      }

      return deletedCount;
    } catch (e) {
      return 0;
    }
  }

  /// 이미지 파일을 리사이징하고 Base64 문자열로 인코딩합니다
  ///
  /// [imageFile] 인코딩할 이미지 파일
  /// [maxWidth] 최대 가로 길이 (기본값: 1920, Full HD)
  /// [maxHeight] 최대 세로 길이 (기본값: 1080, Full HD)
  /// [quality] JPEG 압축 품질 (기본값: 85, 0-100 범위)
  ///
  /// Returns: Base64로 인코딩된 문자열, 실패 시 null
  Future<String?> encodeImageToBase64(
    File imageFile, {
    int maxWidth = 1920,
    int maxHeight = 1080,
    int quality = 85,
  }) async {
    try {
      if (!await imageFile.exists()) {
        return null;
      }

      // 이미지 리사이징 적용
      final resizedBytes = await _resizeImage(
        imageFile,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        quality: quality,
      );

      if (resizedBytes == null) {
        // 리사이징 실패 시 원본 파일 사용
        final bytes = await imageFile.readAsBytes();
        return base64Encode(bytes);
      }

      return base64Encode(resizedBytes);
    } catch (e) {
      throw Exception('이미지 Base64 인코딩 중 오류가 발생했습니다: $e');
    }
  }

  /// 이미지를 리사이징하고 압축합니다
  ///
  /// [imageFile] 리사이징할 이미지 파일
  /// [maxWidth] 최대 가로 길이
  /// [maxHeight] 최대 세로 길이
  /// [quality] JPEG 압축 품질 (0-100)
  ///
  /// Returns: 리사이징된 이미지 바이트 데이터, 실패 시 null
  Future<Uint8List?> _resizeImage(
    File imageFile, {
    required int maxWidth,
    required int maxHeight,
    required int quality,
  }) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      
      if (image == null) {
        return null;
      }

      // 현재 이미지 크기
      final currentWidth = image.width;
      final currentHeight = image.height;

      // 리사이징이 필요한지 확인
      if (currentWidth <= maxWidth && currentHeight <= maxHeight) {
        // 리사이징이 필요없으면 JPEG 압축만 적용
        final compressedImage = img.encodeJpg(image, quality: quality);
        return Uint8List.fromList(compressedImage);
      }

      // 비율을 유지하면서 리사이징할 크기 계산
      final widthRatio = maxWidth / currentWidth;
      final heightRatio = maxHeight / currentHeight;
      final ratio = math.min(widthRatio, heightRatio);

      final newWidth = (currentWidth * ratio).round();
      final newHeight = (currentHeight * ratio).round();

      // 이미지 리사이징
      final resizedImage = img.copyResize(
        image,
        width: newWidth,
        height: newHeight,
        interpolation: img.Interpolation.linear,
      );

      // JPEG로 압축하여 바이트 배열로 변환
      final compressedImage = img.encodeJpg(resizedImage, quality: quality);
      return Uint8List.fromList(compressedImage);
    } catch (e) {
      return null;
    }
  }

  /// Base64 문자열을 이미지 바이트 데이터로 디코딩합니다
  ///
  /// [base64String] 디코딩할 Base64 문자열
  ///
  /// Returns: 디코딩된 이미지 바이트 데이터, 실패 시 null
  Uint8List? decodeBase64ToBytes(String base64String) {
    try {
      return base64Decode(base64String);
    } catch (e) {
      return null;
    }
  }

  /// Base64 문자열에서 임시 이미지 파일을 생성합니다
  ///
  /// [base64String] Base64로 인코딩된 이미지 데이터
  /// [extension] 파일 확장자 (예: '.jpg', '.png')
  ///
  /// Returns: 생성된 임시 파일, 실패 시 null
  Future<File?> createTempFileFromBase64(
    String base64String,
    String extension,
  ) async {
    try {
      final bytes = decodeBase64ToBytes(base64String);
      if (bytes == null) return null;

      final tempDir = await getTemporaryDirectory();
      final tempFile = File(
        path.join(tempDir.path, '${_uuid.v4()}$extension'),
      );

      await tempFile.writeAsBytes(bytes);
      return tempFile;
    } catch (e) {
      return null;
    }
  }
}
