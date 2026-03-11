import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'presentation/providers/tasks_management_providers.dart';

class AssignmentDeliveriesDialog extends ConsumerStatefulWidget {
  final String courseSlug;
  final String assignmentId;

  const AssignmentDeliveriesDialog({
    super.key,
    required this.courseSlug,
    required this.assignmentId,
  });

  @override
  ConsumerState<AssignmentDeliveriesDialog> createState() => _AssignmentDeliveriesDialogState();
}

class _AssignmentDeliveriesDialogState extends ConsumerState<AssignmentDeliveriesDialog> {
  String? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    final deliveriesAsync = ref.watch(
      assignmentDeliveriesProvider(
        courseSlug: widget.courseSlug,
        assignmentId: widget.assignmentId,
        status: _selectedStatus,
      ),
    );

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '배포 결과 조회',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('상태 필터: ', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                DropdownButton<String?>(
                  value: _selectedStatus,
                  items: const [
                    DropdownMenuItem(value: null, child: Text('전체')),
                    DropdownMenuItem(value: 'QUEUED', child: Text('QUEUED')),
                    DropdownMenuItem(value: 'DELIVERED', child: Text('DELIVERED')),
                    DropdownMenuItem(value: 'FAILED', child: Text('FAILED')),
                    DropdownMenuItem(value: 'CANCELED', child: Text('CANCELED')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: deliveriesAsync.when(
                data: (deliveries) {
                  if (deliveries.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text('배포된 과제가 없습니다.', style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: deliveries.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final delivery = deliveries[index];

                      DateTime? deliveredDate;
                      if (delivery.deliveredAt != null) {
                        deliveredDate = DateTime.tryParse(delivery.deliveredAt!)?.toLocal();
                      }

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _getStatusColor(delivery.status),
                          child: Icon(
                            _getStatusIcon(delivery.status),
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        title: Text(
                          delivery.userId,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('상태: ${delivery.status}'),
                            if (deliveredDate != null)
                              Text('일시: ${DateFormat('yyyy-MM-dd HH:mm').format(deliveredDate)}'),
                            if (delivery.failureReason != null)
                              Text(
                                '오류: ${delivery.failureReason}',
                                style: const TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, stack) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text('오류가 발생했습니다: $error', style: const TextStyle(color: Colors.red)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'DELIVERED':
        return Colors.green;
      case 'FAILED':
        return Colors.red;
      case 'QUEUED':
        return Colors.blue;
      case 'CANCELED':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'DELIVERED':
        return Icons.check;
      case 'FAILED':
        return Icons.error_outline;
      case 'QUEUED':
        return Icons.hourglass_empty;
      case 'CANCELED':
        return Icons.cancel_outlined;
      default:
        return Icons.info_outline;
    }
  }
}
