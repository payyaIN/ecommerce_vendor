import 'package:flutter/material.dart';
import 'package:multi_ventor_store/utils/constants/imports.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.20,
      child: Stack(
        children: [
          AppImage(
            img: AppIconData.searchBanner,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 18,
            top: 68,
            child: SizedBox(
              width: 290,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(
                      0xFF7F7F7F,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  prefixIcon: AppImage(
                    img: AppIconData.searchIcon,
                    width: 20,
                    height: 20,
                  ),
                  suffixIcon: AppImage(
                    img: AppIconData.camIcon,
                    width: 20,
                    height: 20,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  focusColor: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            left: 321,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  onTap: () {},
                  child: AppImage(
                    img: AppIconData.bellIcon,
                    width: 30,
                    height: 30,
                  )),
            ),
          ),
          Positioned(
            left: 364,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  onTap: () {},
                  child: AppImage(
                    img: AppIconData.messageIcon,
                    width: 31,
                    height: 31,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
