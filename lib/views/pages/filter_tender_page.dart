// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tender_mobile/services/auth_service.dart';
import 'package:tender_mobile/shared/theme.dart';
import 'package:tender_mobile/shared/values.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class FilterTenderPage extends StatefulWidget {
  const FilterTenderPage({Key? key}) : super(key: key);

  @override
  State<FilterTenderPage> createState() => _FilterTenderPageState();
}

class _FilterTenderPageState extends State<FilterTenderPage> {
  final _baseUrl = '$baseUrl/filter-tender';
  int _page = 1;

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;

  List _tenders = [];

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });

      _page += 1;

      try {
        final token = await AuthService().getToken();
        final res = await http.get(
            Uri.parse(
              "$_baseUrl?page=$_page",
            ),
            headers: {
              'Authorization': token,
            });

        final List fetchedTenders = jsonDecode(res.body)['data'];
        if (fetchedTenders.isNotEmpty) {
          setState(() {
            _tenders.addAll(fetchedTenders);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print("Gagal menampilkan data Tender");
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    try {
      final token = await AuthService().getToken();
      final res = await http.get(
          Uri.parse(
            "$_baseUrl?page=$_page",
          ),
          headers: {
            'Authorization': token,
          });
      setState(() {
        _tenders = jsonDecode(res.body)['data'];
      });
    } catch (err) {
      if (kDebugMode) {
        print("Gagal menampilkan data Tender");
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Tender'),
        backgroundColor: orangeColor,
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _tenders.length,
                    controller: _controller,
                    itemBuilder: (_, index) => Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        children: <Widget>[
                          ListTile(
                            title: const Icon(Icons.music_note,
                                color: Colors.white),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _tenders[index]['nama_tender'],
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  _tenders[index]['lpse'],
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Text(
                                  'HPS : ' + _tenders[index]['hps'],
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Text(
                                  'Akhir Pendaftaran : ' +
                                      _tenders[index]['tanggal_akhir'],
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Text(
                                  _tenders[index]['type'],
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              iconSize: 30,
                              color: blueColor,
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse(
                                    _tenders[index]['url'],
                                  ),
                                  mode: LaunchMode.inAppWebView,
                                );
                              },
                              icon: const Icon(
                                Icons.info,
                              ),
                            ),
                          ),
                          _tenders[index]['isNew'] == 'New'
                              ? Positioned(
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 12,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      "NEW",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.blue,
                    child: const Center(
                      child: Text('Tidak ada lagi data'),
                    ),
                  ),
              ],
            ),
    );
  }
}
