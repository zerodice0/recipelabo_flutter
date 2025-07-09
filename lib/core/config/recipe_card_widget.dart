import 'package:flutter/material.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

class RecipeCardWidget extends StatelessWidget {
  final RecipeEntity recipe;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final String? heroTag;

  const RecipeCardWidget({
    super.key,
    required this.recipe,
    this.onTap,
    this.onDelete,
    this.heroTag,
  });

  String _formatDate(DateTime dateTime) {
    return '${dateTime.year}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Hero(
        tag: heroTag ?? 'recipe_card_${recipe.id}',
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.getChipBackground(
              Theme.of(context).brightness == Brightness.dark,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.getChipBorder(
                Theme.of(context).brightness == Brightness.dark,
              ),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.getChipShadow(
                  Theme.of(context).brightness == Brightness.dark,
                ).withValues(alpha: 0.3),
                offset: const Offset(2, 2),
                blurRadius: 0,
              ),
            ],
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 헤더 행 (제목과 삭제 버튼)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          recipe.name,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900, // 더 두꺼운 폰트
                            color: AppColors.getPixelTextBrown(
                              Theme.of(context).brightness == Brightness.dark,
                            ),
                            fontSize: 18,
                            fontFamily: 'monospace', // 픽셀 아트 느낌의 폰트
                            letterSpacing: 0.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // 간단한 삭제 버튼
                      if (onDelete != null)
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          icon: Icon(
                            Icons.close,
                            color: AppColors.getPixelBrown(
                              Theme.of(context).brightness == Brightness.dark,
                            ),
                            size: 20,
                          ),
                          onPressed: onDelete,
                          tooltip: '삭제',
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 간단한 설명 텍스트
                  Text(
                    recipe.description?.isNotEmpty == true
                        ? recipe.description!
                        : AppLocalizations.of(context).recipeNoDescription,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.getPixelTextBrown(
                        Theme.of(context).brightness == Brightness.dark,
                      ).withValues(alpha: 0.8),
                      height: 1.4,
                      fontSize: 14,
                      fontStyle: recipe.description?.isNotEmpty == true
                          ? FontStyle.normal
                          : FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 16),

                  // 간단한 하단 정보
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 업데이트 날짜
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('⏰', style: TextStyle(fontSize: 12)),
                          const SizedBox(width: 4),
                          Text(
                            _formatDate(recipe.updatedAt),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.getPixelTextBrown(
                                Theme.of(context).brightness == Brightness.dark,
                              ).withValues(alpha: 0.7),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // 화살표
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.getPixelBrown(
                          Theme.of(context).brightness == Brightness.dark,
                        ),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
