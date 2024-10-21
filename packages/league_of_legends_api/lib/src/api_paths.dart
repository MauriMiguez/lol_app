/// Base URL for the League of Legends API.
const dataDragonUrl = 'ddragon.leagueoflegends.com';

/// Content Delivery Network (CDN) path for the League of Legends API.
const cdnVersionPath = 'cdn/14.20.1';

/// Path to fetch the list of champions.
const championPath = '$cdnVersionPath/data/en_US/champion.json';

/// Path to fetch the details of a champion.
const championDetailsPath = '$cdnVersionPath/data/en_US/champion/';

/// Path to fetch the square image of a champion.
const championSquareImagePath =
    'https://$dataDragonUrl/$cdnVersionPath/img/champion/';

/// Path to fetch the loading image of a champion.
const championLoadingImagePath =
    'https://$dataDragonUrl/cdn/img/champion/loading/';

/// Path to fetch the splash image of a champion.
const championSplashImagePath =
    'https://$dataDragonUrl/cdn/img/champion/splash/';
