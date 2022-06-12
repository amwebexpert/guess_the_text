'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "51ff6a37bacc069ad44f6671a570460d",
"index.html": "62a976917632695108492bc83b217c2e",
"/": "62a976917632695108492bc83b217c2e",
"main.dart.js": "d627f83db7800e99d2c3570507d193cd",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"favicon.png": "2d9cacf839d7619705624ea318d55b7a",
"icons/Icon-192.png": "2aaef2422b9bb9c1ca8ddc0033615e94",
"icons/Icon-maskable-192.png": "2aaef2422b9bb9c1ca8ddc0033615e94",
"icons/Icon-maskable-512.png": "300f9432036fe9a7705e971bc46badae",
"icons/Icon-512.png": "300f9432036fe9a7705e971bc46badae",
"manifest.json": "86d241a8868e3c2ad06a1d833e439c3d",
"assets/AssetManifest.json": "c0a62a7a5e1483bd740cc408d17e0d1a",
"assets/NOTICES": "ab3f6fc1f4a71068594bc770a5b265f2",
"assets/FontManifest.json": "36b3262214f236f04c078ff2dc00f4a9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/hangman-09.svg": "fb75bd42ec896b9fcca5345da23c321f",
"assets/assets/images/hangman-08.svg": "3ae50e1edf40333b6cb3790733f42e6c",
"assets/assets/images/drawer-header.png": "7ce8501e939d09069af0f0a47f4b9b9a",
"assets/assets/images/backgrounds/background-pexels-pixabay-461940.jpg": "18efea87f640410625f669235fdb4c46",
"assets/assets/images/backgrounds/beach-sun.jpg": "40a390da4752a037e883da03758b761a",
"assets/assets/images/splash.png": "3015bca1e05e8b2858bb955c4819361b",
"assets/assets/images/fail.svg": "f089265c50feee4f8133b60f4bcacca5",
"assets/assets/images/hangman-03.svg": "5f3f90b523f148f308e719a1743487d6",
"assets/assets/images/success.svg": "63bf6f43a6dc8dfd16c41f85dfa30ba8",
"assets/assets/images/hangman-happy.svg": "b70672e5ef7e441f0276fc0fd5713803",
"assets/assets/images/hangman-02.svg": "733532bad1efcd35532f81e17cf54be5",
"assets/assets/images/hangman-01.svg": "da38574eb8b69b92c5d58ac428e1a41b",
"assets/assets/images/hangman-05.svg": "e6ef31144a17ab365915dbf87db269e3",
"assets/assets/images/hangman-04.svg": "f24621d589fdf5bb486a445c2ab536a7",
"assets/assets/images/hangman-10.svg": "707bbad782fc30e573e4b75d9d32c8b7",
"assets/assets/images/hangman-06.svg": "ef22b5b1cdfc68e4bdc53ece3def8d5f",
"assets/assets/images/hangman-07.svg": "38d1fc75d5880499f96bb16d18fc0bae",
"assets/assets/fonts/IndieFlower-Regular.ttf": "0841af952c807bdf56455b1addb4c7df",
"assets/assets/fonts/OFL.txt": "b117924592ddee79b545b76597291fbe",
"assets/assets/animations/loading/69067-education-blue.json": "141d290760d64d76e66ce463c666c49e",
"assets/assets/animations/loading/92377-quiz-mode.json": "dc22fb5a1f7d7d272958bd2cce60a73d",
"assets/assets/animations/loading/79960-learning.json": "a9ec75261501f7d1fdebe5d0161ddbcd",
"assets/assets/animations/loading/74586-learning-concept.json": "d5b5d7b448dde11d31186edd56c9ae37",
"assets/assets/animations/loading/19857-learn-more-about-something.json": "33b9d896c72563b9131127ccb4be7651",
"assets/assets/animations/loading/23486-reading-a-book.json": "a94d544cd9f89167457942b74bf78bc7",
"assets/assets/animations/loading/87613-education2.json": "8c07d62959f085b406565e023fe068b8",
"assets/assets/animations/loading/91178-easy-to-learn.json": "00f0d9bf37268502362924c5b20ba755",
"assets/assets/animations/loading/24827-learn.json": "be3b3fdb15e35dbd24383f0a36e563a1",
"assets/assets/animations/loading/86671-online-learning.json": "cdc1b02ef3cd2bbbd366fb91f014bc8b",
"assets/assets/animations/loading/18365-animaton-for-e-learning-web-site.json": "d52c64158bef4e7e83e2218ec214e2a0",
"assets/assets/animations/loading/35235-reading.json": "d3fbdc3bd0acfa5bbf87b1899423d9b8",
"assets/assets/animations/loading/87735-distance-learning.json": "06fea034aa0f17d01a3143d54bb05e6a",
"assets/assets/animations/loading/80356-online-learning.json": "176e184d3d194e7e598035cdce3f8eef",
"assets/assets/animations/loading/79657-child-learning.json": "67e16b9c673491d27ea98104f408637e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
