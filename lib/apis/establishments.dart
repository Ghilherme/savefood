import 'package:flutter/material.dart';

class Establishments {
  final String name, establishmentDescription;
  final List<String> images;
  final int id;
  final Color color;
  final double lat;
  final double lng;
  final DateTime timeOpen;
  final DateTime timeClose;
  final String cuisineKind;
  final String address; //Street, number
  final String neighborhood;
  final String city;
  final String country;
  final String uf;

  // ignore: sort_constructors_first
  Establishments({
    this.id,
    this.images,
    this.name,
    this.establishmentDescription,
    this.color,
    this.lat,
    this.lng,
    this.timeOpen,
    this.timeClose,
    this.cuisineKind,
    this.address,
    this.neighborhood,
    this.city,
    this.country,
    this.uf,
  });
}

List<Establishments> establishments = [
  Establishments(
      id: 1,
      name: 'Padaria Brasileira',
      lat: -23.7088987,
      lng: -46.5464163,
      address: 'Rua Dr. Fláquer, 639',
      neighborhood: 'Centro',
      city: 'São Bernardo do Campo',
      country: 'BR',
      uf: 'SP',
      establishmentDescription:
          'Matinais, lanches seletos em pães especiais da casa com versões mini e doces de confeiteiro, em padaria fina.',
      images: [
        'assets/images/sopa_padaria_brasileira.jpg',
        'assets/images/coxinha_padaria_brasileira.jpg'
      ],
      timeOpen: DateTime.parse('20120227 06:30:00'),
      timeClose: DateTime.parse('20120227 22:20:00'),
      cuisineKind: 'Padaria',
      color: Color(0xFF3D82AE)),
  Establishments(
      id: 2,
      name: 'Zelão - O rei do caldo de mocotó',
      lat: -23.7054076,
      lng: -46.5535676,
      address: 'Rua Jurubatuba, 926',
      neighborhood: 'Centro',
      city: 'São Bernardo do Campo',
      country: 'BR',
      uf: 'SP',
      establishmentDescription:
          'Bar e restaurante despojado e intimista que serve especialidades tradicionais nordestinas em pratos e porções.',
      images: [
        'assets/images/cantina_zelao.png',
        'assets/images/cantina_zelao_parmegiana.png'
      ],
      timeOpen: DateTime.parse('20120227 11:00:00'),
      timeClose: DateTime.parse('20120227 23:00:00'),
      cuisineKind: 'Restaurante',
      color: Color(0xFFD3A984)),
];
