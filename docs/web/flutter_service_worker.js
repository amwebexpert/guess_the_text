'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "45097b3247abf7aef390ab704271f961",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"assets/shaders/ink_sparkle.frag": "b71fa3f199ebfdae68a27100f6ba8b41",
"assets/NOTICES": "9b162236be3aadb3ee485ae5a69505ba",
"assets/assets/images/drawer-header.svg": "04d10899e89c0b5d016b9838ce5abd20",
"assets/assets/images/splash.png": "d077fcd446b9a90904307f86d1a8ee62",
"assets/assets/images/work-in-progress.svg": "d0f8477496b433efe9d4c3f3b9c5e13d",
"assets/assets/images/game/success.svg": "63bf6f43a6dc8dfd16c41f85dfa30ba8",
"assets/assets/images/game/hangman-06.svg": "a4994cc5eca896bbc3b4baca5a3d3e0d",
"assets/assets/images/game/hangman-10.svg": "37e93ec40b7482bc1344fe2b57e087a2",
"assets/assets/images/game/hangman-04.svg": "1f7b3bae90d1bd734dee3613d0eade71",
"assets/assets/images/game/hangman-05.svg": "e46ca28266e2d411cc08b1660f43e616",
"assets/assets/images/game/hangman-09.svg": "577ff8349cbc2b5fb73d93ade9285e27",
"assets/assets/images/game/hangman-03.svg": "388943d3ad05d534e2e86b214fe36af1",
"assets/assets/images/game/fail.svg": "f089265c50feee4f8133b60f4bcacca5",
"assets/assets/images/game/hangman-02.svg": "c2576534a671f0f78c0fa1a03f37cb00",
"assets/assets/images/game/hangman-07.svg": "4f937fd8917539f96254932939a452ad",
"assets/assets/images/game/hangman-01.svg": "da38574eb8b69b92c5d58ac428e1a41b",
"assets/assets/images/game/hangman-08.svg": "cdc943280ae3af4ff6aeb680d6c2e898",
"assets/assets/images/game/hangman-happy.svg": "96dc2b7de913df7ea7139aa20291edda",
"assets/assets/images/happy_robot_remix.svg": "ec3b52bd0a58e9e121dd6ef295c81512",
"assets/assets/images/backgrounds/background-pexels-pixabay-461940.jpg": "18efea87f640410625f669235fdb4c46",
"assets/assets/images/backgrounds/beach-sun.jpg": "40a390da4752a037e883da03758b761a",
"assets/assets/fonts/OFL.txt": "b117924592ddee79b545b76597291fbe",
"assets/assets/fonts/IndieFlower-Regular.ttf": "0841af952c807bdf56455b1addb4c7df",
"assets/assets/animations/loading/79657-child-learning.json": "67e16b9c673491d27ea98104f408637e",
"assets/assets/animations/loading/81489-writing.json": "e6e8ccbe0cf4180687a970b9fdbe2f26",
"assets/assets/animations/loading/80356-online-learning.json": "176e184d3d194e7e598035cdce3f8eef",
"assets/assets/animations/loading/74821-blogging-writing-typing-development-activity.json": "24cecd9cd58ac0aa18c9fd4d09107739",
"assets/assets/animations/loading/74586-learning-concept.json": "d5b5d7b448dde11d31186edd56c9ae37",
"assets/assets/animations/loading/86233-man-writing.json": "c9d37a30c51150aee15c1b3802cddb69",
"assets/assets/animations/loading/18365-animaton-for-e-learning-web-site.json": "d52c64158bef4e7e83e2218ec214e2a0",
"assets/assets/animations/loading/86671-online-learning.json": "cdc1b02ef3cd2bbbd366fb91f014bc8b",
"assets/assets/animations/loading/17793-illustration.json": "24b7985a6c66765654fba88c312cce7f",
"assets/assets/animations/loading/32624-pt-writing-assistant.json": "9a35f3c56b45e402ee97f6658197be66",
"assets/assets/animations/loading/23486-reading-a-book.json": "a94d544cd9f89167457942b74bf78bc7",
"assets/assets/animations/loading/35235-reading.json": "d3fbdc3bd0acfa5bbf87b1899423d9b8",
"assets/assets/animations/loading/61026-password.json": "58ee86f394c29ca64c4479d2739c07f3",
"assets/assets/animations/loading/58305-guestlist.json": "81a1da49b98de78f6a21115f99d02ddd",
"assets/assets/animations/loading/87735-distance-learning.json": "06fea034aa0f17d01a3143d54bb05e6a",
"assets/assets/animations/loading/79960-learning.json": "a9ec75261501f7d1fdebe5d0161ddbcd",
"assets/assets/animations/loading/26540-blogging-writing-typing.json": "2cc290a05fc616adbe9cc7bb5111a892",
"assets/assets/animations/loading/42293-get-things-done.json": "5c7e269d32daf5a1a3274e8bface5cc3",
"assets/assets/animations/loading/24827-learn.json": "be3b3fdb15e35dbd24383f0a36e563a1",
"assets/assets/animations/loading/92377-quiz-mode.json": "dc22fb5a1f7d7d272958bd2cce60a73d",
"assets/FontManifest.json": "36b3262214f236f04c078ff2dc00f4a9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/AssetManifest.json": "df510c9c5f27907ac6a3b5348519cc58",
"icons/Icon-maskable-192.png": "042fcc06f796e8fc1f179402d17cd792",
"icons/Icon-512.png": "fe198d3fe2ad40b07da94825477692db",
"icons/Icon-192.png": "042fcc06f796e8fc1f179402d17cd792",
"icons/Icon-maskable-512.png": "fe198d3fe2ad40b07da94825477692db",
"index.html": "67008b796811a8a7bdd0500adff79180",
"/": "67008b796811a8a7bdd0500adff79180",
"manifest.json": "048b617a00c0dae373325b46fda9a927",
"main.dart.js": "7894b09fc7c62d7018288f76be7c3de7",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"favicon.png": "9fb7c9137d1c77d5eb06c55cb5d8288c",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "051d090817004f223014d935c4396f01",
"splash/img/dark-3x.png": "1519beb7003e885d49a123cd18319a6b",
"splash/img/dark-1x.png": "f0e7868016683d0fe3ed3edc98c928d0",
"splash/img/light-2x.png": "88e6754b5b6566ddcb7457020186d5ad",
"splash/img/light-1x.png": "f0e7868016683d0fe3ed3edc98c928d0",
"splash/img/light-3x.png": "1519beb7003e885d49a123cd18319a6b",
"splash/img/dark-2x.png": "88e6754b5b6566ddcb7457020186d5ad",
"splash/img/dark-4x.png": "92ac41a5cdbe2953dcca7cfd28398851",
"splash/img/light-4x.png": "92ac41a5cdbe2953dcca7cfd28398851"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
