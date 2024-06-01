import 'package:flutter/material.dart';


class FactoryApp extends StatefulWidget {
  const FactoryApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FactoryAppState createState() => _FactoryAppState();
}

class _FactoryAppState extends State<FactoryApp> {
  int currentPage = 4;
  final int totalPages = 32;
  bool isGridView = false;
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> deviceData = [
    {"id": "HS_123001", "batch": "1245677890", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123002", "batch": "1245677891", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123003", "batch": "1245677892", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123004", "batch": "1245677893", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123005", "batch": "1245677894", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123006", "batch": "1245677895", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123007", "batch": "1245677896", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123008", "batch": "1245677897", "module": "EC20", "imei": "92819381939103945"},
    {"id": "HS_123009", "batch": "1245677898", "module": "EC22", "imei": "92819381939103949"},
  ];
  late List<Map<String, String>> filteredData;

  @override
  void initState() {
    super.initState();
    filteredData = deviceData;
  }

  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredData = deviceData;
      } else {
        filteredData = deviceData.where((device) {
          return device['id']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Device Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Factory Device /',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
               const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Device items information',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          labelText: 'Type here for search',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: filterSearch,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isGridView = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isGridView ? Colors.white : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(Icons.list,color: Colors.black),
                    ),
                    const SizedBox(width: 1),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isGridView = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isGridView ? Colors.green : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(Icons.grid_view,color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: isGridView
                  ? GridView.count(
                      crossAxisCount: 4,
                      children: filteredData.map((device) {
                        return Card(
                          child: ListTile(
                            title: Text(device['id']!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Batch No: ${device['batch']}'),
                                Text('Module: ${device['module']}'),
                                Text('IMEI: ${device['imei']}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : ListView(
                      children: [
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Sniffer 100 ID')),
                            DataColumn(label: Text('Batch No')),
                            DataColumn(label: Text('Module')),
                            DataColumn(label: Text('IMEI')),
                            DataColumn(label: Text('Edit')),
                            DataColumn(label: Text('Delete')),
                          ],
                          rows: filteredData.map((device) {
                            return DataRow(
                              cells: [
                                DataCell(Text(device['id']!)),
                                DataCell(Text(device['batch']!)),
                                DataCell(Text(device['module']!)),
                                DataCell(Text(device['imei']!)),
                                DataCell(IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                )),
                                DataCell(IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {},
                                )),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Device items information',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        if (currentPage > 1) {
                          setState(() {
                            currentPage--;
                          });
                        }
                      },
                    ),
                    Text('PAGE $currentPage of $totalPages'),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (currentPage < totalPages) {
                          setState(() {
                            currentPage++;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 26),
                Text('Device Count ${filteredData.length}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}