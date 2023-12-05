import 'package:flutter/material.dart';
import 'package:roloxmoney/utils/color_resource.dart';

class AutoComplete {
  static Widget autoComplete(
      {required String hintText,
      String? value,
      List<String>? suggestionValue,
      Function(dynamic)? onFieldSubmitted}) {
    List<String> values = suggestionValue ?? [];
    return Container(
      decoration: BoxDecoration(
          boxShadow: ColorResource.boxShadow, color: Colors.white),
      height: 60,
      child: Autocomplete<String>(
        initialValue: value != null ? TextEditingValue(text: value) : null,
        fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          return OrientationBuilder(builder: (context, orientation) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              maxLines: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (String value) {
                // onFieldSubmitted!(value);
              },
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.black, fontSize: 16),
              // initialValue: value,
              decoration: InputDecoration(
                  /*   suffixIcon: const Icon(Icons.arrow_drop_down_sharp,
                      size: 14, color: Colors.black),*/

                  /// GUI validation feed back improvisation
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(height: 0.75, color: Colors.grey, fontSize: 16),
                  hintMaxLines: 1,
                  isDense: true,
                  hintText: hintText),
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
            );
          });
        },
        optionsViewBuilder: (BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Material(
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54,width: 0.5),
                    color: Colors.white70,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 30,
                  height: options.length == 1
                      ? 75
                      : options.length < 4
                          ? 150
                          : 200,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final option = options.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(
                          focusColor: Colors.black,
                          title: Text(option,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.black, fontSize: 16)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
        displayStringForOption: (String option) => option,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return values;
          }
          return values.where((String option) {
            return option
                .toLowerCase()
                .toString()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          onFieldSubmitted!(selection);
        },
      ),
    );
  }
}
