import 'package:flutter_test/flutter_test.dart';
import 'package:my_notes/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await setupInjection();
  // await di.init();
  // final mockNotesRepository = di.sl<NoteRepository>();
  // when(mockNotesRepository.getNotes()).thenAnswer(
  //     (_) => Future.value(Right([(Note(content: "content", title: "title"))])));
  await tester.pumpWidget(MyApp());
  await tester.pumpAndSettle();
}
