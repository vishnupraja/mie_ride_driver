import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/home_controller.dart';

import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../controllers/auth_controller.dart';
import '../utils/static.dart';

class ShareAvailability extends StatefulWidget {
  const ShareAvailability({super.key});

  @override
  State<ShareAvailability> createState() => _ShareAvailabilityState();
}

class _ShareAvailabilityState extends State<ShareAvailability> {

  List<String> selectCityList = ["Indore", "Ujjain", "Bhopal"];
  List<String> selectDropCityList = ["Indore", "Ujjain", "Bhopal"];

  var selectCity = null;
  List<String> _selectedItems = [];
  List<String> _selectedItemsName = [];
  bool _isOpen = false;

 final controller =  Get.find<AuthController>();

  @override
  void initState() {
    controller.fetchCities();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,top: 50,right: 20),
          child: Column(
            children: [
              customAppbar(TTexts.ShareAvailabilityText),
              SizedBox(height: TSizes.xl,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: Get.width,
                decoration: TWidget.rShadow,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: TWidget.rShadow,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedDate == null
                                      ? TTexts.SelectDateText
                                      : _selectedDate!.toString().substring(
                                      0, 10),
                                  style: FontsFamily.ExtraBold.copyWith(
                                    color: TColors.textSecondary,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down_sharp, size: 30,
                                  color: TColors.textPrimary,)
                              ],
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: TWidget.rShadow,
                      child: Obx(() {
                        if(controller.cityLoading.value){
                          return Center(child: CircularProgressIndicator(),);
                        }else{
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              dropdownColor: TColors.background,
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  TTexts.SelectStartCityText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      color: TColors.textSecondary, fontSize: 15
                                  ),
                                ),
                              ),
                              value: selectCity,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                                color: TColors.textPrimary,
                              ),
                              isExpanded: true,
                              items: controller.cityList.map(
                                    (value) {
                                  return DropdownMenuItem<String>(
                                    value: value.cityName,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        value.cityName,
                                        style: TextStyle(
                                            color: TColors.textPrimary),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                setState(
                                      () {
                                    selectCity = value;
                                    print("vehicle===>$selectCity");
                                  },
                                );
                              },
                            ),
                          );
                        }
          
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: Get.width,
                decoration: TWidget.rShadow,
                child: Column(
                  children: [
                    Text(TTexts.SelectTimeText,
                      style: FontsFamily.ExtraBold.copyWith(
                          fontSize: TSizes.fontSizeLg,
                          color: TColors.textPrimary
                      ),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            status = "1";
                            _selectTime(context);
                            /*show();*/
                            setState(() {
          
                            });
                          },
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: TWidget.rShadow,
                            child: Center(
                              child: Text(_selectedTime == null
                                  ? TTexts.FromText
                                  : _selectedTime!.format(context),
                                style: FontsFamily.ExtraBold.copyWith(
                                    fontSize: TSizes.fontSizeSm,
                                    color: TColors.textSecondary
                                ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 50,),
                        GestureDetector(
                          onTap: () {
                            status = "2";
                            _selectTime(context);
                            setState(() {
          
                            });
                          },
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: TWidget.rShadow,
                            child: Center(
                              child: Text(_selectedTime2 == null
                                  ? TTexts.ToText
                                  : _selectedTime2!.format(context),
                                style: FontsFamily.ExtraBold.copyWith(
                                    fontSize: TSizes.fontSizeSm,
                                    color: TColors.textSecondary
                                ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOpen = !_isOpen;
                        print(_selectedItems);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: TWidget.rShadow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width/1.4,
                            child: Text(
                              _selectedItems.isEmpty
                                  ? 'Select Drop City (Sel 5 max.)'
                                  : _selectedItemsName.join(', '),
                            ),
                          ),
                          Icon(
                            _isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                  _isOpen
                      ? Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.all(8),
                    decoration: TWidget.rShadow,
                    child: Column(
                      children: controller.cityList.map((item) {
                        return CheckboxListTile(
                          checkboxShape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          value: _selectedItems.contains(item.cityId),
                          title: Container(width: Get.width/1.5,child: Text(item.cityName)),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (isChecked) {
                            setState(() {
                              if (isChecked!) {
                                if (_selectedItems.length >= 5) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('You can select up to 5 items only.'),
                                    ),
                                  );
                                  return;
                                }
                                _selectedItems.add(item.cityId);
                                _selectedItemsName.add(item.cityName);
                              } else {
                                _selectedItems.remove(item.cityId);
                                _selectedItemsName.remove(item.cityName);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  )
                      : Container(),
                ],
              ),
          
              /*Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: TWidget.rShadow,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    dropdownColor: TColors.background,
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        TTexts.SelectDropCityText,
                        style: FontsFamily.ExtraBold.copyWith(
                            color: TColors.textSecondary, fontSize: 15
                        ),
                      ),
                    ),
                    value: selectDropCity,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: TColors.textPrimary,
                    ),
                    isExpanded: true,
                    items: selectDropCityList.map(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              style: TextStyle(color: TColors.textPrimary),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(
                            () {
                          selectDropCity = value;
                          print("vehicle drop===>$selectDropCity");
                        },
                      );
                    },
                  ),
                ),
              ),*/
          
              /*Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: Get.width,
                decoration: TWidget.rShadow,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: TWidget.rShadow,
                      child: PopupMenuButton<List<String>>(
                        color: Colors.white,
                        constraints: BoxConstraints.tightFor(width: Get.width / 1.3),
                        offset: Offset(0, 55), // Shift menu down by 40 pixels (adjust as needed)
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: TColors.background,
                            borderRadius: BorderRadius.circular(8.0), // Add border radius for rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  selectedCarIds.isNotEmpty ? _getCarNames(selectedCarIds) : TTexts.selectDropText,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontsFamily.ExtraBold.copyWith(
                                    color: selectedCarIds.isNotEmpty ? TColors.textPrimary : TColors.textSecondary,
                                    fontSize: 15,
          
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                        itemBuilder: (BuildContext context) {
                          return Get.find<AuthController>().vehicleList.map((value) {
                            return PopupMenuItem<List<String>>(
                              value: [value['car_id'],
                                value['car_name']],
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: TColors.background,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: TColors.background),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(2, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    StatefulBuilder(
                                      builder: (BuildContext context, _setState) {
                                        bool isSelected = selectedCarIds.contains(value['car_id']);
                                        return  Checkbox(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          value: isSelected,
                                          onChanged: (bool? newValue) {
                                            _setState(() {
                                              if (selectedCarIds.contains(value['car_id'])) {
                                                selectedCarIds.remove(value['car_id']);
                                                selectedCarIds.join(",");
                                                print("selectedCarIds===>$selectedCarIds");
                                              } else {
                                                selectedCarIds.add(value['car_id']);
                                                print("selectedCarIds===>$selectedCarIds");
                                              }
                                            });
                                          },
                                        );
                                      },),
                                    Text(
                                      value['car_name'],
                                      style: TextStyle(color: TColors.textPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList();
                        },
                        onSelected: (value){
                          setState(() {
          
                          });
                        },
                        onCanceled: (){
                          setState(() {
          
                          });
                        },
                        onOpened: (){
                          setState(() {
          
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),*/
              SizedBox(height: 30,),
              CustomButton(TTexts.SubmitText, BUTTON_IMAGE, () {
                validation();
              })
            ],
          ),
        ),
      ),
    );
  }

/*  String _getCarNames(List<String> carIds) {
    List<String> carNames = [];
    var vehicleList = Get.find<AuthController>().vehicleList;

    for (String carId in carIds) {
      var car = vehicleList.firstWhere(
            (element) => element['car_id'] == carId,
        orElse: () => {},
      );
      if (car.isNotEmpty && !carNames.contains(car['car_name'])) {
        carNames.add(car['car_name']);
      }else{
        carNames.remove(car['car_name']);
      }
    }
    return carNames.join(", ");
  }*/

  DateTime? _selectedDate; // Make _selectedDate nullable

  Future<void> _selectDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) => Container(
        height: 300,
        color: Color.fromARGB(255, 255, 255, 255),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () {
                      Get.back();  // Close the modal
                    },
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.width / 1.8,
                child: CupertinoDatePicker(
                  initialDateTime: _selectedDate ?? DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  var status = "";

  TimeOfDay? _selectedTime, _selectedTime2; // Make _selectedTime nullable

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay initialTime;
    if (status == "1" && _selectedTime != null) {
      initialTime = _selectedTime!;
    } else if (_selectedTime2 != null) {
      initialTime = _selectedTime2!;
    } else {
      initialTime = TimeOfDay.now();
    }

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          color: Color.fromARGB(255, 255, 255, 255),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row to position the button at the top right corner
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      initialTime.hour,
                      initialTime.minute,
                    ),
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        if (status == "1") {
                          _selectedTime = TimeOfDay.fromDateTime(newDateTime);
                          print("object ---$_selectedTime");
                        } else {
                          _selectedTime2 = TimeOfDay.fromDateTime(newDateTime);
                        }
                      });
                    },
                    use24hFormat: false,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }






  void validation()async{

    if(_selectedDate == null){
      customSnackBar("please select date");
    }else if(selectCity == null){
      customSnackBar("please select start city");
    }else if(_selectedTime == null){
      customSnackBar("please select start time");
    }else if(_selectedTime2 == null){
      customSnackBar("please select start endTime");
    }else if(_selectedItems.isEmpty){
      customSnackBar("please select DropCity");
    }else{
      var city = _selectedItemsName.join(',');
      Get.find<HomeController>().shareAvailability(
          _selectedDate!.toString().substring(0, 10).toString(),
          _selectedTime!.format(context).toString(),
          _selectedTime2!.format(context).toString(),
          selectCity.toString(),
          city
      );
    }

  }

  void show()async{
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Get.height/3, // या जितनी भी आपको ठीक लगे
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    // चयनित समय के साथ कुछ करें (newDateTime)
                  },
                  use24hFormat: false, // AM/PM चयन के लिए false पर सेट करें
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(10),
                width: Get.width,
                child: CupertinoButton(
                  color: TColors.info,
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );


  }




}
