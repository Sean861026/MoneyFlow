import 'package:flutter/material.dart';

void main() {
  runApp(const MoneyFlowApp());
}

class MoneyFlowApp extends StatelessWidget {
  const MoneyFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

enum AppLanguage { zh, en }

class CategoryOption {
  const CategoryOption(this.key, this.en, this.zh);
  final String key;
  final String en;
  final String zh;
}

const List<CategoryOption> kCategoryOptions = [
  CategoryOption('salary', 'Salary', '\u85aa\u6c34'),
  CategoryOption('food', 'Food', '\u9910\u98f2'),
  CategoryOption('transport', 'Transport', '\u4ea4\u901a'),
  CategoryOption('fun', 'Entertainment', '\u5a1b\u6a02'),
  CategoryOption('home', 'Home', '\u5c45\u5bb6'),
  CategoryOption('health', 'Health', '\u91ab\u7642'),
  CategoryOption('misc', 'Misc', '\u5176\u4ed6'),
  CategoryOption('investment', 'Investment', '\u6295\u8cc7'),
  CategoryOption('bonus', 'Bonus', '\u734e\u91d1'),
];

enum TransactionType { income, expense }

class TransactionEntry {
  const TransactionEntry({
    required this.id,
    required this.categoryKey,
    required this.note,
    required this.amount,
    required this.date,
    required this.type,
  });

  final String id;
  final String categoryKey;
  final String note;
  final double amount;
  final DateTime date;
  final TransactionType type;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppLanguage _lang = AppLanguage.zh;

  final List<TransactionEntry> _entries = [
    TransactionEntry(
      id: 'tx-1',
      categoryKey: 'salary',
      note: '\u6708\u85aa',
      amount: 62000,
      date: DateTime.now().subtract(const Duration(days: 2)),
      type: TransactionType.income,
    ),
    TransactionEntry(
      id: 'tx-2',
      categoryKey: 'food',
      note: '\u5348\u9910',
      amount: 250,
      date: DateTime.now(),
      type: TransactionType.expense,
    ),
    TransactionEntry(
      id: 'tx-3',
      categoryKey: 'transport',
      note: '\u6377\u904b',
      amount: 60,
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: TransactionType.expense,
    ),
    TransactionEntry(
      id: 'tx-4',
      categoryKey: 'investment',
      note: '\u80a1\u606f',
      amount: 1500,
      date: DateTime.now().subtract(const Duration(days: 5)),
      type: TransactionType.income,
    ),
  ];

  DateTime _visibleMonth = DateTime(DateTime.now().year, DateTime.now().month);

    String _t(String key) {
    const zh = {
      'title': 'MoneyFlow \u8a18\u5e33',
      'income': '\u6536\u5165',
      'expense': '\u652f\u51fa',
      'balance': '\u7d50\u9918',
      'addRecord': '\u65b0\u589e\u8a18\u9304',
      'noRecords': '\u672c\u6708\u5c1a\u7121\u8a18\u9304\uff0c\u9ede\u53f3\u4e0b\u89d2\u65b0\u589e\u3002',
      'notePlaceholder': '\u7121\u5099\u8a3b',
      'category': '\u5206\u985e',
      'amount': '\u91d1\u984d',
      'note': '\u5099\u8a3b',
      'validAmount': '\u8acb\u8f38\u5165\u6709\u6548\u91d1\u984d',
      'date': '\u65e5\u671f',
      'expenseLabel': '\u652f\u51fa',
      'incomeLabel': '\u6536\u5165',
      'languageToggle': '\u5207\u63db\u4e2d/EN',
      'installment': '\u5206\u671f',
      'installmentPeriods': '\u671f\u6578',
      'installmentPeriodError': '\u671f\u6578\u81f3\u5c11 2 \u671f',
      'installmentPer': '\u6bcf\u671f',
      'installmentLabel': '\u5206\u671f',
      'edit': '\u7de8\u8f2f',
      'delete': '\u522a\u9664',
      'deleteConfirm': '\u522a\u9664\u6b64\u7d00\u9304\uff1f',
      'cancel': '\u53d6\u6d88',
      'installmentPage': '\u5206\u671f\u7d00\u9304',
      'installmentEmpty': '\u76ee\u524d\u6c92\u6709\u5206\u671f\u7d00\u9304',
      'periodsLabel': '\u671f\u6578',
      'paidPeriods': '\u5df2\u7e73\u671f\u6578',
      'remainingPeriods': '\u5269\u9918\u671f\u6578',
      'paidAmount': '\u5df2\u7e73\u91d1\u984d',
      'unpaidAmount': '\u672a\u7e73\u91d1\u984d',
    };
    const en = {
      'title': 'MoneyFlow Bookkeeper',
      'income': 'Income',
      'expense': 'Expense',
      'balance': 'Balance',
      'addRecord': 'Add record',
      'noRecords': 'No records this month. Tap + to add one.',
      'notePlaceholder': 'No note',
      'category': 'Category',
      'amount': 'Amount',
      'note': 'Note',
      'validAmount': 'Enter a valid amount',
      'date': 'Date',
      'expenseLabel': 'Expense',
      'incomeLabel': 'Income',
      'languageToggle': 'Switch EN/\u4e2d',
      'installment': 'Installment',
      'installmentPeriods': 'Periods',
      'installmentPeriodError': 'Use at least 2 periods',
      'installmentPer': 'Per period',
      'installmentLabel': 'Installment',
      'edit': 'Edit',
      'delete': 'Delete',
      'deleteConfirm': 'Delete this record?',
      'cancel': 'Cancel',
      'installmentPage': 'Installments',
      'installmentEmpty': 'No installments yet.',
      'periodsLabel': 'Periods',
      'paidPeriods': 'Paid periods',
      'remainingPeriods': 'Remaining periods',
      'paidAmount': 'Paid amount',
      'unpaidAmount': 'Unpaid amount',
    };
    final map = _lang == AppLanguage.zh ? zh : en;
    return map[key] ?? key;
  }

