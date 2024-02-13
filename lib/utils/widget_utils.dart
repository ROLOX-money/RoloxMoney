import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/screen/clients_screen/entites/clinet_model.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_controller.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/rolox_autocomplete_textfiled.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';

abstract class WidgetUtils {
  static Widget genericTextFiled(
      {required BuildContext context,
      required TextEditingController controller,
      required String labelName,
      List<String> validationRules = const [],
      String? suffixImagePath,
      String? hintText,
      int? maxLines,
      int? minLines,
      TextInputType? keyBoardType,
      bool isReadOnly = false,
      TextStyle? labelStyle,
      List<TextInputFormatter>? inputformaters,
      Function? onEditing,
      bool obscureText = false,
      int? maximumWordCount,
      Function()? onTab,
      double? height,
      EdgeInsetsGeometry? contentPadding,
      TextAlignVertical? textAlignVertical}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: labelName,
          style: labelStyle ??
              Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: height ?? 70,
          child: CustomTextField(
            controller.obs.value,
            minLines: minLines,
            maximumWordCount: maximumWordCount,
            maxLines: maxLines,
            isReadOnly: isReadOnly,
            hintText: hintText,
            contentPadding: contentPadding,
            textAlignVertical: textAlignVertical,
            focusedBorder: Colors.grey,
            textColor: ColorResource.color181B28,
            onTapped: isReadOnly ? onTab : null,
            enableColor: Colors.grey,
            validationRules: validationRules,
            borderColor: Colors.red,
            inputformaters: inputformaters,
            onEditing: onEditing,
            obscureText: obscureText,
            suffixWidget: suffixImagePath != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: AppUtils.setSVG(svgPath: suffixImagePath),
                  )
                : null,
            disableColor: Colors.red,
            keyBoardType: keyBoardType ?? TextInputType.name,
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  static Widget dropDown(
      {required BuildContext context,
      required String lableName,
      required List<String> dropDownList,
      required String selectedValues,
      required Function(String) onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: lableName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey, width: 0.25),
            // boxShadow: ColorResource.boxShadow,
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValues,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              dropdownColor: Theme.of(context).scaffoldBackgroundColor,
              items: dropDownList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CustomText(
                    text: value,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ),
        ),
      ],
    );
  }

  static showAlertDialog(
      {required BuildContext context,
      Function()? iconButtonOnPressed,
      Function()? primaryButtonOnTap}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          insetPadding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorResource.borderColor, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          title: MediaQuery.removePadding(
            removeTop: true,
            removeBottom: true,
            removeLeft: true,
            removeRight: true,
            context: context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: iconButtonOnPressed,
                    icon: Icon(
                      Icons.close,
                      color: ColorResource.closeIconColor,
                    ))
              ],
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageResource.agencyAlertImage,
                    height: 280,
                    width: 180,
                  ),
                ),
                CustomText(
                  text: '${Languages.of(context)?.oopsAgency}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '${Languages.of(context)?.oopsAgencyMessage}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorResource.textSecondaryColor),
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton('${Languages.of(context)!.continueText}', context,
                    cardShape: 1,
                    isIcon: true,
                    fontSize: 20,
                    onTap: primaryButtonOnTap),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget genericAutoCompleteTextField(
      {required textController,
      required context,
      required suggestions,
      required labelName,
      required hintText,
      required Function(String) textSubmitted,
      required Function(String) textChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: labelName,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorResource.color181B28, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SimpleAutoCompleteTextField(
            key: GlobalKey(),
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: ColorResource.colorA0A1A9,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  height: 1,
                  fontSize: 14),
              fillColor: ColorResource.colorFFFFFF,
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 18, minWidth: 18),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppUtils.setSVG(svgPath: ImageResource.searchSVG),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.25),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.25),
              ),
              enabled: true,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.25),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            controller: textController,
            suggestions: suggestions,
            textChanged: textChanged,
            textSubmitted: textSubmitted),
      ],
    );
  }

  static customTableWidget({
    required BuildContext context,
    bool? isHomeTap,
    bool? isPaymentTap,
    bool? isClientTap,
    bool? isProjectTap,
    bool? isInvoiceTap,
    required int listLength,
    List<Invoice>? invoiceList,
    List<ClientModel>? clientList,
    List<ProjectModel>? projectList,
  }) {
    Invoice invoiceModelData = Invoice();
    ClientModel clientModelData = ClientModel();
    ProjectModel projectModelData = ProjectModel();

    Map<String, ColumnSize> value = {};

    if (isHomeTap == true || isInvoiceTap == true) {
      value = {
        if (isHomeTap == true) "SI.No": ColumnSize.S,
        "Invoice Name": ColumnSize.L,
        "Amount": ColumnSize.S,
        if (isInvoiceTap == true) "#Invoice No": ColumnSize.M,
        "Date": ColumnSize.M,
        "Project Name": ColumnSize.L,
        "Action": ColumnSize.M,
      };
    } else if (isClientTap == true) {
      value = {
        "Client Name": ColumnSize.L,
        "Project Title": ColumnSize.L,
        "No of projects": ColumnSize.S,
        "Date": ColumnSize.S,
        "Action": ColumnSize.M,
      };
    } else if (isProjectTap == true) {
      value = {
        "Project Name": ColumnSize.L,
        "No of Invoices": ColumnSize.S,
        "Date": ColumnSize.S,
        "Action": ColumnSize.M,
      };
    } else if (isPaymentTap == true) {
      value = {
        "₹Payment Amount": ColumnSize.L,
        "Type": ColumnSize.S,
        "invoice No": ColumnSize.S,
        "Project Name": ColumnSize.L,
        "Date": ColumnSize.S,
        "Action": ColumnSize.M,
      };
    }
    print("values is : ${value.toString}");

    List<bool> isSelected = List.generate(listLength, (index) => false);

    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return DataTable2(
          dividerThickness: 2,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          headingTextStyle: TextStyle(
              color: Theme.of(context).textTheme.titleLarge!.color,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          showCheckboxColumn: true,
          showBottomBorder: true,
          dataRowHeight: 70,
          columnSpacing: 10,
          horizontalMargin: 30,
          minWidth: 600,
          columns: value.entries
              .map((e) => DataColumn2(
                  label: CustomText(
                    text: e.key,
                  ),
                  size: e.value))
              .toList(),
          rows: List<DataRow>.generate(listLength, (index) {
            if (isHomeTap == true || isInvoiceTap == true) {
              invoiceModelData = invoiceList![index];
            } else if (isClientTap == true) {
              clientModelData = clientList![index];
            } else if (isProjectTap == true) {
              projectModelData = projectList![index];
            } else if (isPaymentTap == true) {
              // clientModelData = clientList![index];
            }

            List<DataCell> dataCell = [
              if (isHomeTap == true || isInvoiceTap == true) ...[
                if (isHomeTap == true) DataCell(Text('${index + 1}')),
                DataCell(Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: listLength.isOdd
                          ? ColorResource.initialBgColor
                          : ColorResource.initialBgColor2,
                      child: CustomText(
                        text: AppUtils.getInitials(AppUtils.getFirstName(
                            invoiceModelData.invoiceName!)),
                        style: TextStyle(
                            color: listLength.isOdd
                                ? ColorResource.initialTextColor
                                : ColorResource.initialTextColor2),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(invoiceModelData.invoiceName.toString())
                  ],
                )),
                DataCell(
                    Text(invoiceModelData.invoiceValueWithoutGst.toString())),
                if (isInvoiceTap == true)
                  DataCell(Text(invoiceModelData.invoiceNumber.toString())),
                DataCell(Text(DateFormat('MM/dd/yyyy')
                    .format(DateTime.parse(invoiceModelData.createdAt!)))),
                DataCell(Text(invoiceModelData.projectName.toString())),
                DataCell(TextButton(
                  onPressed: () {
                    InvoiceController()
                        .navigateAddInvoiceScreen(arguments: index);
                  },
                  child: CustomText(
                    text: 'View Action',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ))
              ],
              if (isClientTap == true) ...[
                DataCell(Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: listLength.isOdd
                          ? ColorResource.initialBgColor
                          : ColorResource.initialBgColor2,
                      child: CustomText(
                        text: AppUtils.getInitials(
                            clientModelData.companyDB!.companyName.toString()),
                        style: TextStyle(
                            color: listLength.isOdd
                                ? ColorResource.initialTextColor
                                : ColorResource.initialTextColor2),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(clientModelData.companyDB!.companyName.toString())
                  ],
                )),
                DataCell(Text(projectModelData.projectName.toString())),
                DataCell(Text(
                    (projectModelData.noOfInvoice.toString() == "null")
                        ? "0"
                        : projectModelData.noOfInvoice.toString())),
                DataCell(Text(DateFormat('MM/dd/yyyy').format(
                    DateTime.parse(clientModelData.companyDB!.createdAt!)))),
                DataCell(TextButton(
                  onPressed: () {
                    ClientsController()
                        .navigateAddClientScreen(arguments: index);
                  },
                  child: CustomText(
                    text: 'View Action',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ))
              ],
              if (isProjectTap == true) ...[
                DataCell(Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: listLength.isOdd
                          ? ColorResource.initialBgColor
                          : ColorResource.initialBgColor2,
                      child: CustomText(
                        text: AppUtils.getInitials(
                            projectModelData.projectName.toString()),
                        style: TextStyle(
                            color: listLength.isOdd
                                ? ColorResource.initialTextColor
                                : ColorResource.initialTextColor2),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(GetUtils.capitalizeFirst(
                            projectModelData.projectName.toString()) ??
                        "N")
                  ],
                )),
                DataCell(Text(projectModelData.noOfInvoice.toString())),
                DataCell(Text(projectModelData.dueDate!)),
                DataCell(TextButton(
                  onPressed: () {
                    ProjectsController()
                        .navigateAddProjectScreen(arguments: index);
                  },
                  child: CustomText(
                    text: 'View Action',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ))
              ],
              if (isPaymentTap == true) ...[
                DataCell(Text(projectModelData.projectvalue.toString())),
                DataCell(Text(
                    projectModelData.isCredit == true ? "Credit" : "Debit ")),
                DataCell(Text(projectModelData.noOfInvoice.toString())),
                DataCell(Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: listLength.isOdd
                          ? ColorResource.initialBgColor
                          : ColorResource.initialBgColor2,
                      child: CustomText(
                        text: AppUtils.getInitials(AppUtils.getFirstName(
                            projectModelData.projectName.toString())),
                        style: TextStyle(
                            color: listLength.isOdd
                                ? ColorResource.initialTextColor
                                : ColorResource.initialTextColor2),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(projectModelData.projectName.toString())
                  ],
                )),
                DataCell(Text(DateFormat('MM/dd/yyyy')
                    .format(DateTime.parse(projectModelData.dueDate!)))),
                DataCell((projectModelData.isCredit == true)
                    ? SizedBox()
                    : TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: 'Remainder',
                          isUnderLine: true,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ))
              ]
            ];
            return DataRow(
                selected: isSelected[index],
                onSelectChanged: (val) {
                  setState(() {
                    isSelected[index] = val!;
                  });
                },
                cells: dataCell);
          }));
    });
  }
}
