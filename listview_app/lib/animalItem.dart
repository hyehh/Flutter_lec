class Animal{
  // 파일 이름은 중요하지 않음! class 이름이 중요한 것임!
  late String imagePath;
  late String animalName;
  late String kind;
  late bool flyExist;

  // flutter의 특징은 생성자를 통해 넘겨준다는 것임!
  // default 생성자 꼭 만들어야 함!
  Animal(
    // map 스타일 구성 (dictionary 스타일 구성)
    {
      // requried : 반드시 들어와야함! 이거 없으면 에러야~ 하는 의미!
      required this.animalName,
      required this.kind,
      required this.imagePath,
      required this.flyExist
    }
  );
}