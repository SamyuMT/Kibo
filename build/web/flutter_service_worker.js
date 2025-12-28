'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "9237270d8c3335e652fc722356551822",
"version.json": "30ed526f4083650754411a094e6e8057",
"index.html": "95e80eb949cdf4ee7287aaf896b4b99f",
"/": "95e80eb949cdf4ee7287aaf896b4b99f",
"main.dart.js": "d29c57a62c232dea4c722607c025ba22",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "263f2283fcee8dbaf1f4b4069a140be3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "fc6d58d06e7b0ae32069551dd67e4901",
"assets/AssetManifest.json": "e6733fe074737cf284ac34815e7e86a5",
"assets/NOTICES": "8575a4f71bd3f3e6019b8dac5527d440",
"assets/FontManifest.json": "fb4c38e4e7678cc2ef9dbb4d8d802bad",
"assets/AssetManifest.bin.json": "553306afa6eaf1f98ad4d73a48fe3fac",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2ca04f4f9bb2ab07b24604810a5f1661",
"assets/fonts/MaterialIcons-Regular.otf": "06e0e889db68344ec9bb0206b38546a1",
"assets/assets/images/Metricas.svg": "3cea9a62d7e3150fac4d0107925b06a2",
"assets/assets/images/ajutesAlarma.svg": "b229d560142ced3698953e2406a3a8fa",
"assets/assets/images/icon_negativo.svg": "d660ed728d9ffeeca97481e65d810696",
"assets/assets/images/pulse_alert.svg": "7db7e9943f4cfc5a65dff6bddc783a14",
"assets/assets/images/apple_logo.svg": "975721b8f69cc2726990ef6a616bb926",
"assets/assets/images/icon_positivo.svg": "e41278a1dbb2d4a4a439de99d007b118",
"assets/assets/images/NavRect.svg": "6805dc1246ecdfbf4134df77e1c0777e",
"assets/assets/images/AjustesUnion.svg": "e718db36a40555352b4fa586eb970a8a",
"assets/assets/images/Corazon.svg": "aee53f45518365ef70e10af18c482959",
"assets/assets/images/bluetooth.svg": "e71b59e692d34b844174586b8fce1ce4",
"assets/assets/images/Reportes.svg": "9e0d15f61e5af957eb471fa5316f8cb1",
"assets/assets/images/Noticias.svg": "9235ad170ee78b9a1ae1a42081e1d286",
"assets/assets/images/Union.svg": "86e35da55ad94c11535d4151e243baae",
"assets/assets/images/HomeP.svg": "ef556ec3f3e058ab78234822b30c02d8",
"assets/assets/images/user_icon.png": "0189693d425ea4a9ecd9802669d3efde",
"assets/assets/images/calendario.svg": "9e0d15f61e5af957eb471fa5316f8cb1",
"assets/assets/images/corazon_icon.svg": "b24c4e33b9c02fd5723792b1bc5ec1f3",
"assets/assets/images/bxs_smile.svg": "f1b2c35e5444f58f615e4dadd505bcd4",
"assets/assets/images/Editar.svg": "3a7fb8c7fb897ed53cedcf4cb55b465d",
"assets/assets/images/facebook_log.svg": "c256cc3879772d0e55c26e2c3963123d",
"assets/assets/images/google_logo.svg": "8124ef42e3b9427c467ade06e0853937",
"assets/assets/images/KIBO.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/images/arrow_forward.svg": "c7f911a691fc20174034f1f9e5099acd",
"assets/assets/images/image.jpg": "14b0f0d9d197e892639446dfb65ff53f",
"assets/assets/sounds/cardiaco.mp3": "23ade389e4b8b53e011fce0212ef6ca1",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/assets/vector/vector.csv": "40d42487f7225d015f3572e041924ea0",
"assets/assets/vector/full_tiempo_2760.00.csv": "ddb0a81ccd10ff4c05f0e82ff4cd23eb",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
