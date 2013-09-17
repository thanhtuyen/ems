/*
 *  GMAP3 Plugin for JQuery 
 *  Version   : 2.1
 *  Date      : February, 12 2011
 *  Licence   : GPL v3 : http://www.gnu.org/licenses/gpl.html  
 *  Author    : DEMONTE Jean-Baptiste
 *  Contact   : jbdemonte@gmail.com
 *  Web site  : http://night-coder.com
 */
jQuery.gmap3={_ids:{},_running:{},_stack:{_a:{},init:function(a){if(!this._a[a]){this._a[a]=[]}},add:function(c,b){this.init(c);this._a[c].push(b)},addNext:function(f,b){var e=[],d=0,c;this.init(f);for(c in this._a[f]){if(d==1){e.push(b)}e.push(this._a[f][c]);d++}if(d<2){e.push(b)}this._a[f]=e},get:function(b){var a;if(this._a[b]){for(a in this._a[b]){if(this._a[b][a]){return this._a[b][a]}}}return false},ack:function(b){var a;if(this._a[b]){for(a in this._a[b]){if(this._a[b][a]){delete this._a[b][a];break}}}if(this.empty(b)){delete this._a[b]}},empty:function(b){var a;if(!this._a[b]){return true}for(a in this._a[b]){if(this._a[b][a]){return false}}return true}},_init:function(a,b){if(!this._ids[b]){this._ids[b]={$this:a,styles:{},stored:{},map:null}}},_plan:function(c,d,b){var a;this._init(c,d);for(a in b){this._stack.add(d,b[a])}this._run(d)},_isDirect:function(c,b){var a=this._ival(b,"action");return a==":get"},_direct:function(c,b){var a=this._ival(b,"action").substr(1);return this[a](c,jQuery.extend({},this._default[a],b.args?b.args:b))},_planNext:function(d,b){var c=this._jObject(d);this._init(c,d);this._stack.addNext(d,b)},_end:function(a){delete this._running[a];this._stack.ack(a);this._run(a)},_run:function(c){if(this._running[c]){return}var b=this._stack.get(c);if(!b){return}this._running[c]=true;this._proceed(c,b)},_properties:["events","onces","options","apply","callback"],_default:{verbose:true,init:{mapTypeId:google.maps.MapTypeId.ROADMAP,center:[46.593623,0.342922],zoom:10}},_geocoder:null,_getGeocoder:function(){if(!this._geocoder){this._geocoder=new google.maps.Geocoder()}return this._geocoder},_directionsService:null,_getDirectionsService:function(){if(!this._directionsService){this._directionsService=new google.maps.DirectionsService()}return this._directionsService},_elevationService:null,_getElevationService:function(){if(!this._elevationService){this._elevationService=new google.maps.ElevationService()}return this._elevationService},_getMap:function(a){return this._ids[a].map},_setMap:function(b,a){this._ids[b].map=a},_jObject:function(a){return this._ids[a].$this},_addStyle:function(c,b,a){this._ids[c].styles[b]=a},_getStyles:function(a){return this._ids[a].styles},_getStyle:function(b,a){return this._ids[b].styles[a]},_styleExist:function(b,a){return this._ids[b]&&this._ids[b].styles[a]},_getDirectionRenderer:function(a){return this._getFirstStored(a,"directionrenderer")},_exist:function(a){return this._ids[a].map?true:false},_getFirstStored:function(c,b){var a=0;if(this._ids[c].stored[b]&&this._ids[c].stored[b].length){while(a<this._ids[c].stored[b].length){if(this._ids[c].stored[b][a]){return this._ids[c].stored[b][a]}a++}}return null},_getLastStored:function(c,b){var a;if(this._ids[c].stored[b]&&this._ids[c].stored[b].length){a=this._ids[c].stored[b].length-1;do{if(this._ids[c].stored[b][a]){return this._ids[c].stored[b][a]}a--}while(a>=0)}return null},_store:function(c,a,b){a=a.toLowerCase();if(!this._ids[c].stored[a]){this._ids[c].stored[a]=new Array()}this._ids[c].stored[a].push(b)},_unstore:function(e,c,b){var a,d=this._ids[e].stored[c];if(!d){return false}a=b?d.length-1:0;if(typeof(d[a])=="undefined"){return false}if(typeof(d[a]["setMap"])=="function"){d[a].setMap(null)}if(typeof(d[a]["remove"])=="function"){d[a].remove()}delete d[a];if(b){d.pop()}else{d.shift()}return true},_clear:function(g,d,c,e){var a,f,b;if(!d||!d.length){d=[];for(a in this._ids[g].stored){d.push(a)}}for(a in d){f=d[a].toLowerCase();if(!this._ids[g].stored[f]){continue}if(c){this._unstore(g,f,true)}else{if(e){this._unstore(g,f,false)}else{while(this._unstore(g,f,false)){}}}}},_autoInit:function(b){var a,c=b.substr(0,1),d=["init","geolatlng","getlatlng","getroute","getelevation","addstyledmap","destroy"];if(!b||((c!=":")&&(c!="_"))){return true}b=b.substr(1);for(a in d){if(d[a]==b){return false}}return true},_proceed:function(h,e){e=e||{};var a=this._ival(e,"action")||":init",c=a.toLowerCase(),d=a.substr(0,1),b=true,g,f;if(d=="_"){return}if(!this._exist(h)&&this._autoInit(c)){this.init(h,jQuery.extend({},this._default.init,e.args&&e.args["map"]?e.args["map"]:e.map?e.map:{}),true)}if(d==":"){a=c.substr(1);if(typeof(this[a])=="function"){this[a](h,jQuery.extend({},this._default[a],e.args?e.args:e))}else{b=false}}else{g=this._ival(e,"target");if(g){if(typeof(g[a])=="function"){e.out=g[a].apply(g,e.args?e.args:[])}else{b=false}}else{f=this._getMap(h);if(typeof(f[a])=="function"){e.out=f[a].apply(f,e.args?e.args:[])}else{b=false}}if(!b&&this._default.verbose){alert("unknown action : "+a)}this._callback(h,e.out,e);this._end(h)}},_call:function(){if(arguments.length<2){return}if(!this._exist(arguments[0])){return}var b,e=arguments[0],d=arguments[1],c=this._getMap(e),a=[];if(typeof(c[d])!="function"){return}for(b=2;b<arguments.length;b++){a.push(arguments[b])}return c[d].apply(c,a)},_array:function(d){var c,b=[];if(typeof(d)=="object"){for(c in d){b.push(d[c])}}else{if(typeof(d)!="undefined"){b.push(d)}}return b},_subcall:function(d,c,a){var b={};if(!c.map){return}if(!a){a=this._ival(c.map,"latlng")}if(!this._exist(d)){if(a){b={center:a}}this.init(d,jQuery.extend({},c.map,b),true)}else{if(c.map["center"]&&a){this._call(d,"setCenter",a)}if(typeof(c.map["zoom"])!="undefined"){this._call(d,"setZoom",c.map["zoom"])}if(typeof(c.map["mapTypeId"])!="undefined"){this._call(d,"setMapTypeId",c.map["mapTypeId"])}}},_attachEvent:function(g,b,a,e,d){var c=this._jObject(g);google.maps.event["addListener"+(d?"Once":"")](b,a,function(f){e(c,b,f)})},_attachEvents:function(d,b,c){var a;if(!c){return}if(c.events){for(a in c.events){if(typeof(c.events[a])=="function"){this._attachEvent(d,b,a,c.events[a],false)}}}if(c.onces){for(a in c.onces){if(typeof(c.onces[a])=="function"){this._attachEvent(d,b,a,c.onces[a],true)}}}},_callback:function(c,d,b){var a,e;b.out=d;if(typeof(b.callback)=="function"){e=typeof(c)=="string"?this._jObject(c):c;b.callback(e,d)}else{if(typeof(b.callback)=="object"){for(a in b.callback){if(!e){e=typeof(c)=="string"?this._jObject(c):c}if(typeof(b.callback[a])=="function"){b.callback[a](e,d)}}}}},_manageEnd:function(g,d,e,a){var b,f;if(typeof(d)=="object"){this._attachEvents(g,d,e);for(b in e.apply){f=e.apply[b];if(!f.action){continue}if(typeof(d[f.action])!="function"){continue}if(f.args){d[f.action].apply(d,f.args)}else{d[f.action]()}}}if(!a){this._callback(g,d,e);this._end(g)}},_latLng:function(e,g,c){var b,f,a={},d=0;if(!e){return null}if(e.latLng){return this._latLng(e.latLng)}f=g?e:null;if(typeof(e.lat)=="function"){return e}else{if(typeof(e.lat)=="number"){return new google.maps.LatLng(e.lat,e.lng)}else{if(!c){for(b in e){if(typeof(e[b])!="number"){return f}a[d==0?"lat":"lng"]=e[b];if(d){break}d++}if(d){return new google.maps.LatLng(a.lat,a.lng)}}}}return f},_count:function(b){var a,d=0;for(a in b){d++}return d},_latLngBounds:function(l,g,e){var h,b,d,m,c,n,j,a,f;if(!l){return null}h=e?l:null;if(typeof(l.getCenter)=="function"){return l}b=this._count(l);if(b==2){if(l.ne&&l.sw){d=this._latLng(l.ne);m=this._latLng(l.sw)}else{for(c in l){if(!d){d=this._latLng(l[c])}else{m=this._latLng(l[c])}}}if(m&&d){return new google.maps.LatLngBounds(m,d)}return h}else{if(b==4){n=["n","e","s","w"];j=true;for(f in n){j&=typeof(l[n[f]])=="number"}if(j){return new google.maps.LatLngBounds(this._latLng([l.s,l.w]),this._latLng([l.n,l.e]))}if(g){f=0;a={};for(c in l){if(typeof(l[c])!="number"){return h}a[n[f]]=l[c];f++}return new google.maps.LatLngBounds(this._latLng([a.s,a.w]),this._latLng([a.n,a.e]))}}}return h},_ikey:function(c,b){b=b.toLowerCase();for(var a in c){if(a.toLowerCase()==b){return a}}return false},_ival:function(c,b){var a=this._ikey(c,b);if(a){return c[a]}return null},_hasKey:function(b,c){var d,a;if(!b||!c){return false}for(d in b){d=d.toLowerCase();for(a in c){if(d==c[a]){return true}}}return false},_extractObject:function(d,a){if(this._hasKey(d,this._properties)||this._hasKey(d,a)){var b,e,f,c={};for(b in this._properties){e=this._properties[b];f=this._ikey(d,e);c[e]=f?d[f]:{}}for(b in a){e=a[b];f=this._ikey(d,e);if(f){c[e]=d[f]}}return c}else{c={options:{}};for(b in d){if(b=="action"){continue}c.options[b]=d[b]}return c}},_object:function(c,g,a,d){var b=this._ikey(g,c),h,f={},e=["map"];if(b){return this._extractObject(g[b],a)}for(b in d){e.push(d[b])}if(!this._hasKey(g,e)){f=this._extractObject(g,a)}for(b in this._properties){h=this._properties[b];if(!f[h]){f[h]={}}}return f},_resolveLatLng:function(g,e,f,b){var d=this._ival(e,"address"),c=this,a;if(d){a=function(h,i){if(i==google.maps.GeocoderStatus.OK){c[f](g,e,b?h:h[0].geometry.location)}else{c[f](g,e,false)}};this._getGeocoder().geocode({address:d},a)}else{this[f](g,e,this._latLng(e,false,true))}},destroy:function(d,b){var a,c;if(this._ids[d]){this._clear(d);this._ids[d].$this.empty();if(this._ids[d].bl){delete this._ids[d].bl}for(a in this._ids[d].styles){delete this._ids[d].styles[a]}delete this._ids[d].map;c=this._jObject(d);delete this._ids[d];this._callback(c,null,b)}this._end(d)},init:function(h,e,b){var g,d,f,a,c;if((h=="")||(this._exist(h))){return this._end(h)}g=this._object("map",e);if((typeof(g.options["center"])=="boolean")&&g.options["center"]){return false}d=jQuery.extend({},this._default.init,g.options);if(!d.center){d.center=[this._default.init.center["lat"],this._default.init.center["lng"]]}d.center=this._latLng(d.center);this._setMap(h,new google.maps.Map(document.getElementById(h),d));f=this._getMap(h);a=this._getStyles(h);for(c in a){f.mapTypes.set(c,a[c])}this._manageEnd(h,f,g,b);return true},getlatlng:function(b,a){this._resolveLatLng(b,a,"_getLatLng",true)},_getLatLng:function(c,b,a){this._manageEnd(c,a,b)},getroute:function(d,a){var c,b;if((typeof(a.callback)=="function")&&a.options){a.options["origin"]=this._latLng(a.options["origin"],true);a.options["destination"]=this._latLng(a.options["destination"],true);c=this._jObject(d);b=function(e,f){a.out=f==google.maps.DirectionsStatus.OK?e:false;a.callback(c,a.out)};this._getDirectionsService().route(a.options,b)}this._end(d)},getelevation:function(b,f){var i,j,g,e,d,l,h,a=[],c=this._ival(f,"callback");if(c&&typeof(c)=="function"){i=this._jObject(b);j=function(k,m){f.out=m==google.maps.ElevationStatus.OK?k:false;f.callback(i,f.out)};g=this._ival(f,"latlng");if(g){a.push(this._latLng(g))}else{e=this._ival(f,"locations");if(e){for(d in e){a.push(this._latLng(e[d]))}}}if(a.length){this._getElevationService().getElevationForLocations({locations:a},j)}else{l=this._ival(f,"path");h=this._ival(f,"samples");if(l&&h){for(d in l){a.push(this._latLng(l[d]))}if(a.length){this._getElevationService().getElevationAlongPath({path:a,samples:h},j)}}}}this._end(b)},addmarker:function(b,a){this._resolveLatLng(b,a,"_addMarker")},_addMarker:function(h,e,a){var f,d,c,g="marker",b="infowindow";if(!a){return this._end(h)}this._subcall(h,e,a);f=this._object(g,e);f.options["position"]=a;f.options["map"]=this._getMap(h);d=new google.maps.Marker(f.options);if(e[b]){c=this._object(b,e[b],["open"]);if((typeof(c.open)=="undefined")||c.open){c.apply=this._array(c.apply);c.apply.unshift({action:"open",args:[this._getMap(h),d]})}c.action=":add"+b;this._planNext(h,c)}this._store(h,g,d);this._manageEnd(h,d,f)},addmarkers:function(a,h){var b,f,i,d,g=[],c="marker",e=this._ival(h,"latlng");this._subcall(a,h);if(typeof(e)!="object"){return this._end(a)}b=this._object(c,h);b.options["map"]=this._getMap(a);for(f in e){i=this._latLng(e[f]);if(!i){continue}b.options["position"]=i;d=new google.maps.Marker(b.options);g.push(d);this._store(a,c,d);this._manageEnd(a,d,b,true)}this._callback(a,g,h);this._end(a)},addinfowindow:function(b,a){this._resolveLatLng(b,a,"_addInfoWindow")},_addInfoWindow:function(g,d,a){var e,c,b=[],f="infowindow";this._subcall(g,d,a);e=this._object(f,d,["open","anchor"]);if(a){e.options["position"]=a}c=new google.maps.InfoWindow(e.options);if((typeof(e.open)=="undefined")||e.open){e.apply=this._array(e.apply);b.push(this._getMap(g));if(e.anchor){b.push(e.anchor)}e.apply.unshift({action:"open",args:b})}this._store(g,f,c);this._manageEnd(g,c,e)},addpolyline:function(b,a){this._addPoly(b,a,"Polyline","path")},addpolygon:function(b,a){this._addPoly(b,a,"Polygon","paths")},_addPoly:function(h,d,c,f){var a,b,e,g=this._object(c.toLowerCase(),d,[f]);if(g[f]){g.options[f]=[];b=0;for(a in g[f]){g.options[f][b++]=this._latLng(g[f][a])}}e=new google.maps[c](g.options);e.setMap(this._getMap(h));this._store(h,c.toLowerCase(),e);this._manageEnd(h,e,g)},addcircle:function(b,a){this._resolveLatLng(b,a,"_addCircle")},_addCircle:function(g,b,a){var f,e="circle",d=this._object(e,b);if(!a){a=this._latLng(d.options["center"])}if(!a){return this._end(g)}this._subcall(g,b,a);d.options["center"]=a;d.options["map"]=this._getMap(g);f=new google.maps.Circle(d.options);this._store(g,e,f);this._manageEnd(g,f,d)},addrectangle:function(b,a){this._resolveLatLng(b,a,"_addRectangle")},_addRectangle:function(f,c,a){var b,e="rectangle",d=this._object(e,c);d.options["bounds"]=this._latLngBounds(d.options["bounds"],true);if(!d.options["bounds"]){return this._end(f)}this._subcall(f,c,d.options["bounds"].getCenter());d.options["map"]=this._getMap(f);b=new google.maps.Rectangle(d.options);this._store(f,e,b);this._manageEnd(f,b,d)},addoverlay:function(b,a){this._resolveLatLng(b,a,"_addOverlay")},_addOverlay:function(h,e,a){var b,g=this._object("overlay",e),c=jQuery.extend({pane:"floatPane",content:"",offset:{x:0,y:0}},g.options);d.prototype=new google.maps.OverlayView();function d(i,f,j){this.opts_=i;this.$div_=null;this.latLng_=f;this.map_=j;this.setMap(j)}d.prototype.onAdd=function(){var i,f=jQuery("<div></div>");f.css("border","none").css("borderWidth","0px").css("position","absolute");f.append(jQuery(this.opts_.content));this.$div_=f;i=this.getPanes();if(i[this.opts_.pane]){jQuery(i[this.opts_.pane]).append(this.$div_)}};d.prototype.draw=function(){if(!this.$div_){return}var i,f=this.getProjection();i=f.fromLatLngToDivPixel(this.latLng_);this.$div_.css("left",(i.x+this.opts_.offset["x"])+"px").css("top",(i.y+this.opts_.offset["y"])+"px")};d.prototype.onRemove=function(){this.$div_.remove();this.$div_=null};d.prototype.hide=function(){if(this.$div_){this.$div_.hide()}};d.prototype.show=function(){if(this.$div_){this.$div_.show()}};d.prototype.toggle=function(){if(this.$div_){if(this.$div_.is(":visible")){this.show()}else{this.hide()}}};d.prototype.toggleDOM=function(){if(!this.$div_){return}if(this.getMap()){this.setMap(null)}else{this.setMap(this.map_)}};b=new d(c,a,this._getMap(h));this._store(h,"overlay",b);this._manageEnd(h,b,g)},addfixpanel:function(h,d){var g="fixpanel",e=this._object(g,d),a=0,f=0,c,b;if(e.options["content"]){c=jQuery(e.options["content"]);if(typeof(e.options["left"])!="undefined"){a=e.options["left"]}else{if(typeof(e.options["right"])!="undefined"){a=this._jObject(h).width()-c.width()-e.options["right"]}else{if(e.options["center"]){a=(this._jObject(h).width()-c.width())/2}}}if(typeof(e.options["top"])!="undefined"){f=e.options["top"]}else{if(typeof(e.options["bottom"])!="undefined"){f=this._jObject(h).height()-c.height()-e.options["bottom"]}else{if(e.options["middle"]){f=(this._jObject(h).height()-c.height())/2}}}b=jQuery("<div></div>").css("position","absolute").css("top",f+"px").css("left",a+"px").css("z-index","1000").append(e.options["content"]);this._jObject(h).first().prepend(b);this._attachEvents(h,this._getMap(h),e);this._store(h,g,b);this._callback(h,b,e)}this._end(h)},removedirectionsrenderer:function(d,b,a){var c=this._object("directionrenderer",b);this._clear(d,"directionrenderer");this._manageEnd(d,true,c,a)},adddirectionsrenderer:function(f,b,a){var e="directionrenderer",c,d=this._object(e,b,["panelId"]);this._clear(f,e);d.options["map"]=this._getMap(f);c=new google.maps.DirectionsRenderer(d.options);if(d.panelId){c.setPanel(document.getElementById(d.panelId))}this._store(f,e,c);this._manageEnd(f,c,d,a)},setdirectionspanel:function(d,a){var b,c=this._object("directionpanel",a,["id"]);if(c.id){b=this._getDirectionRenderer(d);b.setPanel(document.getElementById(c.id))}this._manageEnd(d,b,c)},setdirections:function(d,a){var b,c=this._object("directions",a);if(a){c.options["directions"]=a.directions?a.directions:(a.options&&a.options["directions"]?a.options["directions"]:null)}if(c.options["directions"]){b=this._getDirectionRenderer(d);if(!b){this.adddirectionsrenderer(d,c,true);b=this._getDirectionRenderer(d)}else{b.setDirections(c.options["directions"])}}this._manageEnd(d,b,c)},setstreetview:function(d,b){var c=this._object("streetview",b,["id"]),a=new google.maps.StreetViewPanorama(document.getElementById(c.id),c.options);this._getMap(d).setStreetView(a);this._manageEnd(d,a,c)},addkmllayer:function(d,b){var a,c=this._object("kmllayer",b,["url"]);c.options["map"]=this._getMap(d);a=new google.maps.KmlLayer(c.url,c.options);this._manageEnd(d,a,b)},addtrafficlayer:function(e,b){var d="trafficlayer",c=this._object(d),a=this._getFirstStored(e,d);if(!a){a=new google.maps.TrafficLayer();a.setMap(this._getMap(e));this._store(e,d,a)}this._manageEnd(e,a,c)},removetrafficlayer:function(f,c){var e="trafficlayer",d=this._object(e),a=this._getFirstStored(f,e),b=a?true:false;if(a){this._clear(f,e)}this._manageEnd(f,b,d)},addbicyclinglayer:function(e,a){var d="bicyclinglayer",b=this._object(d),c=this._getFirstStored(e,d);if(!c){c=new google.maps.BicyclingLayer();c.setMap(this._getMap(e));this._store(e,d,c)}this._manageEnd(e,c,b)},removebicyclinglayer:function(f,b){var e="bicyclinglayer",c=this._object(e),d=this._getFirstStored(f,e),a=d?true:false;if(d){this._clear(f,e)}this._manageEnd(f,a,c)},addgroundoverlay:function(e,b){var d="groundoverlay",c=this._object(d,b,["bounds","url"]),a;c.bounds=this._latLngBounds(c.bounds);if(c.bounds&&c.url){a=new google.maps.GroundOverlay(c.url,c.bounds);a.setMap(this._getMap(e));this._store(e,d,a)}this._manageEnd(e,a,c)},geolatlng:function(d,a){if(typeof(a.callback)=="function"){var c,b=this._jObject(d);if(navigator.geolocation){browserSupportFlag=true;navigator.geolocation.getCurrentPosition(function(e){a.out=new google.maps.LatLng(e.coords.latitude,e.coords.longitude);a.callback(b,a.out)},function(){a.out=false;a.callback(b,a.out)})}else{if(google.gears){browserSupportFlag=true;c=google.gears.factory.create("beta.geolocation");c.getCurrentPosition(function(e){a.out=new google.maps.LatLng(e.latitude,e.longitude);a.callback(b,a.out)},function(){a.out=false;a.callback(b,a.out)})}else{a.out=false;a.callback(b,a.out)}}}this._end(d)},addstyledmap:function(e,c,a){var d=this._object("styledmap",c,["id","style"]),b;if(d.style&&d.id&&!this._styleExist(e,d.id)){b=new google.maps.StyledMapType(d.style,d.options);this._addStyle(e,d.id,b);if(this._getMap(e)){this._getMap(e).mapTypes.set(d.id,b)}}this._manageEnd(e,b,d,a)},setstyledmap:function(d,b){var c=this._object("styledmap",b,["id","style"]),a;if(c.id){this.addstyledmap(d,c,true);a=this._getStyle(d,c.id);if(a){this._getMap(d).setMapTypeId(c.id);this._callback(d,a,b)}}this._manageEnd(d,a,c)},clear:function(e,c){var b=this._array(c.list),a=c.last?true:false,d=c.first?true:false;this._clear(e,b,a,d);this._end(e)},get:function(g,e){var b=this._ival(e,"name")||"map",f=this._ival(e,"first"),c=this._ival(e,"all"),d,a;b=b.toLowerCase();if(b=="map"){return this._getMap(g)}if(f){return this._getFirstStored(g,b)}else{if(c){d=new Array();if(this._ids[g].stored[b]){for(a in this._ids[g].stored[b]){if(this._ids[g].stored[b][a]){d.push(this._ids[g].stored[b][a])}}}return d}else{return this._getLastStored(g,b)}}},setDefault:function(b){for(var a in b){this._default[a]=jQuery.extend({},this._default[a],b[a])}}};jQuery.fn.extend({gmap3:function(){var d,b,a=[],c=jQuery(this);if(c.length>0){d=c.attr("id");for(b=0;b<arguments.length;b++){a.push(arguments[b]||{})}if(!a.length){a.push({})}if((a.length==1)&&(jQuery.gmap3._isDirect(d,a[0]))){return jQuery.gmap3._direct(d,a[0])}else{jQuery.gmap3._plan(c,d,a)}}return jQuery(this)}});