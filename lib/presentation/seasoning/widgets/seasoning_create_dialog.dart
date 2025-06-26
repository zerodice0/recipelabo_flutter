import 'package:flutter/material.dart';

class SeasoningCreateDialog extends StatefulWidget {
  final List<String> categories;
  final Function(String name, String? category, String? description) onSave;

  const SeasoningCreateDialog({
    super.key,
    required this.categories,
    required this.onSave,
  });

  @override
  State<SeasoningCreateDialog> createState() => _SeasoningCreateDialogState();
}

class _SeasoningCreateDialogState extends State<SeasoningCreateDialog> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  String? _selectedCategory;
  bool _isCustomCategory = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('조미료 추가'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 조미료 이름
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '조미료 이름',
                  hintText: '예: 소금, 설탕, 간장 등',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '조미료 이름을 입력해주세요';
                  }
                  return null;
                },
                autofocus: true,
              ),
              
              const SizedBox(height: 16),
              
              // 카테고리 선택
              Text(
                '카테고리',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              
              if (widget.categories.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    ...widget.categories.map((category) {
                      return FilterChip(
                        label: Text(category),
                        selected: _selectedCategory == category && !_isCustomCategory,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _selectedCategory = category;
                              _isCustomCategory = false;
                              _categoryController.clear();
                            } else {
                              _selectedCategory = null;
                            }
                          });
                        },
                      );
                    }),
                    FilterChip(
                      label: const Text('새 카테고리'),
                      selected: _isCustomCategory,
                      onSelected: (selected) {
                        setState(() {
                          _isCustomCategory = selected;
                          if (selected) {
                            _selectedCategory = null;
                          } else {
                            _categoryController.clear();
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              
              if (_isCustomCategory || widget.categories.isEmpty) ...[
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                    labelText: '새 카테고리',
                    hintText: '예: 기본양념, 특수양념, 향신료 등',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              
              // 설명 (선택사항)
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: '설명 (선택사항)',
                  hintText: '조미료에 대한 간단한 설명',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: _saveSeasoning,
          child: const Text('추가'),
        ),
      ],
    );
  }

  void _saveSeasoning() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();
    String? category;

    if (_isCustomCategory && _categoryController.text.trim().isNotEmpty) {
      category = _categoryController.text.trim();
    } else if (!_isCustomCategory && _selectedCategory != null) {
      category = _selectedCategory;
    }

    widget.onSave(
      name,
      category?.isEmpty == true ? null : category,
      description.isEmpty ? null : description,
    );

    Navigator.of(context).pop();
  }
}