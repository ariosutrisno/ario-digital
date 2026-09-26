import 'package:flutter_test/flutter_test.dart';
import 'package:portofolio/ario_digital/core/site_data.dart';

void main() {
  test('service catalog covers the advertised business needs', () {
    expect(services, hasLength(8));
    expect(services.map((service) => service.number).toSet(), hasLength(8));
    expect(services.map((service) => service.title), contains('Landing page'));
    expect(services.map((service) => service.title), contains('Maintenance'));
  });

  test('project demonstrations are explicitly categorized', () {
    expect(projects, hasLength(3));
    expect(projects.every((project) => project.category.isNotEmpty), isTrue);
    expect(
      projects.every((project) => project.technologies.isNotEmpty),
      isTrue,
    );
  });

  test('frequently asked questions have both questions and answers', () {
    expect(faqs, hasLength(6));
    expect(faqs.every((item) => item.question.isNotEmpty), isTrue);
    expect(faqs.every((item) => item.answer.isNotEmpty), isTrue);
  });
}
