import 'package:flutter/material.dart';

class AppBarBottomWidget extends StatelessWidget {
  const AppBarBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0x408A8884),
            width: 0.8,
          ),
          bottom: BorderSide(
            color: Color(0x408A8884),
            width: 0.8,
          ),
        ),
      ),
      height: 40,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(0x408A8884),
                  width: 0.6,
                ),
              ),
            ),
            padding: const EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              children: [
                Image.asset('assets/images/filter.png'),
                const SizedBox(
                  width: 10,
                ),
                const Text('Фильты')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              children: [
                Image.asset('assets/images/sorting.png'),
                const SizedBox(
                  width: 10,
                ),
                const Text('По популярности')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
