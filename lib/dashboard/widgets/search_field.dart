import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onCancel;
  final Function(String)? onChanged;
  const SearchField({Key? key,required this.controller,this.onCancel,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20  ),
        child:Container(
          height: 60,
          padding: const EdgeInsets.only(top: 3,left: 20,right: 20),
          decoration: BoxDecoration(
            color: Constants.COLOR5.withOpacity(0.7),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            leading:const Icon(Icons.search,
                color: Constants.COLOR1
            ),
            trailing: IconButton(
              icon:const Icon(
                Icons.close_sharp,
                color: Constants.COLOR1,
                size: 20,
              ),
              padding:const EdgeInsets.all(0),
              tooltip: 'Clear',
              onPressed: onCancel,
            ),
            title: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              style:const TextStyle(
                color: Constants.COLOR1,
                fontSize: AppDimensions.FONT_SIZE_21,
              ),
              autofocus: true,
              onChanged: onChanged,
              // textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText:'TV shows, movies and more',
                hintStyle: TextStyle(
                  color: Constants.COLOR3.withOpacity(0.5),
                  fontSize: AppDimensions.FONT_SIZE_18,
                ),
                contentPadding: const EdgeInsets.only(bottom: 8),

                enabledBorder:  const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder:  const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent),
                ),

              ),
            ),
          ),
        )
    );
  }
}
