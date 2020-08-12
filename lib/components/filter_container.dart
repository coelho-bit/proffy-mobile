import 'package:flutter/material.dart';
import 'package:mobile/fonts/fontStyles.dart';
import 'package:mobile/services/api.dart';

import '../filter_controller.dart';
import '../filters_placeholders.dart';
import 'filter_item.dart';

class FilterContainer extends StatefulWidget {

  final Function onFilterResult;

  FilterContainer({ this.onFilterResult });

  @override
  _FilterContainerState createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  TimeOfDay time;
  final FilterController filterController = FilterController();

  void isFilterCompleted(int day, String subject, String time) {
    if (day != null && subject != null && time != null) {
      ApiServices.getFilteredProffys(day, subject, time).then((value) =>
          widget.onFilterResult.call(value));
    }
  }

  Future<TimeOfDay> getTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Filter(
          filterLabel: "Matéria",
          items: FilterPlaceholders.subjectsList,
          setData: (String dropDownVal) {
            filterController.subject = dropDownVal;
            isFilterCompleted(filterController.day,
                filterController.subject, filterController.time);
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Filter(
                filterLabel: "Dia da Semana",
                items: FilterPlaceholders.weekDaysList,
                setData: (String dropDownVal) {
                  filterController.day = FilterPlaceholders.weekDaysList.indexOf(dropDownVal);
                  isFilterCompleted(filterController.day,
                      filterController.subject, filterController.time);
                },
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hora",
                    style: CustomFontStyles.filterItemLabel,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffFAFAFC),
                    ),
                    width: 150.0,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () async {
                        time = await getTime(context);
                        setState(() {});
                        filterController.time = "${time.hour}:${time.minute}";
                        isFilterCompleted(filterController.day,
                            filterController.subject, filterController.time);
                      },
                      child: Text(
                          time == null ? "Selecione" : time.format(context),
                          style: time == null
                              ? CustomFontStyles.filterHint
                              : null),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
