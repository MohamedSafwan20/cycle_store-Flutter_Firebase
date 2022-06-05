import 'package:cached_network_image/cached_network_image.dart';
import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:cycle_store/data/controllers/search_controller.dart';
import 'package:cycle_store/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SearchController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 95,
                        child: TextField(
                          controller: _controller.searchController,
                          onChanged: _controller.onSearchValueChange,
                          decoration: InputDecoration(
                            hintText: "Search your bike here...",
                            fillColor: SECONDARY_COLOR,
                            filled: true,
                            hintStyle: const TextStyle(fontSize: 13),
                            contentPadding: EdgeInsets.zero,
                            suffixIcon: InkWell(
                              onTap: () => _controller.clearSearch(),
                              child: const Icon(
                                Icons.cancel,
                                color: SECONDARY_TEXT_COLOR,
                                size: 18,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: SECONDARY_TEXT_COLOR,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            _controller.search();
                          },
                          child: const Text("Search"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Bikes",
                    style: HEADING_1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: _controller.isLoading.value
                        ? const Loading()
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: _controller.searchProducts.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () => Get.toNamed(PRODUCT_DETAILS_ROUTE,
                                    arguments: {
                                      "product":
                                          _controller.searchProducts[index]
                                    }),
                                child: Container(
                                  width: double.infinity,
                                  height: 75,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            width: 60,
                                            height: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl: _controller
                                                    .searchProducts[index]
                                                    .thumbnail["url"],
                                                imageBuilder:
                                                    (_, imageProvider) {
                                                  return Image(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 170,
                                                child: Text(
                                                  _controller
                                                      .searchProducts[index]
                                                      .name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              SizedBox(
                                                width: 170,
                                                child: Text(
                                                  "in ${_controller.searchProducts[index].category.toLowerCase().capitalizeFirst}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          SECONDARY_TEXT_COLOR),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            _controller.populateSearch(
                                                _controller
                                                    .searchProducts[index]
                                                    .name);
                                          },
                                          icon: const Icon(
                                            Icons.north_west_outlined,
                                            color: SECONDARY_TEXT_COLOR,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }))
              ],
            );
          }),
        ),
      ),
    );
  }
}
