import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BG_COLOR,
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: 110,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "http://picsum.photos/300/300",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
                child: const Text(
                  "Roadbike S2",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
                child: const Text(
                  "S ·  Black Orange",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: SECONDARY_TEXT_COLOR),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "₹14000",
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: SECONDARY_TEXT_COLOR)),
                          child: IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            icon: const Icon(Icons.remove_outlined,
                                size: 17, color: SECONDARY_TEXT_COLOR),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "2",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: SECONDARY_TEXT_COLOR)),
                          child: IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            icon: const Icon(Icons.add_outlined,
                                size: 17, color: Colors.white),
                          )),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
