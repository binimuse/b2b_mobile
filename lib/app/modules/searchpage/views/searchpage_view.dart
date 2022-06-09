import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/global_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/searchpage_controller.dart';

class SearchpageView extends GetView<SearchpageController> {
  const SearchpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loadingnew.value != true
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: GlobalStyle.appBarIconThemeColor,
                ),
                systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
                centerTitle: true,
                titleSpacing: 0.0,
                backgroundColor: GlobalStyle.appBarBackgroundColor,
                elevation: 0,
                // create search text field in the app bar
                title: Container(
                  margin: EdgeInsets.only(right: 16),
                  height: kToolbarHeight - 16,
                  child: TextField(
                    controller: controller.etSearch,
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    onChanged: (textValue) {
                      controller.update();
                    },
                    onTap: () {
                      controller.loadData.value = false;
                    },
                    onSubmitted: (textValue) {
                      if (textValue != '') {
                        controller.getRestaurantData();
                      }
                    },
                    maxLines: 1,
                    style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.search, color: Colors.grey[500], size: 18),
                      suffixIcon: (controller.etSearch.text == '')
                          ? null
                          : GestureDetector(
                              onTap: () {
                                controller.etSearch.value =
                                    TextEditingController(text: '').value;
                              },
                              child: Icon(Icons.close,
                                  color: Colors.grey[500], size: 18)),
                      contentPadding: const EdgeInsets.all(0),
                      isDense: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: 'Search here',
                      hintStyle:
                          TextStyle(fontSize: 13, color: Colors.grey[500]),
                    ),
                  ),
                )),
            body: WillPopScope(
              onWillPop: () {
                Navigator.pop(context);
                FocusScope.of(context).unfocus();
                return Future.value(true);
              },
              // if search field is empty, show history search
              // if search field not empty, show search text
              child: controller.loadData.value
                  ? _loadNewData()
                  : controller.etSearch.text == ''
                      ? _showHistorySearch()
                      : _showSearchText(),
            )));
  }

  Widget _loadNewData() {
    return ListView.builder(
      itemCount: controller.restaurantData.length,
      padding: const EdgeInsets.symmetric(vertical: 0),
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return controller.reusableWidget
            .buildRestaurantList(context, index, controller.restaurantData);
      },
    );
  }

  Widget _showHistorySearch() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        controller.searchData.length == 0
            ? Wrap()
            : Container(
                child: Text(
                  'Last Search',
                ),
              ),
        controller.searchData.length == 0
            ? Wrap()
            : Column(
                children: List.generate(controller.searchData.length, (index) {
                  return _buildLastSearchList(index);
                }),
              ),
      ],
    );
  }

  Widget _buildLastSearchList(index) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // FocusScope.of(context).unfocus();
          controller.getRestaurantData();

          controller.etSearch.text = controller.searchData[index].words;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: SOFT_GREY, size: 16),
                    SizedBox(width: 12),
                    Flexible(
                      child: Text(controller.searchData[index].words,
                          style: TextStyle(color: BLACK55),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  controller.searchData.removeAt(index);
                },
                child: Icon(Icons.close, color: BLACK77, size: 18)),
          ],
        ),
      ),
    );
  }

  Widget _showSearchText() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Container(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // FocusScope.of(context).unfocus();
              controller.getRestaurantData();
            },
            child: Row(
              children: [
                Icon(Icons.access_time, color: SOFT_GREY, size: 16),
                SizedBox(width: 12),
                Text(controller.etSearch.text,
                    style: TextStyle(color: BLACK55)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
