import 'dart:io';

void main() {
  final baseDir = Directory('lib');

  final folders = [
    'presentation/screens',
    'presentation/bloc',
    'domain/entities',
    'domain/usecases',
    'domain/repositories',
    'data/models',
    'data/repositories',
  ];

  for (var folder in folders) {
    final dir = Directory('${baseDir.path}/$folder');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('Created folder: ${dir.path}');
    }
  }

  // Example of creating a simple template file
  final sampleEntity = File('${baseDir.path}/domain/entities/sample_entity.dart');
  if (!sampleEntity.existsSync()) {
    sampleEntity.writeAsStringSync('''
class SampleEntity {
  final String id;
  final String name;

  SampleEntity({required this.id, required this.name});
}
''');
    print('Created file: ${sampleEntity.path}');
  }

  print('Folder structure generated.');
}
