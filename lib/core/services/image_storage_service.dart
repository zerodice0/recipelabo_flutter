import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

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
}
