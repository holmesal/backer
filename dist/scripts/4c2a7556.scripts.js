(function(){"use strict";angular.module("podcastApp",["ngCookies","ngResource","ngSanitize","ngRoute","firebase"]).config(["$routeProvider","$locationProvider",function(a,b){return a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).when("/discover",{templateUrl:"views/discover.html",controller:"DiscoverCtrl"}).when("/login",{templateUrl:"views/login.html",controller:"LoginCtrl"}).when("/:vanity",{templateUrl:"views/feed.html",controller:"FeedCtrl",resolve:{feed:function(a,b){return a.getFeed(b.current.params.vanity)}}}).otherwise({redirectTo:"/"}),b.html5Mode(!0)}]).run(["$rootScope","$location",function(a,b){return a.notAllowed=["discover","login"],a.firebaseURL="http://podcast.firebaseio.com",a.$on("$routeChangeError",function(){return console.log("failed to change route - redirecting to landing"),b.path("/")})}])}).call(this),function(){"use strict";angular.module("podcastApp").controller("MainCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("podcastApp").controller("FeedCtrl",["$scope","$timeout","$window","feed",function(a,b,c,d){var e;return a.feed=d,a.subscribeText="Subscribed",a.subscribe=function(){return a.subscribed=!0,b(function(){return a.subscribeText="Opening in iTunes...",b(e,1e3)},2e3)},e=function(){return c.location="pcast://feeds.thisamericanlife.org/talpodcast",b(function(){return a.subscribeText="Subscribed"},1e3)}}])}.call(this),function(){"use strict";angular.module("podcastApp").service("User",["$rootScope","$firebase","$firebaseSimpleLogin","$q",function(a,b,c,d){var e,f,g,h,i;return g=d.defer(),i=new Firebase(a.firebaseURL),f=new FirebaseSimpleLogin(i,function(b,c){return b?g.reject(b):c?(a.authUser=c,g.resolve(c)):(a.authUser=null,a.user=null,g.reject("No user is logged in"))}),h=d.defer(),g.promise.then(function(c){var d;return d=i.child("users").child(c.id),a.user=b(d),a.$watch("user",function(a){return a?h.resolve(a):void 0})}),e={getAuthUser:function(){return a.authUser?a.authUser:g.promise},getUser:function(){return a.user?a.user:h.promise}}}])}.call(this),function(){"use strict";angular.module("podcastApp").service("Feed",["$rootScope","$firebase","$q",function(a,b,c){var d;return d={getFeed:function(b){var d,e;return console.log(b),d=c.defer(),e=new Firebase(""+a.firebaseURL+"/feeds/"+b),e.on("value",function(a){var b;return b=a.val(),console.log(b),b?(console.log("got feed"),d.resolve(b)):(console.log("no feed"),d.reject("No feed exists!"))},function(a){return console.error("Error getting feed from firebase"),console.error(a)}),d.promise}}}])}.call(this),function(){"use strict";angular.module("podcastApp").controller("DiscoverCtrl",["$scope","$rootScope","$firebase",function(a,b,c){var d;return d=new Firebase(""+b.firebaseURL+"/feeds"),a.feeds=c(d)}])}.call(this),function(){"use strict";angular.module("podcastApp").directive("navbar",function(){return{templateUrl:"views/partials/navbar.html",restrict:"E",link:function(){}}})}.call(this),function(){"use strict";angular.module("podcastApp").controller("LoginCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this);