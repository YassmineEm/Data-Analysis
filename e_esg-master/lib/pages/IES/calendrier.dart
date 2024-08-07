import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Widgets/custom_sliver_app_bar.dart';
import 'ajoutLive.dart';

class Calendrier extends StatefulWidget {
  const Calendrier({Key? key}) : super(key: key);

  @override
  State<Calendrier> createState() => CalendrierState();
}

class CalendrierState extends State<Calendrier> {
  late CalendarView _view;
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    _view = CalendarView.month;
    _calendarController.view = _view;
  }

  void selectView(CalendarView view) {
    setState(() {
      _view = view;
      _calendarController.view = view;
    });
  }
  void _onCalendarTapped(CalendarTapDetails details) {
    setState(() {
      List<dynamic> lives = details.appointments ?? [];
      List<String> livesAtSelectedDate = [];
      List<Color> livescolor=[];

      if (lives.isNotEmpty) {
        for (var live in lives) {
          livesAtSelectedDate.add(live.subject);
          livescolor.add(live.color);
        }
        // Show popover with the menu items
        showCupertinoMenu(livesAtSelectedDate,livescolor);
      }
    });
  }
  void showCupertinoMenu(List<String> items, List<Color> colors) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: items.asMap().entries.map((entry) {
          int index = entry.key;
          String item = entry.value;
          return Container(
            color: colors[index],
            child: CupertinoActionSheetAction(
              child: Text(
                item,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        }).toList(),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double iconButtonSize = screenWidth * 0.10;
    double sectionPadding = screenWidth * 0.04;
    double titleFontSize = screenWidth * 0.06;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(name: "Liam Michael",role: "Admin",imagePath: 'assets/images/boy.png'),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(sectionPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    Center(
                      child: Text(
                        "Plannifier les lives",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.03, bottom: 20),
                        child: SizedBox(
                          width: screenWidth * 0.45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Ajoutlive()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF2E37A4),
                              padding: EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: Colors.white, size: screenWidth * 0.07),
                                SizedBox(width: 8),
                                Text(
                                  "Ajouter un live",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: titleFontSize - 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        border: Border.all(
                          color: Color(0xFFEAEBF6),
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.all(sectionPadding),
                      child: SizedBox(
                        height: screenHeight * 0.4,
                        child: Scrollbar(
                          thumbVisibility: false,
                          controller: ScrollController(),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        selectView(CalendarView.month);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _view == CalendarView.month ? Color(0xFF00D3C7) : Color(0xFFF1F1F1),
                                        foregroundColor: _view == CalendarView.month ? Colors.white : Color(0xFF797979),
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text("Mois"),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        selectView(CalendarView.week);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _view == CalendarView.week ? Color(0xFF00D3C7) : Color(0xFFF1F1F1),
                                        foregroundColor: _view == CalendarView.week ? Colors.white : Color(0xFF797979),
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text("Semaine"),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        selectView(CalendarView.day);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _view == CalendarView.day ? Color(0xFF00D3C7) : Color(0xFFF1F1F1),
                                        foregroundColor: _view == CalendarView.day ? Colors.white : Color(0xFF797979),
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text("Jour"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                SfCalendar(
                                  controller: _calendarController,
                                  view: _view,
                                  firstDayOfWeek: 1,
                                  dataSource: LiveDataSource(getLives()),
                                  onTap: _view == CalendarView.month?_onCalendarTapped:null,
                                  todayHighlightColor: Color(0xFF2E37A4),
                                  headerStyle: CalendarHeaderStyle(
                                    backgroundColor: Colors.white,
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: titleFontSize - 3,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  monthViewSettings: MonthViewSettings(
                                    monthCellStyle: MonthCellStyle(
                                      backgroundColor: Colors.white,
                                      trailingDatesBackgroundColor: Colors.white,
                                      leadingDatesBackgroundColor: Colors.white,
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                      ),
                                      trailingDatesTextStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Poppins',
                                      ),
                                      leadingDatesTextStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  selectionDecoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF2E37A4), width: 2.0),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  timeSlotViewSettings: TimeSlotViewSettings(
                                    timeTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  appointmentTextStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        border: Border.all(
                          color: Color(0xFFEAEBF6),
                          width: 1.0,
                        ),
                      ),
                      padding: EdgeInsets.all(sectionPadding),
                      child: Row(
                        children: [
                          Image.asset("assets/images/propo_icon.png", width: iconButtonSize, height: 80),
                          SizedBox(width: screenWidth * 0.04),
                          Text(
                            'Propositions',
                            style: TextStyle(
                              fontSize: titleFontSize - 2,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            color: Color(0xFFEAEBF6), // Replace with your desired color
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        border: Border.all(
                          color: Color(0xFFEAEBF6),
                          width: 1.0,
                        ),
                      ),
                      padding: EdgeInsets.all(sectionPadding),
                      child: Row(
                        children: [
                          Image.asset("assets/images/statistique_icone.png", width: iconButtonSize, height: 80),
                          SizedBox(width: screenWidth * 0.04),
                          Text(
                            'Statistiques',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            color: Color(0xFFEAEBF6), // Replace with your desired color
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                      ),
                      padding: EdgeInsets.all(sectionPadding),
                      child: Column(
                        children: [
                          Text(
                            'Privacy Policy   Terms of Use',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Color.fromARGB(255, 161, 161, 161),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Copyright 2024 XRay All Rights Reserved.',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
List<Appointment> getLives() {
  List<Appointment> lives = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  final DateTime startTime2 = DateTime(today.year, today.month, today.day, 7, 0, 0);
  final DateTime endTime2 = startTime2.add(const Duration(hours: 2));
  final DateTime startTime3=DateTime(2024,07,3,9,0,0);
  final DateTime endTime3=startTime3.add(const Duration(hours: 2));
  lives.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'Les dangers du tabac',
    color: Color(0xFF55CE63),
  ));
  lives.add(Appointment(
    startTime: startTime3,
    endTime: endTime3,
    subject: 'laver vos dents',
    color: Color(0xFF009EFB),
  ));
  lives.add(Appointment(
    startTime: startTime2,
    endTime: endTime2,
    subject: "l'importance de la nutrition",
    color: Color(0xFFFFBC34),
  ));
  return lives;
}

class LiveDataSource extends CalendarDataSource {
  LiveDataSource(List<Appointment> source) {
    appointments = source;
  }
}
