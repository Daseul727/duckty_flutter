import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

// 서버에서 받은 데이터를 가정한 이벤트 리스트 (날짜별)
final Map<DateTime, List<Event>> eventSource = {
  DateTime(2025, 3, 3): [Event("이벤트 1", "장소 A", "https://via.placeholder.com/50")],
  DateTime(2025, 3, 5): [Event("이벤트 2", "장소 B", "https://via.placeholder.com/50")],
  DateTime(2025, 3, 10): [
    Event("이벤트 3", "장소 C", "https://via.placeholder.com/50"),
    Event("이벤트 4", "장소 D", "https://via.placeholder.com/50"),
    Event("이벤트 3", "장소 C", "https://via.placeholder.com/50"),
    Event("이벤트 3", "장소 C", "https://via.placeholder.com/50"),
    Event("이벤트 3", "장소 C", "https://via.placeholder.com/50")
  ],
};

class Event {
  final String name;
  final String location;
  final String thumbnailUrl;

  Event(this.name, this.location, this.thumbnailUrl);
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Event> _selectedEvents = [];

  void _goToPreviousMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentMonth = DateFormat("y년 M월", "ko_KR").format(_focusedDay);

    return Scaffold(
      backgroundColor: Colors.white, // 바탕화면 흰색
      body: Column(
        children: [
          // 월 & 이전/다음 버튼
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: _goToPreviousMonth,
                ),
                Text(
                  currentMonth,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 20),
                  onPressed: _goToNextMonth,
                ),
              ],
            ),
          ),
          // 캘린더 위젯
          TableCalendar(
            locale: 'ko_KR',
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;

                // selectedDay의 시간 부분을 00:00으로 맞춰 날짜만 비교
                final selectedDate = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);

                // 날짜가 일치하는 이벤트를 가져오기
                _selectedEvents = eventSource[selectedDate] ?? [];
              });
            },

            headerVisible: false,
            calendarFormat: CalendarFormat.month,
            daysOfWeekHeight: 30,
            rowHeight: 50,
            availableGestures: AvailableGestures.all,
            eventLoader: (day) {
              // 날짜 비교: 시간 정보를 무시하고 날짜만 비교
              final events = eventSource.entries
                  .where((entry) =>
              entry.key.year == day.year &&
                  entry.key.month == day.month &&
                  entry.key.day == day.day)
                  .map((entry) => entry.value)
                  .expand((eventList) => eventList)
                  .toList();
              return events;
            },

            // 이벤트 있는 날짜 점 표시
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Color(0xFFFFE4CC),
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
              markersMaxCount: 1,
              markerDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle
              )
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.black),
              weekendStyle: TextStyle(color: Colors.red),
            ),
          ),
          // 선택한 날짜의 이벤트 리스트
          Expanded(
            child: _selectedEvents.isEmpty
                ? Center(child: Text("선택한 날짜에 일정이 없습니다."))
                : ListView.builder(
              shrinkWrap: true, // 필요한 공간만 차지하게 함
              physics: AlwaysScrollableScrollPhysics(), // 항상 스크롤 가능하도록 설정
              padding: EdgeInsets.all(16),
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                Event event = _selectedEvents[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.asset('assets/character.png'),
                    title: Text(event.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    subtitle: Text(event.location),
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}
