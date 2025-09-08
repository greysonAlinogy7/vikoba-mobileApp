class SliderModel {
  String image;
  String title;
  String description;

  SliderModel({
    required this.image,
    required this.title,
    required this.description,
  });

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  static List<SliderModel> getslides() => [
    SliderModel(
      image: 'assets/bag.png', // Path to the image
      title: 'karibu kikoba kidigitali',
      description: 'furahi kucheza vikoba kupitia jukwaa letu',
    ),
    SliderModel(
      image: 'assets/mikoba.png',
      title: 'wekeza na vikoba',
      description: 'Tambua fursa na malengo makubwa ya vikoba',
    ),
    SliderModel(
      image: 'assets/myshop.png',
      title: 'Anza leo',
      description: 'Jiunge leo ili ukuze uchumi wako',
    ),
    SliderModel(
      image: 'assets/vikoba.png',
      title: 'Anza kucheza',
      description: 'Jiunge na washirika mbalimbali wa vikoba',
    ),
  ];
}
