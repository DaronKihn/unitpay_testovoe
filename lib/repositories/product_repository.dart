import 'dart:async';
import 'dart:math';
import 'package:unitpay_testovoe/models/item.dart';

class ProductRepository {
  final _random = Random();
  StreamController _streamController = StreamController<List>();
  Stream get productsUpdates => _streamController.stream;

  static List<Item> items = [
    Item(
        label: 'Пицца',
        url:
            'http://dgdesign.ru/uploads/posts/2019-10/1572110889_picca-na-prozrachnom-fone-lsekgjtnelejqkdh.png'),
    Item(
        label: 'Мед',
        url:
            'http://dgdesign.ru/uploads/posts/2021-01/1611673115_med-na-prozrachnom-fone-huruiey.png'),
    Item(
        label: 'Сэндвич',
        url:
            'http://dgdesign.ru/uploads/posts/2019-10/thumbs/1569915598_buterbrod-na-prozrachnom-fone-sisjloxpwg.png'),
    Item(
        label: 'Торт',
        url:
            'http://dgdesign.ru/uploads/posts/2019-05/1556978248_kusok-torta-na-prozrachnom-fone-4322213113311.png'),
    Item(
        label: 'Мороженое',
        url:
            'http://dgdesign.ru/uploads/posts/2019-07/thumbs/1562676429_kartinka-na-prozrachnom-fone-morozhenoe-rtdyuiyesk.png'),
  ];

  List<Item> generatedList = List.generate(100000, (index) {
    return items[index - index + Random().nextInt(items.length)];
  });

  void addFirstGeneratedListToStream() {
    _streamController.add(generatedList);
  }

  get getList => generatedList;

  void addElement() {
    generatedList.insert(0, items[_random.nextInt(items.length)]);
    _streamController.add(getList);
  }

  void removeElement(int index) {
    generatedList.removeAt(index);
    _streamController.add(getList);
  }
}