  String _formatMonth(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    if (_lang == AppLanguage.zh) {
      return '${date.year} \u5e74 $month \u6708';
    }
    return '${date.year} / $month';
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$month/$day';
  }

  String _formatAmount(double value) {
    final sign = value.isNegative ? '-' : '';
    final digits = value.abs().round().toString();
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      final reversedIndex = digits.length - i - 1;
      buffer.write(digits[i]);
      if (reversedIndex % 3 == 0 && i != digits.length - 1) {
        buffer.write(',');
      }
    }
    return '$sign$buffer';
  }

  List<TransactionEntry> get _visibleEntries {
    final filtered = _entries
        .where((entry) =>
            entry.date.year == _visibleMonth.year &&
            entry.date.month == _visibleMonth.month)
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    return filtered;
  }

  double get _incomeTotal => _visibleEntries
      .where((e) => e.type == TransactionType.income)
      .fold(0, (prev, entry) => prev + entry.amount);

  double get _expenseTotal => _visibleEntries
      .where((e) => e.type == TransactionType.expense)
      .fold(0, (prev, entry) => prev + entry.amount);

  String _categoryLabel(String key) {
    final match = kCategoryOptions.firstWhere(
      (c) => c.key == key,
      orElse: () => kCategoryOptions.first,
    );
    return _lang == AppLanguage.zh ? match.zh : match.en;
  }

  bool _isInstallmentEntry(TransactionEntry entry) {
    return entry.note.contains(_t('installmentLabel')) ||
        entry.note.contains('\u5206\u671f') ||
        entry.note.contains('Installment');
  }

