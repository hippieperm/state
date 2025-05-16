class Region {
  final String id; // 지역 식별자 (예: seoul, gyeonggi 등)
  final String name; // 지역 이름 (예: 서울특별시, 경기도 등)
  final List<String> subRegions; // 하위 지역 목록 (예: 강남구, 마포구 등)

  const Region({
    required this.id,
    required this.name,
    required this.subRegions,
  });
}

// 지역 데이터
final List<Region> regionList = [
  const Region(
    id: 'seoul',
    name: '서울특별시',
    subRegions: [
      '강남구',
      '강동구',
      '강북구',
      '강서구',
      '관악구',
      '광진구',
      '구로구',
      '금천구',
      '노원구',
      '도봉구',
      '동대문구',
      '동작구',
      '마포구',
      '서대문구',
      '서초구',
      '성동구',
      '성북구',
      '송파구',
      '양천구',
      '영등포구',
      '용산구',
      '은평구',
      '종로구',
      '중구',
      '중랑구'
    ],
  ),
  const Region(
    id: 'gyeonggi',
    name: '경기도',
    subRegions: [
      '고양시',
      '과천시',
      '광명시',
      '광주시',
      '구리시',
      '군포시',
      '김포시',
      '남양주시',
      '동두천시',
      '부천시',
      '성남시',
      '수원시',
      '시흥시',
      '안산시',
      '안성시',
      '안양시',
      '양주시',
      '여주시',
      '오산시',
      '용인시',
      '의왕시',
      '의정부시',
      '이천시',
      '파주시',
      '평택시',
      '포천시',
      '하남시',
      '화성시',
      '가평군',
      '양평군',
      '연천군'
    ],
  ),
  const Region(
    id: 'incheon',
    name: '인천광역시',
    subRegions: [
      '계양구',
      '남동구',
      '동구',
      '미추홀구',
      '부평구',
      '서구',
      '연수구',
      '중구',
      '강화군',
      '옹진군'
    ],
  ),
];
