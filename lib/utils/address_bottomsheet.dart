import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addressController.dart';

class AddressSearchPage extends StatelessWidget {
  final AddressController controller = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    controller.clearPredictions(); // Clear predictions list when the page is built

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            controller.searchQuery.value = value;
          },
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search address',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.clearSearchHistory();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isSearching.value && controller.searchQuery.isNotEmpty) {
          // Show search results
          return ListView.builder(
            itemCount: controller.predictions.length,
            itemBuilder: (context, index) {
              var prediction = controller.predictions[index];
              return Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(prediction.description ?? ''),
                  onTap: () {
                    controller.addAddressToHistory(prediction.description ?? '');
                    Get.back(result: prediction.description);
                  },
                ),
              );
            },
          );
        } else {
          // Show search history
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (controller.searchHistory.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Search History',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.searchHistory.length,
                    itemBuilder: (context, index) {
                      var historyItem = controller.searchHistory[index];
                      return ListTile(
                        title: Text(historyItem),
                        onTap: () {
                          controller.addAddressToHistory(historyItem);
                          Get.back(result: historyItem);
                        },
                      );
                    },
                  ),
                ),
              ],
            ],
          );
        }
      }),
    );
  }
}
