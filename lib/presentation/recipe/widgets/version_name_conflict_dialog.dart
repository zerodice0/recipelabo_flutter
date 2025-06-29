import 'package:flutter/material.dart';
import 'package:saucerer_flutter/core/config/app_colors.dart';

/// 버전명 충돌 시 사용자 선택을 위한 다이얼로그
class VersionNameConflictDialog extends StatefulWidget {
  final String conflictingVersionName;
  final VoidCallback onOverwrite;
  final Function(String newVersionName) onRename;
  final VoidCallback onCancel;

  const VersionNameConflictDialog({
    super.key,
    required this.conflictingVersionName,
    required this.onOverwrite,
    required this.onRename,
    required this.onCancel,
  });

  @override
  State<VersionNameConflictDialog> createState() => _VersionNameConflictDialogState();
}

class _VersionNameConflictDialogState extends State<VersionNameConflictDialog> {
  late final TextEditingController _newNameController;
  String _selectedOption = 'rename'; // 'overwrite' or 'rename'

  @override
  void initState() {
    super.initState();
    _newNameController = TextEditingController(
      text: '${widget.conflictingVersionName} (수정)',
    );
  }

  @override
  void dispose() {
    _newNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primaryOrange,
            size: 28,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              '버전명 중복',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textBrown,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 경고 메시지
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.primaryOrange.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.primaryOrange,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "'${widget.conflictingVersionName}' 버전명이 이미 존재합니다.",
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // 선택 옵션
          const Text(
            '어떻게 처리하시겠습니까?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textBrown,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // 덮어쓰기 옵션
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _selectedOption == 'overwrite' 
                    ? AppColors.primaryOrange 
                    : AppColors.textBrown.withValues(alpha: 0.3),
                width: _selectedOption == 'overwrite' ? 2 : 1,
              ),
              color: _selectedOption == 'overwrite' 
                  ? AppColors.primaryOrange.withValues(alpha: 0.05)
                  : null,
            ),
            child: RadioListTile<String>(
              value: 'overwrite',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              title: Text(
                '기존 버전 덮어쓰기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: _selectedOption == 'overwrite' 
                      ? AppColors.primaryOrange 
                      : AppColors.textBrown,
                ),
              ),
              subtitle: Text(
                '기존 "${widget.conflictingVersionName}" 버전을 삭제하고 새로운 내용으로 교체합니다.',
                style: const TextStyle(fontSize: 12),
              ),
              activeColor: AppColors.primaryOrange,
              dense: true,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // 새 이름 옵션
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _selectedOption == 'rename' 
                    ? AppColors.primaryOrange 
                    : AppColors.textBrown.withValues(alpha: 0.3),
                width: _selectedOption == 'rename' ? 2 : 1,
              ),
              color: _selectedOption == 'rename' 
                  ? AppColors.primaryOrange.withValues(alpha: 0.05)
                  : null,
            ),
            child: Column(
              children: [
                RadioListTile<String>(
                  value: 'rename',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                  title: Text(
                    '새로운 버전명 사용',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: _selectedOption == 'rename' 
                          ? AppColors.primaryOrange 
                          : AppColors.textBrown,
                    ),
                  ),
                  subtitle: const Text(
                    '다른 이름으로 새 버전을 생성합니다.',
                    style: TextStyle(fontSize: 12),
                  ),
                  activeColor: AppColors.primaryOrange,
                  dense: true,
                ),
                if (_selectedOption == 'rename') ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: TextFormField(
                      controller: _newNameController,
                      decoration: InputDecoration(
                        labelText: '새 버전명',
                        hintText: '예: 라볶이, 설탕 대체제',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.primaryOrange, width: 2),
                        ),
                      ),
                      maxLength: 50,
                      onChanged: (value) {
                        setState(() {}); // 버튼 상태 업데이트
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: widget.onCancel,
          child: Text(
            '취소',
            style: TextStyle(color: AppColors.textBrown.withValues(alpha: 0.7)),
          ),
        ),
        ElevatedButton(
          onPressed: _isConfirmEnabled() ? _onConfirm : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryOrange,
            foregroundColor: AppColors.warmWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            _selectedOption == 'overwrite' ? '덮어쓰기' : '새 버전 생성',
          ),
        ),
      ],
    );
  }

  bool _isConfirmEnabled() {
    if (_selectedOption == 'overwrite') return true;
    if (_selectedOption == 'rename') {
      return _newNameController.text.trim().isNotEmpty;
    }
    return false;
  }

  void _onConfirm() {
    if (_selectedOption == 'overwrite') {
      widget.onOverwrite();
    } else if (_selectedOption == 'rename') {
      final newName = _newNameController.text.trim();
      if (newName.isNotEmpty) {
        widget.onRename(newName);
      }
    }
  }
}

/// 정적 메서드로 다이얼로그를 쉽게 표시
class VersionNameConflictDialogs {
  static Future<T?> show<T>(
    BuildContext context, {
    required String conflictingVersionName,
    required VoidCallback onOverwrite,
    required Function(String newVersionName) onRename,
    required VoidCallback onCancel,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) => VersionNameConflictDialog(
        conflictingVersionName: conflictingVersionName,
        onOverwrite: () {
          Navigator.of(context).pop();
          onOverwrite();
        },
        onRename: (newName) {
          Navigator.of(context).pop();
          onRename(newName);
        },
        onCancel: () {
          Navigator.of(context).pop();
          onCancel();
        },
      ),
    );
  }
}