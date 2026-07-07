import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipick_flutter/core/config/local_user_policy.dart';
import 'package:recipick_flutter/presentation/cooking_log/create/viewmodel/cooking_log_create_viewmodel.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

class CookingLogCreateScreen extends ConsumerStatefulWidget {
  final String recipeVersionId;
  final String recipeName;
  final String versionName;

  const CookingLogCreateScreen({
    super.key,
    required this.recipeVersionId,
    required this.recipeName,
    required this.versionName,
  });

  @override
  ConsumerState<CookingLogCreateScreen> createState() =>
      _CookingLogCreateScreenState();
}

class _CookingLogCreateScreenState
    extends ConsumerState<CookingLogCreateScreen> {
  final _titleController = TextEditingController();
  final _memoController = TextEditingController();
  final _failureReasonController = TextEditingController();
  final _nextAdjustmentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _memoController.dispose();
    _failureReasonController.dispose();
    _nextAdjustmentController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.year}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')}';
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _selectDateTime() async {
    final state = ref.read(cookingLogCreateViewModelProvider);
    final currentDate = state.cookedAt ?? DateTime.now();

    final date = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(currentDate),
      );

      if (time != null) {
        final dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        ref
            .read(cookingLogCreateViewModelProvider.notifier)
            .updateCookedAt(dateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cookingLogCreateViewModelProvider);
    final viewModel = ref.read(cookingLogCreateViewModelProvider.notifier);

    ref.listen<CookingLogCreateState>(cookingLogCreateViewModelProvider, (
      previous,
      next,
    ) {
      if (next.isSaved) {
        context.pop(true);
      }
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: Colors.red),
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).cookingLogWrite),
          actions: [
            if (state.isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    viewModel.updateTitle(_titleController.text);
                    viewModel.updateMemo(_memoController.text);
                    viewModel.updateFailureReason(
                      _failureReasonController.text,
                    );
                    viewModel.updateNextAdjustment(
                      _nextAdjustmentController.text,
                    );

                    await viewModel.saveCookingLog(
                      widget.recipeVersionId,
                      LocalUserPolicy.localUserId,
                    );
                  }
                },
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRecipeInfo(),
                const SizedBox(height: 24),
                _buildTitleField(),
                const SizedBox(height: 16),
                _buildDateTimeField(state),
                const SizedBox(height: 16),
                _buildImageSection(state, viewModel),
                const SizedBox(height: 16),
                _buildTasteEvaluationSection(state, viewModel),
                const SizedBox(height: 16),
                _buildMemoField(),
                const SizedBox(height: 16),
                _buildExperimentFields(viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).cookingLogRecipeInfo,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.recipeName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              widget.versionName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).cookingLogTitleRequired,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).cookingLogTitleHint,
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return AppLocalizations.of(context).cookingLogTitleRequired;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDateTimeField(CookingLogCreateState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).cookingLogDateTime,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _selectDateTime,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    state.cookedAt != null
                        ? '${_formatDate(state.cookedAt!)} ${_formatTime(state.cookedAt!)}'
                        : AppLocalizations.of(context).cookingLogSelectDateTime,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection(
    CookingLogCreateState state,
    CookingLogCreateViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).cookingLogPhoto,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: state.base64EncodedImageData != null
              ? _buildSelectedImage(state.base64EncodedImageData!, viewModel)
              : _buildImagePlaceholder(viewModel),
        ),
      ],
    );
  }

  Widget _buildSelectedImage(
    String base64EncodedImageData,
    CookingLogCreateViewModel viewModel,
  ) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: _buildImageWidget(base64EncodedImageData),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => viewModel.removeImage(),
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () => _showImageSourceDialog(viewModel),
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder(CookingLogCreateViewModel viewModel) {
    return InkWell(
      onTap: () => _showImageSourceDialog(viewModel),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            size: 48,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).cookingLogAddPhoto,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showImageSourceDialog(CookingLogCreateViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(AppLocalizations.of(context).cookingLogTakePhoto),
                onTap: () {
                  context.pop();
                  viewModel.pickImageFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  AppLocalizations.of(context).cookingLogSelectFromGallery,
                ),
                onTap: () {
                  context.pop();
                  viewModel.pickImageFromGallery();
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  /// Base64 데이터와 파일 경로를 모두 지원하는 이미지 위젯
  Widget _buildImageWidget(String base64EncodedImageData) {
    // Base64 문자열인지 확인
    try {
      // Base64 데이터 디코딩
      final bytes = base64Decode(base64EncodedImageData);

      return Image.memory(
        bytes,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
      );
    } catch (e) {
      // Base64 디코딩 실패 시 에러 이미지 표시
      return _buildErrorImage();
    }
  }

  /// 에러 이미지 위젯
  Widget _buildErrorImage() {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.broken_image,
        size: 48,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _buildMemoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).cookingLogMemo,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _memoController,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).cookingLogMemoHint,
            border: const OutlineInputBorder(),
          ),
          maxLines: 5,
        ),
      ],
    );
  }

  Widget _buildTasteEvaluationSection(
    CookingLogCreateState state,
    CookingLogCreateViewModel viewModel,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '맛 평가',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildRatingSlider(
              label: '전체 만족도',
              value: state.overallRating,
              onChanged: viewModel.updateOverallRating,
            ),
            _buildRatingSlider(
              label: '짠맛',
              value: state.saltinessRating,
              onChanged: viewModel.updateSaltinessRating,
            ),
            _buildRatingSlider(
              label: '단맛',
              value: state.sweetnessRating,
              onChanged: viewModel.updateSweetnessRating,
            ),
            _buildRatingSlider(
              label: '매운맛',
              value: state.spicinessRating,
              onChanged: viewModel.updateSpicinessRating,
            ),
            _buildRatingSlider(
              label: '감칠맛',
              value: state.umamiRating,
              onChanged: viewModel.updateUmamiRating,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSlider({
    required String label,
    required int value,
    required ValueChanged<int> onChanged,
  }) {
    final displayValue = value == 0 ? '미입력' : '$value/5';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 84,
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: Slider(
              value: value.toDouble(),
              min: 0,
              max: 5,
              divisions: 5,
              label: displayValue,
              onChanged: (newValue) => onChanged(newValue.round()),
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              displayValue,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperimentFields(CookingLogCreateViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '실험 결과',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _failureReasonController,
          decoration: const InputDecoration(
            hintText: '실패하거나 아쉬웠던 이유',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
          onChanged: viewModel.updateFailureReason,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _nextAdjustmentController,
          decoration: const InputDecoration(
            hintText: '다음에 바꿔볼 양념/재료/조리 방법',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
          onChanged: viewModel.updateNextAdjustment,
        ),
      ],
    );
  }
}
