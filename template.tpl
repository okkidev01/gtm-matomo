___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Okki Matomo Tracking Tag",
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAYAAAByUDbMAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAwNi8wMi8yMgs8GX8AAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAABsklEQVQ4jaWTQUhVQRSGvy4qKLUIJKiFG4Uz5Egg8WhVELiKAkUKAle5dFsgCLYMItC10KqNtAojIogWKaSulAOdWYlgm1oE9XBh2HXx5vLm3d59z/CH4fxz5sw//wxzyPOcqmGjIjYq9zvVpCOjO1aDdx+Cd4PdCruJHcU4AXwN3l0+i9ithA8CX4pJ8K7vf8WeluZDwbuXkS8F71rWz+V53lYleLcCzFYcch54BswBl0TtR4uz4N148O5x5I86CAG8AHojf/2Ps+DdLtAPTAG7HYQK/EkEb4ra5ywKjQBjwJUKoTrwrpTrTfgSNK+5GONAhYu6qN0BnlSsjwfvhrPgXT/woE3BMbAW+XsAUXtO4+Hb4W4G3C5ZLrAqaveA78BGkRS1eeBTm/qrPUCt4qS5GGvRZYoZ4KCUO8xotkyKZVH7GZ3si1rLRlH7BmyV9qxlwJtS8hhYqHCbwhJ+IGofM1FT4gNHvBW1+inE0qtPQ/NrTAJ7ke+cQgjgRoyzorYJrR1wAViPJ14Xtb9VKsG7MRqfe0bUXhX5noKI2m/gWvDuIY1G/tXB1UWgJmrbafIETKeymaj2iC4AAAAASUVORK5CYII\u003d"
  },
  "description": "Okki Matomo Tracking Tag",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "idSite",
    "displayName": "Matomo idSite",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "siteUrl",
    "displayName": "site domain",
    "simpleValueType": true,
    "help": "The site domian you want to track data into, exp: *.cnmingyang.com.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "cmsUrl",
    "displayName": "cms url",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "defaultValue": "https://cms.xiaoman.cn"
  },
  {
    "type": "TEXT",
    "name": "matomoUrl",
    "displayName": "matomo url",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "defaultValue": "https://matomo.datasanalytics.com/"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
var log = require('logToConsole');
var createQueue = require('createQueue');
var injectScript = require('injectScript');
const getQueryParameters = require('getQueryParameters');
const getUrl = require('getUrl');
const readTitle = require('readTitle');
const getCookieValues = require('getCookieValues');
const sendPixel= require('sendPixel');

log('data =', data);

var onSuccess = function() {
  log('Tracker.js loaded successfully');
  data.gtmOnSuccess();
};

var onFailure = function() {
  log('Tracker.js loading failed');
  data.gtmOnFailure();
};

if (data.idSite && data.siteUrl) {
  log('data =', data, getUrl());
  
  var _paq = createQueue('_paq');

  var query = getUrl('query');
  if (query.indexOf('gclid=') > -1) {
    var id = getQueryParameters('gclid');
    var domain = getUrl('host');
    var url = data.cmsUrl+ '/shop-api/External/Gclid?gclid=' + id + '&domain=' + domain;
    sendPixel(url);
  }

  var gclid = getCookieValues('gclid');
  if (gclid) {
    _paq(['setCustomDimension', {customDimensionId: 4, customDimensionValue: gclid}]);
  }

  _paq(['setDocumentTitle', getUrl('host') + '/' + readTitle()]);
  _paq(['setCookieDomain', data.siteUrl]);
  _paq(['trackPageView']);
  _paq(['enableLinkTracking']);


  _paq(['setTrackerUrl', data.matomoUrl + 'matomo.php']);
  _paq(['setSiteId', data.idSite]);

  var trackingJSURL = 'https://shopcdnpro.grainajz.com/tpl-common/common/js/matomo.js';
  log('injecting script: ' + trackingJSURL);
  injectScript(trackingJSURL, onSuccess, onFailure, trackingJSURL);
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_paq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://shopcdnpro.grainajz.com/tpl-common/common/js/matomo.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_title",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: should_load_matomo_js
  code: |-
    const mockData = {
       "idSite":"3",
      "cmsUrl": "https://cms.xiaoman.cn",
      "matomoUrl": "https://matomo.datasanalytics.com/",
      "siteUrl": "*.cnmingyang.com"
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 2024/11/12 15:49:27


