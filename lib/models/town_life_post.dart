class TownLifePost {
  final String category;
  final String title;
  final String content;
  final String location;
  final String timeAgo;
  final int commentCount;
  final int likeCount;
  final String? imageUrl;

  TownLifePost({
    required this.category,
    required this.title,
    required this.content,
    required this.location,
    required this.timeAgo,
    required this.commentCount,
    required this.likeCount,
    this.imageUrl,
  });
}

// 더미 데이터
final List<TownLifePost> dummyTownLifePosts = [
  TownLifePost(
    category: '우리동네질문',
    title: '이 동네 맛집 추천해주세요',
    content:
        '이사온지 얼마 안 됐는데, 이 동네 맛집 어디 있을까요? 특히 분위기 좋은 카페나 맛있는 식당 추천 부탁드립니다. 친구들이 놀러 올 때 데려가고 싶어요.',
    location: '서울시 강남구',
    timeAgo: '10분 전',
    commentCount: 5,
    likeCount: 3,
  ),
  TownLifePost(
    category: '동네소식',
    title: '내일 ○○공원에서 벼룩시장 열립니다',
    content:
        '내일 오전 10시부터 오후 4시까지 ○○공원에서 주민 벼룩시장이 열립니다. 많은 참여 부탁드립니다. 아이들 용품, 의류, 생활용품 등 다양한 물건들이 저렴하게 판매될 예정입니다.',
    location: '서울시 마포구',
    timeAgo: '1시간 전',
    commentCount: 12,
    likeCount: 24,
    imageUrl: 'https://images.unsplash.com/photo-1506706435692-290e0c5b4505',
  ),
  TownLifePost(
    category: '해주세요',
    title: '전기자전거 수리 가능하신 분 계신가요?',
    content:
        '전기자전거가 갑자기 고장났는데, 동네에서 수리 가능하신 분 있을까요? 모터 부분에 문제가 있는 것 같아요. 사진도 첨부합니다.',
    location: '서울시 송파구',
    timeAgo: '3시간 전',
    commentCount: 2,
    likeCount: 0,
    imageUrl: 'https://images.unsplash.com/photo-1485965120184-e220f721d03e',
  ),
  TownLifePost(
    category: '일상',
    title: '동네 고양이 근황',
    content:
        '매일 아침 우리 집 앞에 오는 고양이예요. 이제는 먹이를 주면 도망가지 않고 옆에서 먹네요. 귀엽지 않나요? 이름을 뭐라고 지을까 고민중입니다.',
    location: '서울시 용산구',
    timeAgo: '5시간 전',
    commentCount: 18,
    likeCount: 32,
    imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba',
  ),
  TownLifePost(
    category: '동네맛집',
    title: '새로 생긴 빵집 강추합니다',
    content:
        '어제 새로 오픈한 ○○베이커리 가봤어요. 크로와상이 정말 맛있어요! 오픈 세일 중이라 가격도 저렴하고 사장님도 친절하세요. 동네 주민이라고 하면 10% 할인도 해주신다고 하니 참고하세요.',
    location: '서울시 성동구',
    timeAgo: '7시간 전',
    commentCount: 7,
    likeCount: 15,
  ),
];
