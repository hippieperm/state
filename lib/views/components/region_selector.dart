import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/models/region.dart';
import 'package:state/view_models/region_view_model.dart';

class RegionSelector extends ConsumerWidget {
  const RegionSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regions = ref.watch(regionsProvider);
    final selectedRegion = ref.watch(selectedRegionProvider);
    final selectedSubRegion = ref.watch(selectedSubRegionProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 16, color: Color(0xFFFF7B8E)),
                  const SizedBox(width: 4),
                  Text(
                    '${selectedRegion.name} ${selectedSubRegion}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
              InkWell(
                onTap: () {
                  _showRegionSelectionDialog(context, ref);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.tune, size: 14, color: Colors.grey),
                      SizedBox(width: 2),
                      Text('지역 설정', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  // 지역 선택 다이얼로그 표시
  void _showRegionSelectionDialog(BuildContext context, WidgetRef ref) {
    final regions = ref.read(regionsProvider);
    final selectedRegion = ref.read(selectedRegionProvider);

    showDialog(
      context: context,
      builder: (context) {
        return RegionSelectionDialog(
          regions: regions,
          initialRegion: selectedRegion,
        );
      },
    );
  }
}

class RegionSelectionDialog extends ConsumerStatefulWidget {
  final List<Region> regions;
  final Region initialRegion;

  const RegionSelectionDialog({
    super.key,
    required this.regions,
    required this.initialRegion,
  });

  @override
  _RegionSelectionDialogState createState() => _RegionSelectionDialogState();
}

class _RegionSelectionDialogState extends ConsumerState<RegionSelectionDialog> {
  late Region _selectedRegion;
  late String _selectedSubRegion;

  @override
  void initState() {
    super.initState();
    _selectedRegion = widget.initialRegion;
    _selectedSubRegion = ref.read(selectedSubRegionProvider);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('지역 선택'),
      content: SizedBox(
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 지역 목록
            Expanded(
              flex: 2,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.regions.length,
                itemBuilder: (context, index) {
                  final region = widget.regions[index];
                  return ListTile(
                    dense: true,
                    title: Text(region.name),
                    selected: _selectedRegion.id == region.id,
                    selectedColor: const Color(0xFFFF7B8E),
                    onTap: () {
                      setState(() {
                        _selectedRegion = region;
                        _selectedSubRegion = region.subRegions.first;
                      });
                    },
                  );
                },
              ),
            ),
            // 구분선
            const VerticalDivider(),
            // 하위 지역 목록
            Expanded(
              flex: 3,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _selectedRegion.subRegions.length,
                itemBuilder: (context, index) {
                  final subRegion = _selectedRegion.subRegions[index];
                  return ListTile(
                    dense: true,
                    title: Text(subRegion),
                    selected: _selectedSubRegion == subRegion,
                    selectedColor: const Color(0xFFFF7B8E),
                    onTap: () {
                      setState(() {
                        _selectedSubRegion = subRegion;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () {
            ref.read(selectedRegionProvider.notifier).state = _selectedRegion;
            ref.read(selectedSubRegionProvider.notifier).state =
                _selectedSubRegion;
            Navigator.pop(context);
          },
          child: const Text('확인'),
        ),
      ],
    );
  }
}
