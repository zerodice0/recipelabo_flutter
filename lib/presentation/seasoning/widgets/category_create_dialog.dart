import 'package:flutter/material.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

class CategoryCreateDialog extends StatefulWidget {
  final Function(String name, String? description, String? iconCode) onSave;

  const CategoryCreateDialog({super.key, required this.onSave});

  @override
  State<CategoryCreateDialog> createState() => _CategoryCreateDialogState();
}

class _CategoryCreateDialogState extends State<CategoryCreateDialog> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _selectedIcon;

  // 사용 가능한 아이콘 목록
  final List<Map<String, String>> _availableIcons = [
    {'code': 'category', 'name': '카테고리'},
    {'code': 'dining', 'name': '식사'},
    {'code': 'kitchen', 'name': '주방'},
    {'code': 'local_dining', 'name': '음식'},
    {'code': 'restaurant_menu', 'name': '메뉴'},
    {'code': 'bakery_dining', 'name': '베이커리'},
    {'code': 'fastfood', 'name': '패스트푸드'},
    {'code': 'icecream', 'name': '아이스크림'},
    {'code': 'coffee', 'name': '커피'},
    {'code': 'wine_bar', 'name': '음료'},
    {'code': 'set_meal', 'name': '정식'},
    {'code': 'ramen_dining', 'name': '라면'},
    {'code': 'lunch_dining', 'name': '점심'},
    {'code': 'breakfast_dining', 'name': '아침'},
    {'code': 'dinner_dining', 'name': '저녁'},
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).categoryCreateTitle),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 카테고리 이름
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(
                      context,
                    ).categoryCreateNameLabel,
                    hintText: AppLocalizations.of(
                      context,
                    ).categoryCreateNameHint,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      ).categoryCreateNameRequired;
                    }
                    return null;
                  },
                  autofocus: true,
                ),

                const SizedBox(height: 16),

                // 아이콘 선택
                Text(
                  AppLocalizations.of(context).categoryCreateIconLabel,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: _availableIcons.length,
                    itemBuilder: (context, index) {
                      final icon = _availableIcons[index];
                      final isSelected = _selectedIcon == icon['code'];

                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIcon = isSelected ? null : icon['code'];
                          });
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primaryContainer
                                : null,
                            borderRadius: BorderRadius.circular(8),
                            border: isSelected
                                ? Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: Icon(
                            _getIconData(icon['code']!),
                            color: isSelected
                                ? Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // 설명 (선택사항)
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(
                      context,
                    ).categoryCreateDescriptionLabel,
                    hintText: AppLocalizations.of(
                      context,
                    ).categoryCreateDescriptionHint,
                    border: const OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).actionCancel),
        ),
        ElevatedButton(
          onPressed: _saveCategory,
          child: Text(AppLocalizations.of(context).actionCreate),
        ),
      ],
    );
  }

  IconData _getIconData(String iconCode) {
    switch (iconCode) {
      case 'category':
        return Icons.category;
      case 'dining':
        return Icons.dining;
      case 'kitchen':
        return Icons.kitchen;
      case 'local_dining':
        return Icons.local_dining;
      case 'restaurant_menu':
        return Icons.restaurant_menu;
      case 'bakery_dining':
        return Icons.bakery_dining;
      case 'fastfood':
        return Icons.fastfood;
      case 'icecream':
        return Icons.icecream;
      case 'coffee':
        return Icons.coffee;
      case 'wine_bar':
        return Icons.wine_bar;
      case 'set_meal':
        return Icons.set_meal;
      case 'ramen_dining':
        return Icons.ramen_dining;
      case 'lunch_dining':
        return Icons.lunch_dining;
      case 'breakfast_dining':
        return Icons.breakfast_dining;
      case 'dinner_dining':
        return Icons.dinner_dining;
      default:
        return Icons.category;
    }
  }

  void _saveCategory() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();

    widget.onSave(
      name,
      description.isEmpty ? null : description,
      _selectedIcon,
    );

    Navigator.of(context).pop();
  }
}
