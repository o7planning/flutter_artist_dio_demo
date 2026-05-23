import 'package:flutter/material.dart';

import '../model/model.dart';

class CurrencyListView extends StatelessWidget {
  final String? selectedCurrencyId;
  final List<CurrencyInfo> currencyInfos;
  final Function(CurrencyInfo) onSelectCurrency;

  const CurrencyListView({
    super.key,
    required this.currencyInfos,
    required this.selectedCurrencyId,
    required this.onSelectCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencyInfos.length,
      itemBuilder: (context, index) {
        final item = currencyInfos[index];
        final isSelected = item.id == selectedCurrencyId;
        return ListTile(
          selected: isSelected,
          selectedTileColor: Theme.of(
            context,
          ).colorScheme.primaryContainer.withValues(alpha: 0.3),
          leading: CircleAvatar(
            radius: 16,
            backgroundColor: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceVariant,
            child: Text(
              item.symbol,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),
          title: Text(
            item.name,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'ID: ${item.id}',
            style: const TextStyle(fontSize: 11),
          ),
          onTap: () {
            onSelectCurrency(item);
          },
        );
      },
    );
  }
}
