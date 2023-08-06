class DummyData {
  List<String> bookCovers = [
    'https://m.media-amazon.com/images/I/71-++hbbERL.jpg',
    'https://media.harrypotterfanzone.com/deathly-hallows-us-childrens-edition.jpg',
    'https://static.wikia.nocookie.net/harrypotter/images/7/7b/Harry01english.jpg/revision/latest/scale-to-width-down/250?cb=20150208225304',
    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2016%2F09%2F9781408855652-png.jpg',
    'https://hips.hearstapps.com/digitalspyuk.cdnds.net/15/50/1449878132-9781781100264.jpg',
    'https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2014/7/30/1406719264487/fd90e162-93de-41b1-aea5-f8e49227e85b-1360x2040.jpeg?width=700&quality=85&auto=format&fit=max&s=28732c5a7caa1d1249d3f420e247479b',
    'https://i.pinimg.com/originals/27/cf/91/27cf91f605923223613909c7b9d2219f.jpg',
    'https://m.media-amazon.com/images/I/71q7-bs1nvL.jpg',
    'https://images.penguinrandomhouse.com/cover/9780345539434',
    'https://m.media-amazon.com/images/I/814fRILnbnL.jpg',
    'https://images.ctfassets.net/usf1vwtuqyxm/3d9kpFpwHyjACq8H3EU6ra/85673f9e660407e5e4481b1825968043/English_Harry_Potter_4_Epub_9781781105672.jpg?w=914&q=70&fm=jpg',
  ];

  List<String> categories = [
    'Romance',
    'Mystery, Thriller & Suspense',
    'Science Fiction & Fantasy',
    'Literature & Fiction',
    'Biographies & Memoirs',
    'Children’s eBooks',
  ];

  String get getRandomBookCover {
    bookCovers.shuffle();
    return bookCovers.first;
  }
}
