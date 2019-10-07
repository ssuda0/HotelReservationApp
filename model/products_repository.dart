// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product> [
      Product(
        category: Category.accessories,
        id: 0,
        isFeatured: true,
        name: 'Polonia hotel',
        price: 120,
        location:'Angel Falls, Venezuela',
        detailDescription: 'Venezuela overflows with natural wonders, including the world\'s highest waterfall'
            '—the 3,212-foot cascades of Angel Falls, located in the UNESCO-protected Canaima National Park. Canaima is by '
            'far the country\'s most popular attraction, and the falls stretch an astounding 19 times higher than Niagara Falls. '
            'Bonus: Pixar animators used the location as inspiration for Paradise Falls in Up—so you know its good.',
      ),
      Product(
          category: Category.accessories,
          id: 1,
          isFeatured: true,
          name: 'SONEVA JANI, MALDIVES',
          price: 58,
          location: 'Antelope Canyon, Arizona',
          detailDescription: 'That\'s right, we put an entire continent on here. Although 99 percent of Antarctica is covered with ice, the landscape '
              'still manages to be stunningly diverse—surreal blue glaciers, active volcanoes, the rough waterways of the Drake Passage, '
              'and 360-degree views of untouched snow. And those views are made even better when an emperor penguin or humpback whale makes an appearance.',
      ),
      Product(
        category: Category.accessories,
        id: 2,
        isFeatured: false,
        name: 'ISE-SHIMA NATIONAL PARK',
        price: 35,
        location:'Angel Falls, Venezuela',
        detailDescription: 'Venezuela overflows with natural wonders, including the world\'s highest waterfall'
            '—the 3,212-foot cascades of Angel Falls, located in the UNESCO-protected Canaima National Park. Canaima is by '
            'far the country\'s most popular attraction, and the falls stretch an astounding 19 times higher than Niagara Falls. '
            'Bonus: Pixar animators used the location as inspiration for Paradise Falls in Up—so you know its good.',
      ),
      Product(
        category: Category.accessories,
        id: 3,
        isFeatured: true,
        name: 'SIX SENSES ZIL PASYON',
        price: 98,
        location: 'Antelope Canyon, Arizona',
        detailDescription: 'That\'s right, we put an entire continent on here. Although 99 percent of Antarctica is covered with ice, the landscape '
            'still manages to be stunningly diverse—surreal blue glaciers, active volcanoes, the rough waterways of the Drake Passage, '
            'and 360-degree views of untouched snow. And those views are made even better when an emperor penguin or humpback whale makes an appearance.',
      ),
      Product(
        category: Category.accessories,
        id: 4,
        isFeatured: false,
        name: 'Strut earrings',
        price: 34,
        location:'The Azores, Portugal',
        detailDescription: 'Venezuela overflows with natural wonders, including the world\'s highest waterfall'
            '—the 3,212-foot cascades of Angel Falls, located in the UNESCO-protected Canaima National Park. Canaima is by '
            'far the country\'s most popular attraction, and the falls stretch an astounding 19 times higher than Niagara Falls. '
            'Bonus: Pixar animators used the location as inspiration for Paradise Falls in Up—so you know its good.',
      ),
      Product(
        category: Category.accessories,
        id: 5,
        isFeatured: false,
        name: 'ALILA KOH RUSSEY',
        price: 12,
        location: 'Banff National Park, Canada',
        detailDescription: 'That\'s right, we put an entire continent on here. Although 99 percent of Antarctica is covered with ice, the landscape '
            'still manages to be stunningly diverse—surreal blue glaciers, active volcanoes, the rough waterways of the Drake Passage, '
            'and 360-degree views of untouched snow. And those views are made even better when an emperor penguin or humpback whale makes an appearance.',
      ),
      Product(
        category: Category.accessories,
        id: 6,
        isFeatured: false,
        name: 'Weave keyring',
        price: 16,
        location:'Angel Falls, Venezuela',
        detailDescription: 'Venezuela overflows with natural wonders, including the world\'s highest waterfall'
            '—the 3,212-foot cascades of Angel Falls, located in the UNESCO-protected Canaima National Park. Canaima is by '
            'far the country\'s most popular attraction, and the falls stretch an astounding 19 times higher than Niagara Falls. '
            'Bonus: Pixar animators used the location as inspiration for Paradise Falls in Up—so you know its good.',
      ),
      Product(
        category: Category.accessories,
        id: 7,
        isFeatured: true,
        name: 'Gatsby hat',
        price: 40,
        location: 'Atacama Desert, Chile',
        detailDescription: 'That\'s right, we put an entire continent on here. Although 99 percent of Antarctica is covered with ice, the landscape '
            'still manages to be stunningly diverse—surreal blue glaciers, active volcanoes, the rough waterways of the Drake Passage, '
            'and 360-degree views of untouched snow. And those views are made even better when an emperor penguin or humpback whale makes an appearance.',
      ),
      Product(
        category: Category.accessories,
        id: 8,
        isFeatured: true,
        name: 'Shrug bag',
        price: 198,
        location:'Angel Falls, Venezuela',
        detailDescription: 'Venezuela overflows with natural wonders, including the world\'s highest waterfall'
            '—the 3,212-foot cascades of Angel Falls, located in the UNESCO-protected Canaima National Park. Canaima is by '
            'far the country\'s most popular attraction, and the falls stretch an astounding 19 times higher than Niagara Falls. '
            'Bonus: Pixar animators used the location as inspiration for Paradise Falls in Up—so you know its good.',
      ),
      Product(
        category: Category.accessories,
        id: 9,
        isFeatured: true,
        name: 'Gilt desk trio',
        price: 58,
        location: 'Atacama Desert, Chile',
        detailDescription: 'That\'s right, we put an entire continent on here. Although 99 percent of Antarctica is covered with ice, the landscape '
            'still manages to be stunningly diverse—surreal blue glaciers, active volcanoes, the rough waterways of the Drake Passage, '
            'and 360-degree views of untouched snow. And those views are made even better when an emperor penguin or humpback whale makes an appearance.',
      ),
    ];
    if (category == Category.accessories) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
