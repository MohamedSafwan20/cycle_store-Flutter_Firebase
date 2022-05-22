import 'package:cycle_store/config/colors.dart';
import 'package:cycle_store/config/routes.dart';
import 'package:cycle_store/config/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
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
                        decoration: InputDecoration(
                          hintText: "Search your bike here...",
                          fillColor: SECONDARY_COLOR,
                          filled: true,
                          hintStyle: const TextStyle(fontSize: 13),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              Icons.cancel,
                              color: SECONDARY_TEXT_COLOR,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: SECONDARY_TEXT_COLOR,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () => Get.back(),
                        child: const Text("Cancel"))
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
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 14,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () => Get.toNamed(PRODUCT_LIST_ROUTE),
                          child: Container(
                            width: double.infinity,
                            height: 90,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      width: 65,
                                      height: 65,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "http://picsum.photos/300/300",
                                          fit: BoxFit.fill,
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
                                      children: const [
                                        SizedBox(
                                          width: 170,
                                          child: Text(
                                            "Roadbike S2",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          width: 170,
                                          child: Text(
                                            "in Roadbike",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: SECONDARY_TEXT_COLOR),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
