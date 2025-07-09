import 'package:flutter/material.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

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

  /// 카테고리 문자열을 다국어로 번역하는 헬퍼 함수
  String _getCategoryDisplayNameFromString(
    String categoryId,
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(context);

    // categoryId 기반으로 다국어 표시명 반환
    switch (categoryId) {
      case 'ingredient':
        return l10n.generalCategoryIngredient;
      case 'unit':
        return l10n.generalCategoryUnit;
      case 'seasoning':
        return l10n.generalCategorySeasoning;
      case 'vegetable':
        return l10n.generalCategoryVegetable;
      case 'meat':
        return l10n.generalCategoryMeat;
      case 'seafood':
        return l10n.generalCategorySeafood;
      case 'dairy':
        return l10n.generalCategoryDairy;
      case 'grain':
        return l10n.generalCategoryGrain;
      default:
        // fallback: 원본 문자열 사용
        return categoryId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).seasoningCreateTitle),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 재료/단위 이름
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(
                    context,
                  ).seasoningCreateNameLabel,
                  hintText: AppLocalizations.of(
                    context,
                  ).seasoningCreateNameHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppLocalizations.of(
                      context,
                    ).seasoningCreateNameRequired;
                  }
                  return null;
                },
                autofocus: true,
              ),

              const SizedBox(height: 16),

              // 카테고리 선택
              Text(
                AppLocalizations.of(context).seasoningCategoryLabel,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              if (widget.categories.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    ...widget.categories.map((category) {
                      return FilterChip(
                        label: Text(
                          _getCategoryDisplayNameFromString(category, context),
                        ),
                        selected:
                            _selectedCategory == category && !_isCustomCategory,
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
                    // FilterChip(
                    //   label: Text(
                    //     AppLocalizations.of(context).seasoningCreateNewCategory,
                    //   ),
                    //   selected: _isCustomCategory,
                    //   onSelected: (selected) {
                    //     setState(() {
                    //       _isCustomCategory = selected;
                    //       if (selected) {
                    //         _selectedCategory = null;
                    //       } else {
                    //         _categoryController.clear();
                    //       }
                    //     });
                    //   },
                    // ),
                  ],
                ),
                const SizedBox(height: 8),
              ],

              if (_isCustomCategory || widget.categories.isEmpty) ...[
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(
                      context,
                    ).seasoningCreateNewCategory,
                    hintText: AppLocalizations.of(
                      context,
                    ).seasoningCreateCategoryHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // 설명 (선택사항)
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(
                    context,
                  ).seasoningCreateDescriptionLabel,
                  hintText: AppLocalizations.of(
                    context,
                  ).seasoningCreateDescriptionHint,
                  border: const OutlineInputBorder(),
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
          child: Text(AppLocalizations.of(context).actionCancel),
        ),
        ElevatedButton(
          onPressed: _saveSeasoning,
          child: Text(AppLocalizations.of(context).seasoningCreateTitle),
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
