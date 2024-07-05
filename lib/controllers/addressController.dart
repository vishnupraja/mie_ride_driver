import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:mie_ride_driver/services/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddressController extends GetxController {
  final GooglePlace googlePlace = GooglePlace(Urls.mapKey); // Replace with your Google API key

  final RxList<AutocompletePrediction> predictions = RxList<AutocompletePrediction>([]);
  final RxString searchQuery = RxString('');

  final RxList<String> searchHistory = <String>[].obs;
  final RxBool isSearching = false.obs;

  @override
  void onInit() {
    debounce(searchQuery, (String query) => searchAddress(query), time: Duration(milliseconds: 500));
    loadSearchHistory();
    super.onInit();
  }

  void clearPredictions() {
    predictions.clear();
  }

  void searchAddress(String query) async {
    if (query.isNotEmpty) {
      isSearching.value = true;
      var result = await googlePlace.autocomplete.get(query);
      if (result != null && result.predictions != null) {
        predictions.assignAll(result.predictions!);
      }else{
        isSearching.value = false;
      }
    } else {
      isSearching.value = false;
      predictions.clear();
    }
  }

  void saveSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', searchHistory);
  }

  void loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('search_history');
    if (history != null) {
      searchHistory.assignAll(history);
    }
  }

  void clearSearchHistory() {
    searchHistory.clear();
    saveSearchHistory();
    update();
  }

  void addAddressToHistory(String address) {
    if (searchHistory.contains(address)) {
      searchHistory.remove(address);   // Remove if it already exists
    }
    searchHistory.insert(0, address); // Insert at the beginning

    if (searchHistory.length > 10) {
      searchHistory.removeRange(10, searchHistory.length); // Keep only the latest 10 entries
    }
    isSearching.value = false;
    saveSearchHistory();
  }



}
