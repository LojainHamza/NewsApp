import 'package:timeago/timeago.dart' as timeago;

class MyCustomMessagesAR implements timeago.LookupMessages {
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => 'الآن';
  @override String aboutAMinute(int minutes) => 'منذ${minutes}دقائق';
  @override String minutes(int minutes) => 'منذ${minutes}دقائق';
  @override String aboutAnHour(int minutes) => 'منذ${minutes}دقائق';
  @override String hours(int hours) => 'منذ${hours}ساعات';
  @override String aDay(int hours) => 'منذ${hours}ساعة';
  @override String days(int days) => 'منذ${days}أيام';
  @override String aboutAMonth(int days) => 'منذ${days}أيام';
  @override String months(int months) => 'منذ${months}أشهر';
  @override String aboutAYear(int year) => 'منذ${year}سنة';
  @override String years(int years) => 'منذ${years}سنوات';
  @override String wordSeparator() => ' ';
}
