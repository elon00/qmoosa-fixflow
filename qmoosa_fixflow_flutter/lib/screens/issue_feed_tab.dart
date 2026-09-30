import 'package:flutter/material.dart';
import 'package:qmoosa_fixflow_client/qmoosa_fixflow_client.dart';
import '../state/app_state.dart';
import '../widgets/priority_badge.dart';
import '../widgets/status_badge.dart';
import 'issue_detail_screen.dart';

class IssueFeedTab extends StatefulWidget {
  const IssueFeedTab({super.key});

  @override
  State<IssueFeedTab> createState() => _IssueFeedTabState();
}

class _IssueFeedTabState extends State<IssueFeedTab> {
  String _selectedFilter = 'ALL';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState(),
      builder: (context, _) {
        final state = AppState();
        final allIssues = state.issues;

        final filteredIssues = allIssues.where((issue) {
          if (_selectedFilter != 'ALL' &&
              issue.status.toUpperCase() != _selectedFilter) {
            return false;
          }
          if (_searchQuery.isNotEmpty) {
            final q = _searchQuery.toLowerCase();
            return issue.title.toLowerCase().contains(q) ||
                issue.description.toLowerCase().contains(q) ||
                issue.category.toLowerCase().contains(q) ||
                issue.locationName.toLowerCase().contains(q);
          }
          return true;
        }).toList();

        return Column(
          children: [
            // Filter and Search Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              color: Theme.of(context).cardColor,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            'Search issues by title, category, or location...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (v) => setState(() => _searchQuery = v.trim()),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildFilterChip('ALL', 'All (${allIssues.length})'),
                      _buildFilterChip(
                        'OPEN',
                        'Open (${allIssues.where((i) => i.status == "OPEN").length})',
                      ),
                      _buildFilterChip(
                        'IN_PROGRESS',
                        'In Progress (${allIssues.where((i) => i.status == "IN_PROGRESS").length})',
                      ),
                      _buildFilterChip(
                        'AWAITING_VERIFICATION',
                        'Verify (${allIssues.where((i) => i.status == "AWAITING_VERIFICATION").length})',
                      ),
                      _buildFilterChip(
                        'RESOLVED',
                        'Resolved (${allIssues.where((i) => i.status == "RESOLVED").length})',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Issue List Content
            Expanded(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.errorMessage != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cloud_off,
                            size: 48,
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 12),
                          Text(state.errorMessage!),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => state.fetchIssues(),
                            child: const Text('Retry Connection'),
                          ),
                        ],
                      ),
                    )
                  : filteredIssues.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 56,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No issues match the current filter.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => state.fetchIssues(),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: filteredIssues.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (ctx, i) {
                          final issue = filteredIssues[i];
                          return _buildIssueCard(issue);
                        },
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterChip(String key, String label) {
    final isSelected = _selectedFilter == key;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => setState(() => _selectedFilter = key),
      selectedColor: Colors.indigo.withOpacity(0.18),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? Colors.indigo : null,
      ),
    );
  }

  Widget _buildIssueCard(Issue issue) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => IssueDetailScreen(issue: issue),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail if available
              if (issue.beforePhotoUrl != null &&
                  issue.beforePhotoUrl!.isNotEmpty)
                Container(
                  width: 72,
                  height: 72,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      issue.beforePhotoUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              // Center Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '#${issue.id}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        PriorityBadge(priority: issue.priority),
                        const SizedBox(width: 8),
                        Text(
                          issue.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      issue.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      issue.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          issue.locationName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const Spacer(),
                        if (issue.assignedUserName != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.assignment_ind_outlined,
                                size: 14,
                                color: Colors.indigo,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                issue.assignedUserName!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Status Badge
              StatusBadge(status: issue.status),
            ],
          ),
        ),
      ),
    );
  }
}