  void _changeMonth(int offset) {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + offset);
    });
  }

  void _toggleLanguage() {
    setState(() {
      _lang = _lang == AppLanguage.zh ? AppLanguage.en : AppLanguage.zh;
    });
  }

  void _openInstallmentPage() {
    final installments = _entries.where(_isInstallmentEntry).toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InstallmentPage(
          entries: installments,
          t: _t,
          formatAmount: _formatAmount,
          formatDate: _formatDate,
          categoryLabel: _categoryLabel,
          entriesProvider: () => _entries,
          onEdit: (entry) => _openEntrySheet(initial: entry),
          onDeleteGroup: _deleteInstallmentGroup,
        ),
      ),
    );
  }

  Future<void> _deleteInstallmentGroup(List<TransactionEntry> group) async {
    if (group.isEmpty) return;
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(_t('delete')),
        content: Text(_t('deleteConfirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(_t('cancel')),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(_t('delete')),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (result == true) {
      setState(() {
        final prefix = group.first.id.contains('-')
            ? group.first.id.split('-').first
            : group.first.id;
        _entries.removeWhere((e) => e.id == prefix || e.id.startsWith('$prefix-'));
      });
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }
  }

  Future<void> _confirmDelete(TransactionEntry entry) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(_t('delete')),
          content: Text(_t('deleteConfirm')),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(_t('cancel')),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(_t('delete')),
            ),
          ],
        );
      },
    );
    if (!mounted) return;
    if (result == true) {
      setState(() {
        _entries.removeWhere((e) => e.id == entry.id);
      });
    }
  }

  Future<void> _openEntrySheet({TransactionEntry? initial}) {
    String baseNoteFromInstallment(String note) {
      const separator = ' · ';
      if (note.contains(separator)) {
        final parts = note.split(separator);
        if (parts.length > 1) {
          return parts.sublist(1).join(separator).trim();
        }
      }
      return '';
    }

    final bool editingInstallment =
        initial != null && _isInstallmentEntry(initial);
    double? prefillTotalAmount;
    int? prefillPeriods;
    DateTime? prefillDate;
    String? prefillNote;

    if (editingInstallment && initial != null) {
      final prefix =
          initial.id.contains('-') ? initial.id.split('-').first : initial.id;
      final group = _entries
          .where((e) => e.id == prefix || e.id.startsWith('$prefix-'))
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
      if (group.isNotEmpty) {
        prefillTotalAmount =
            group.fold<double>(0, (sum, e) => sum + e.amount);
        prefillPeriods = group.length;
        prefillDate = group.first.date;
        prefillNote = baseNoteFromInstallment(initial.note);
      }
    }

    return showModalBottomSheet<List<TransactionEntry>>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        final formKey = GlobalKey<FormState>();
        final amountController = TextEditingController(
            text: (prefillTotalAmount ?? initial?.amount)?.toString() ?? '');
        final noteController =
            TextEditingController(text: prefillNote ?? initial?.note ?? '');
        TransactionType type = initial?.type ?? TransactionType.expense;
        String categoryKey = initial?.categoryKey ?? 'food';
        DateTime selectedDate = prefillDate ?? initial?.date ?? DateTime.now();
        bool isInstallment = editingInstallment;
        int periods = prefillPeriods ?? 3;
        final periodsController = TextEditingController(text: periods.toString());

        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
          ),
          child: StatefulBuilder(
            builder: (ctx, setSheetState) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _t('addRecord'),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(ctx),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SegmentedButton<TransactionType>(
                      segments: [
                        ButtonSegment(
                          value: TransactionType.expense,
                          label: Text(_t('expenseLabel')),
                          icon: const Icon(Icons.arrow_downward),
                        ),
                        ButtonSegment(
                          value: TransactionType.income,
                          label: Text(_t('incomeLabel')),
                          icon: const Icon(Icons.arrow_upward),
                        ),
                      ],
                      selected: {type},
                      onSelectionChanged: (values) {
                        setSheetState(() {
                          type = values.first;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: categoryKey,
                      decoration: InputDecoration(
                        labelText: _t('category'),
                        border: const OutlineInputBorder(),
                      ),
                      items: kCategoryOptions
                          .map(
                            (c) => DropdownMenuItem(
                              value: c.key,
                              child:
                                  Text(_lang == AppLanguage.zh ? c.zh : c.en),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setSheetState(() {
                            categoryKey = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: _t('amount'),
                        prefixText: 'NT\$ ',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final parsed = double.tryParse(value ?? '');
                        if (parsed == null || parsed <= 0) {
                          return _t('validAmount');
                        }
                        return null;
                      },
                    ),
                    SwitchListTile.adaptive(
                      value: isInstallment,
                      contentPadding: EdgeInsets.zero,
                      title: Text(_t('installment')),
                      onChanged: (value) {
                        setSheetState(() {
                          isInstallment = value;
                        });
                      },
                    ),
                    if (isInstallment) ...[
                      TextFormField(
                        controller: periodsController,
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: false, decimal: false),
                        decoration: InputDecoration(
                          labelText: _t('installmentPeriods'),
                          suffixText: _lang == AppLanguage.zh ? '\u671f' : 'mo',
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setSheetState(() {
                            periods = int.tryParse(value) ?? periods;
                          });
                        },
                        validator: (value) {
                          if (!isInstallment) return null;
                          final parsed = int.tryParse(value ?? '');
                          if (parsed == null || parsed < 2) {
                            return _t('installmentPeriodError');
                          }
                          return null;
                        },
                      ),
                      Builder(
                        builder: (_) {
                          final amt = double.tryParse(amountController.text.trim());
                          final perCount = int.tryParse(periodsController.text.trim()) ?? periods;
                          if (amt == null || perCount <= 0) {
                            return const SizedBox.shrink();
                          }
                          final per = amt / perCount;
                          return Padding(
                            padding: const EdgeInsets.only(top: 6, left: 4),
                            child: Text(
                              '${_t('installmentPer')} NT\$${_formatAmount(per)}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        },
                      ),
                    ],
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: noteController,
                      decoration: InputDecoration(
                        labelText: _t('note'),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final picked = await showDatePicker(
                                context: ctx,
                                initialDate: selectedDate,
                                firstDate: DateTime(DateTime.now().year - 2),
                                lastDate: DateTime(DateTime.now().year + 2),
                              );
                              if (!ctx.mounted) return;
                              if (picked != null) {
                                setSheetState(() {
                                  selectedDate = picked;
                                });
                              }
                            },
                            icon: const Icon(Icons.calendar_today),
                            label: Text(
                              '${_t('date')}: ${_formatDate(selectedDate)}',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          double amount = double.parse(amountController.text.trim());
                          amount = amount.roundToDouble();
                          final note = noteController.text.trim();
                          final entries = <TransactionEntry>[];
                          final baseId = initial != null
                              ? (initial.id.contains('-')
                                  ? initial.id.split('-').first
                                  : initial.id)
                              : DateTime.now().microsecondsSinceEpoch.toString();
                          if (isInstallment) {
                            final parsedPeriods =
                                int.tryParse(periodsController.text.trim()) ?? periods;
                            final totalPeriods = parsedPeriods < 2 ? 2 : parsedPeriods;
                            final totalUnits = amount.round();
                            final baseUnits = totalUnits ~/ totalPeriods;
                            final remainder = totalUnits % totalPeriods;
                            for (int i = 0; i < totalPeriods; i++) {
                              final units = baseUnits + (i == 0 ? remainder : 0);
                              final perAmount = units.toDouble();
                              final date = DateTime(
                                selectedDate.year,
                                selectedDate.month + i,
                                selectedDate.day,
                              );
                              final installmentLabel = '${_t('installmentLabel')} ${i + 1}/$totalPeriods';
                              final combinedNote =
                                  note.isEmpty ? installmentLabel : '$installmentLabel · $note';
                              entries.add(
                                TransactionEntry(
                                  id: '$baseId-$i',
                                  categoryKey: categoryKey,
                                  note: combinedNote,
                                  amount: perAmount,
                                  date: date,
                                  type: type,
                                ),
                              );
                            }
                          } else {
                            entries.add(
                              TransactionEntry(
                                id: baseId,
                                categoryKey: categoryKey,
                                note: note,
                                amount: amount,
                                date: selectedDate,
                                type: type,
                              ),
                            );
                          }
                          Navigator.of(ctx).pop(entries);
                        },
                        child: Text(_t('addRecord')),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).then((newEntries) {
      if (!mounted) return;
      if (newEntries != null && newEntries.isNotEmpty) {
        setState(() {
          if (initial != null) {
            final prefix = initial.id.contains('-')
                ? initial.id.split('-').first
                : initial.id;
            _entries.removeWhere(
              (e) => e.id == prefix || e.id.startsWith('$prefix-'),
            );
          }
          _entries.addAll(newEntries);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final balance = _incomeTotal - _expenseTotal;
    return Scaffold(
      appBar: AppBar(
        title: Text(_t('title')),
        actions: [
          IconButton(
            onPressed: _toggleLanguage,
            icon: const Icon(Icons.language),
            tooltip: _t('languageToggle'),
          ),
          IconButton(
            onPressed: _openInstallmentPage,
            icon: const Icon(Icons.view_timeline),
            tooltip: _t('installmentPage'),
          ),
          IconButton(
            onPressed: () {
              _openEntrySheet();
            },
            icon: const Icon(Icons.add),
            tooltip: _t('addRecord'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _openEntrySheet();
        },
        icon: const Icon(Icons.add),
        label: Text(_t('addRecord')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _changeMonth(-1),
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        _formatMonth(_visibleMonth),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _changeMonth(1),
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _SummaryCard(
                    title: _t('income'),
                    value: _incomeTotal,
                    color: Colors.teal,
                  ),
                  const SizedBox(width: 12),
                  _SummaryCard(
                    title: _t('expense'),
                    value: _expenseTotal,
                    color: Colors.deepOrange,
                  ),
                  const SizedBox(width: 12),
                  _SummaryCard(
                    title: _t('balance'),
                    value: balance,
                    color: balance >= 0 ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: _visibleEntries.isEmpty
                    ? Center(
                        child: Text(_t('noRecords')),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          final entry = _visibleEntries[index];
                          final isExpense =
                              entry.type == TransactionType.expense;
                          final color =
                              isExpense ? Colors.deepOrange : Colors.teal;
                          final sign = isExpense ? '-' : '+';
                          return Card(
                            child: ListTile(
                              onTap: () {
                                _openEntrySheet(initial: entry);
                              },
                              leading: CircleAvatar(
                                backgroundColor:
                                    color.withAlpha((0.15 * 255).round()),
                                child: Icon(
                                  isExpense
                                      ? Icons.arrow_downward
                                      : Icons.arrow_upward,
                                  color: color,
                                ),
                              ),
                              title: Text(_categoryLabel(entry.categoryKey)),
                              subtitle: Text(
                                '${_formatDate(entry.date)} - ${entry.note.isEmpty ? _t('notePlaceholder') : entry.note}',
                              ),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '$sign NT\$${_formatAmount(entry.amount)}',
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        visualDensity: VisualDensity.compact,
                                        tooltip: _t('edit'),
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          _openEntrySheet(initial: entry);
                                        },
                                      ),
                                      IconButton(
                                        visualDensity: VisualDensity.compact,
                                        tooltip: _t('delete'),
                                        icon: const Icon(Icons.delete_outline),
                                        onPressed: () => _confirmDelete(entry),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: _visibleEntries.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withAlpha((0.08 * 255).round()),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'NT\$${value.toStringAsFixed(0)}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: color, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class InstallmentPage extends StatefulWidget {
  const InstallmentPage({
    super.key,
    required this.entries,
    required this.t,
    required this.formatAmount,
    required this.formatDate,
    required this.categoryLabel,
    required this.onEdit,
    required this.onDeleteGroup,
    required this.entriesProvider,
  });

  final List<TransactionEntry> entries;
  final String Function(String) t;
  final String Function(double) formatAmount;
  final String Function(DateTime) formatDate;
  final String Function(String) categoryLabel;
  final Future<void> Function(TransactionEntry initial) onEdit;
  final Future<void> Function(List<TransactionEntry> group) onDeleteGroup;
  final List<TransactionEntry> Function() entriesProvider;

  @override
  State<InstallmentPage> createState() => _InstallmentPageState();
}

class _InstallmentPageState extends State<InstallmentPage> {
  late List<TransactionEntry> _entries;

  @override
  void initState() {
    super.initState();
    _entries = widget.entries;
  }

  void _refresh() {
    setState(() {
      _entries = widget.entriesProvider()
          .where((e) =>
              e.note.contains(widget.t('installmentLabel')) ||
              e.note.contains('\u5206\u671f') ||
              e.note.contains('Installment'))
          .toList()
        ..sort((a, b) => b.date.compareTo(a.date));
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final groups = <String, List<TransactionEntry>>{};
    for (final e in _entries) {
      final key = e.id.contains('-') ? e.id.split('-').first : e.id;
      groups.putIfAbsent(key, () => []).add(e);
    }
    final groupedList = groups.values.toList()
      ..sort((a, b) => b.first.date.compareTo(a.first.date));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.t('installmentPage')),
      ),
      body: groupedList.isEmpty
          ? Center(child: Text(widget.t('installmentEmpty')))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: groupedList.length,
              itemBuilder: (context, idx) {
                final group = groupedList[idx]..sort((a, b) => a.date.compareTo(b.date));
                final total = group.fold<double>(0, (p, e) => p + e.amount);
                final first = group.first;
                final paid = group.where((e) => !e.date.isAfter(now)).toList();
                final paidAmount = paid.fold<double>(0, (p, e) => p + e.amount);
                final unpaidAmount = total - paidAmount;
                final remainingCount = group.length - paid.length;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                first.note.isEmpty
                                    ? widget.categoryLabel(first.categoryKey)
                                    : first.note,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              'NT\$${widget.formatAmount(total)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Row(
                              children: [
                              IconButton(
                                tooltip: widget.t('edit'),
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  await widget.onEdit(first);
                                  if (!mounted) return;
                                  _refresh();
                                },
                              ),
                              IconButton(
                                tooltip: widget.t('delete'),
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () async {
                                  await widget.onDeleteGroup(group);
                                  if (!mounted) return;
                                  _refresh();
                                },
                              ),
                            ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.t('periodsLabel')}: ${group.length}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${widget.t('paidPeriods')}: ${paid.length} · ${widget.t('remainingPeriods')}: $remainingCount',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.t('paidAmount')}: NT\$${widget.formatAmount(paidAmount)}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${widget.t('unpaidAmount')}: NT\$${widget.formatAmount(unpaidAmount)}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: group.map((e) {
                            final isPaid = !e.date.isAfter(now);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.formatDate(e.date)),
                                Row(
                                  children: [
                                    if (isPaid)
                                      const Icon(Icons.check_circle, size: 16, color: Colors.green)
                                    else
                                      const Icon(Icons.radio_button_unchecked, size: 16, color: Colors.grey),
                                    const SizedBox(width: 6),
                                    Text('NT\$${widget.formatAmount(e.amount)}'),
                                  ],
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

