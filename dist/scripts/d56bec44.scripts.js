(function(){"use strict";angular.module("podcastApp",["ngCookies","ngResource","ngSanitize","ngRoute","firebase","ngAnimate"]).config(["$routeProvider","$locationProvider",function(a,b){return a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).when("/discover",{templateUrl:"views/discover.html",controller:"DiscoverCtrl"}).when("/login",{templateUrl:"views/login.html",controller:"LoginCtrl"}).when("/dashboard",{templateUrl:"views/dashboard.html",controller:"DashboardCtrl"}).when("/:vanity",{templateUrl:"views/feed.html",controller:"FeedCtrl",resolve:{feed:function(a,b){return a.getFeed(b.current.params.vanity)}}}).otherwise({redirectTo:"/"}),b.html5Mode(!0)}]).run(["$rootScope","$location",function(a,b){return a.notAllowed=["discover","login"],a.firebaseURL="http://podcast.firebaseio.com",a.$on("$routeChangeError",function(){return console.log("failed to change route - redirecting to landing"),b.path("/")}),FastClick.attach(document.body)}])}).call(this),function(){"use strict";angular.module("podcastApp").controller("MainCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("podcastApp").controller("FeedCtrl",["$scope","$timeout","$window","feed",function(a,b,c,d){var e;return a.feed=d,a.feed.levels=[{cost:2,name:"Broke-Ass Fan",icon:"grad",perks:[{text:"Private Access to Pre-tape episode live feed (not available to the public)"},{text:"TWiST list Email Group"},{text:"Guaranteed seat at TWiST Live Events"},{text:"Twitter thank you"},{text:"First dibs to appear on Ask Jason"}]},{cost:20,name:"Fan",icon:"bbcap",perks:[{text:"This Week in Startups messenger bag"},{text:"25% off all LAUNCH event tickets",image:"http://www.valleyvet.com/images/worming-your-kitten.png"},{text:"Access to Show Discussions on Guests and Themes"}]},{cost:100,name:"Super Fan",icon:"crown",perks:[{text:"On air thank you"},{text:"Bronze Pro Subscription to the LAUNCH Ticker (http://launch.co/promembership)"},{text:"Office Hours Golden Ticket for TWiST Live events"},{text:"Visit the Studio for a live taping!"}]},{cost:200,name:"Uber Fan",icon:"crown",perks:[{text:"On air thank you"},{text:"Bronze Pro Subscription to the LAUNCH Ticker (http://launch.co/promembership)"},{text:"Office Hours Golden Ticket for TWiST Live events"},{text:"Visit the Studio for a live taping!"}]}],a.currentLevel=-2,b(function(){return a.currentLevel=0},1e3),a.levelUp=function(){return a.currentLevel<a.feed.levels.length-1?a.currentLevel+=1:void 0},a.levelDown=function(){return a.currentLevel>0?a.currentLevel-=1:void 0},a.getCoverImage=function(a){return"url('"+a.coverImage+"')"},a.$on("keyDown",function(b,c){switch(console.log(c),console.log(c.which),c.which){case 39:return a.levelUp();case 37:return a.levelDown()}}),a.subscribeText="Subscribed",a.subscribe=function(){return a.subscribed=!0,b(function(){return a.subscribeText="Opening in iTunes...",b(e,1e3)},2e3)},e=function(){return c.location="pcast://feeds.thisamericanlife.org/talpodcast",b(function(){return a.subscribeText="Subscribed"},1e3)}}])}.call(this),function(){"use strict";angular.module("podcastApp").service("User",["$rootScope","$firebase","$firebaseSimpleLogin","$q",function(a,b,c,d){var e,f,g,h,i;return g=d.defer(),i=new Firebase(a.firebaseURL),f=new FirebaseSimpleLogin(i,function(b,c){return b?g.reject(b):c?(a.authUser=c,g.resolve(c)):(a.authUser=null,a.user=null,g.reject("No user is logged in"))}),h=d.defer(),g.promise.then(function(c){var d;return d=i.child("users").child(c.id),a.user=b(d),a.$watch("user",function(a){return a?h.resolve(a):void 0})}),e={getAuthUser:function(){return a.authUser?a.authUser:g.promise},getUser:function(){return a.user?a.user:h.promise}}}])}.call(this),function(){"use strict";angular.module("podcastApp").service("Feed",["$rootScope","$firebase","$q",function(a,b,c){var d;return d={getFeed:function(b){var d,e;return console.log(b),d=c.defer(),e=new Firebase(""+a.firebaseURL+"/feeds/"+b),e.on("value",function(a){var b;return b=a.val(),console.log(b),b?(console.log("got feed"),d.resolve(b)):(console.log("no feed"),d.reject("No feed exists!"))},function(a){return console.error("Error getting feed from firebase"),console.error(a)}),d.promise}}}])}.call(this),function(){"use strict";angular.module("podcastApp").controller("DiscoverCtrl",["$scope","$rootScope","$firebase",function(a,b,c){var d;return d=new Firebase(""+b.firebaseURL+"/feeds"),a.feeds=c(d)}])}.call(this),function(){"use strict";angular.module("podcastApp").directive("navbar",function(){return{templateUrl:"views/directives/navbar.html",restrict:"E",link:function(){}}})}.call(this),function(){"use strict";angular.module("podcastApp").controller("LoginCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("podcastApp").directive("odometer",["$timeout",function(){return{templateUrl:"views/directives/odometer.html",restrict:"E",replace:!0,scope:{cost:"="},link:function(a,b){var c;return a.hundredsOdo=new Odometer({el:b.children()[1],value:a.hundreds||0}),a.tensOdo=new Odometer({el:b.children()[2],value:a.tens||0}),a.onesOdo=new Odometer({el:b.children()[3],value:a.ones||0}),c=function(){return a.cost?(a.ones=a.cost%10,a.onesOdo.update(a.ones),a.tens=Math.floor(a.cost%100/10),a.tensOdo.update(a.tens),a.hundreds=Math.floor(a.cost%1e3/100),a.hundredsOdo.update(a.hundreds)):void 0},a.$watch("cost",function(){return a.changed=!0,c()})}}}])}.call(this),function(){"use strict";angular.module("podcastApp").filter("reverse",function(){return function(a){return a.slice().reverse()}})}.call(this),function(){"use strict";angular.module("podcastApp").controller("DashboardCtrl",["$scope",function(a){return a.feed={name:"This Week in Startups",stats:{hits:6302,subscribers:1302,lastChange:"video"},subscribers:[{name:"Alonso Holmes",level:{id:0,name:"Broke-Ass Fan"},perks:{qualified:5,redeemed:4}},{name:"Matthew Kulp",level:{id:1,name:"Fan"},perks:{qualified:5,redeemed:2}},{name:"Ethan Sherr",level:{id:2,name:"Super Fan"},perks:{qualified:5,redeemed:0}}]}}])}.call(this),function(){"use strict";angular.module("podcastApp").directive("levels",["$timeout",function(a){return{templateUrl:"views/directives/levels.html",restrict:"E",scope:{currentLevel:"=current",levels:"=all",levelUp:"&up",levelDown:"&down"},link:function(b,c){var d;return d=function(){return b.width=c.width(),b.hw=b.width/2,b.spacing=window.outerWidth>768?b.width/4:b.width,a(function(){})},b.focusOn=function(a){return b.currentLevel=a},b.$watch("currentLevel",function(a){return console.log("level changed to "+a)}),angular.element(window).bind("resize",function(){return d()}),d()}}}])}.call(this);