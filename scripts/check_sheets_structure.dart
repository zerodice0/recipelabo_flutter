import 'dart:convert';
import 'dart:io';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

/// Google Sheets 구조를 확인하는 스크립트
class SheetsChecker {
  static const String spreadsheetId = '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';

  final SheetsApi sheetsApi;

  SheetsChecker(this.sheetsApi);

  static Future<SheetsChecker> create() async {
    final serviceAccountFile = File('scripts/service-account-key.json');

    if (!serviceAccountFile.existsSync()) {
      throw Exception('서비스 계정 JSON 파일을 찾을 수 없습니다: scripts/service-account-key.json');
    }

    final serviceAccountJson = await serviceAccountFile.readAsString();
    final credentials = ServiceAccountCredentials.fromJson(
      jsonDecode(serviceAccountJson),
    );

    final client = await clientViaServiceAccount(
      credentials,
      [SheetsApi.spreadsheetsScope],
    );

    final sheetsApi = SheetsApi(client);
    return SheetsChecker(sheetsApi);
  }

  /// 스프레드시트 메타데이터 조회
  Future<void> checkSpreadsheetsStructure() async {
    try {
      print('📊 스프레드시트 구조 확인 중...');
      print('📋 Spreadsheet ID: $spreadsheetId');
      
      final spreadsheet = await sheetsApi.spreadsheets.get(spreadsheetId);
      
      print('\n📁 스프레드시트 정보:');
      print('  제목: ${spreadsheet.properties?.title}');
      print('  로케일: ${spreadsheet.properties?.locale}');
      print('  시간대: ${spreadsheet.properties?.timeZone}');
      
      print('\n📄 시트 목록:');
      if (spreadsheet.sheets != null) {
        for (int i = 0; i < spreadsheet.sheets!.length; i++) {
          final sheet = spreadsheet.sheets![i];
          final properties = sheet.properties;
          print('  ${i + 1}. 시트명: "${properties?.title}"');
          print('     - ID: ${properties?.sheetId}');
          print('     - 행 수: ${properties?.gridProperties?.rowCount}');
          print('     - 열 수: ${properties?.gridProperties?.columnCount}');
          print('     - 숨김: ${properties?.hidden}');
          print('');
        }
      } else {
        print('  시트를 찾을 수 없습니다.');
      }
      
      // 첫 번째 시트의 데이터 미리보기 시도
      if (spreadsheet.sheets != null && spreadsheet.sheets!.isNotEmpty) {
        final firstSheetName = spreadsheet.sheets!.first.properties?.title;
        if (firstSheetName != null) {
          print('🔍 "$firstSheetName" 시트의 데이터 미리보기:');
          try {
            final response = await sheetsApi.spreadsheets.values.get(
              spreadsheetId,
              '$firstSheetName!A1:E10',
            );
            
            final values = response.values;
            if (values != null && values.isNotEmpty) {
              print('  처음 ${values.length}행:');
              for (int i = 0; i < values.length && i < 5; i++) {
                final row = values[i];
                print('    ${i + 1}: ${row.take(5).join(" | ")}');
              }
            } else {
              print('  데이터가 없습니다.');
            }
          } catch (e) {
            print('  데이터 미리보기 실패: $e');
          }
        }
      }
      
    } catch (e) {
      print('❌ 스프레드시트 구조 확인 실패: $e');
      rethrow;
    }
  }
}

Future<void> main() async {
  try {
    print('🔍 Google Sheets 구조를 확인합니다...');
    print('=' * 60);

    final checker = await SheetsChecker.create();
    await checker.checkSpreadsheetsStructure();
    
    print('=' * 60);
    print('✅ 구조 확인 완료!');
  } catch (e) {
    print('💥 오류 발생: $e');
    exit(1);
  }
}