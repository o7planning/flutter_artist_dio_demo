import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_dio/flutter_artist_dio.dart';
import 'package:flutter_artist_dio_demo/provider/currency_rest_provider.dart';
import 'package:flutter_artist_dio_demo/widgets/cors_alert.dart';
import 'package:flutter_artist_dio_demo/widgets/currency_detail_view.dart';
import 'package:flutter_artist_dio_demo/widgets/currency_list_view.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import 'model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Artist Dio Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Artist Network Core Workspace'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CurrencyRestProvider _provider = CurrencyRestProvider();
  List<CurrencyInfo> _currencies = [];
  CurrencyData? _selectedCurrencyDetails;

  bool _isListLoading = false;
  bool _isDetailsLoading = false;
  String? _selectedCurrencyId;
  String? _detailsError;

  @override
  void initState() {
    super.initState();
    _fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () => DebugNetworkInspectorDialog.show(
              context,
              showJson: true,
              showToken: true,
            ),
            icon: const Icon(Icons.network_check_rounded, size: 16),
            label: const Text('Network Inspector'),
          ),
        ],
      ),
      body: Column(
        children: [
          CorsAlert(),
          Expanded(
            child: LeftRightContainer(
              fixedSizeWidth: 360,
              minSideWidth: 360,
              spacing: 1,
              start: _buildLeftListView(),
              end: _buildRightDetailsView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftListView() {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.currency_exchange_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'CURRENCY TOKENS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, size: 20),
                  tooltip: 'Reload List Assets',
                  onPressed: _fetchCurrencies,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _isListLoading
                ? const Center(child: cupertino.CupertinoActivityIndicator())
                : _currencies.isEmpty
                ? const Center(
                    child: Text(
                      'Empty registry list.',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                : CurrencyListView(
                    currencyInfos: _currencies,
                    selectedCurrencyId: _selectedCurrencyId,
                    onSelectCurrency: (CurrencyInfo currency) {
                      _loadCurrencyDetails(currency.id);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightDetailsView() {
    if (_isDetailsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_detailsError != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.redAccent,
              size: 40,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                'Fetch Details Fail:\n$_detailsError',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent, fontSize: 13),
              ),
            ),
          ],
        ),
      );
    }

    if (_selectedCurrencyDetails == null) {
      return const Center(
        child: Text(
          'Select a currency asset from the left pane\nto view architectural telemetry details.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      );
    }
    return CurrencyDetailView(currencyData: _selectedCurrencyDetails!);
  }

  Future<void> _fetchCurrencies() async {
    setState(() {
      _isListLoading = true;
    });

    ApiResult<CurrencyInfoPage> result = await _provider.query(
      pageable: Pageable(pageSize: 20),
    );

    setState(() {
      _isListLoading = false;
    });

    if (result.error != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Query List Error: ${result.error!.errorMessage}"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
      return;
    }

    if (result.data != null) {
      setState(() {
        _currencies = result.data!.items;
        if (_currencies.isNotEmpty) {
          _loadCurrencyDetails(_currencies.first.id);
        }
      });
    }
  }

  Future<void> _loadCurrencyDetails(String currencyId) async {
    setState(() {
      _selectedCurrencyId = currencyId;
      _isDetailsLoading = true;
      _detailsError = null;
      _selectedCurrencyDetails = null;
    });

    ApiResult<CurrencyData> result = await _provider.find(
      currencyId: currencyId,
    );

    setState(() {
      _isDetailsLoading = false;
    });

    if (result.error != null) {
      setState(() {
        _detailsError = result.error!.errorMessage;
      });
      return;
    }

    if (result.data != null) {
      setState(() {
        _selectedCurrencyDetails = result.data;
      });
    }
  }
}
