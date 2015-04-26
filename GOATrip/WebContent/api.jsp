<!DOCTYPE html>
<html>
  <head>
    <title>GoATrip</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    
    <style>
      html, body, #map-canvas {
        height: 395px
        }
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places,weather&signed_in=true"></script>

<script>
  

// List the search result
var map;
var service



function initialize() {

	
  var markers = [];
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  function handleSearchResults(results, status)
  {
  	console.log(results);
  	 for(var i=0; i< results.length; i++)
  	{
  		 var marker = new google.maps.Marker({
  	    	    position: results[i].geometry.location,
  	    	    map: map
  	    	}); 
  	} 
  }

  // Search
  function performSearch()
  {
  	var request = {
  			bounds: map.getBounds(),
  			name: "Inn"
  	}
  	service.nearbySearch(request, handleSearchResults);
  	
  	
  }

  var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(-33.8902, 151.1759),
      new google.maps.LatLng(-33.8474, 151.2631));
  map.fitBounds(defaultBounds);

  // Create the search box and link it to the UI element.
  var input = (
      document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // For each place, get the icon, place name, and location.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };
      
      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });
  // [END region_getplaces]

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });
//define geolocation
  if(navigator.geolocation) 
  {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'Your Location'
      });
      
       var marker = new google.maps.Marker({
    	    position: pos,
    	    map: map
    	}); 
      
      service = new google.maps.places.PlacesService(map);
      
      google.maps.event.addListenerOnce(map, 'bounds_changed', performSearch);

      $('#refresh').click(performSearch);
      
      //traffic
      var trafficLayer = new google.maps.TrafficLayer();
      $('#toggle_traffic').click(function(){
    	  if(trafficLayer.getMap()){
    		  trafficLayer.setMap(null);
    	  }
    	  else{
    		  trafficLayer.setMap(map);
    	  }
    	  
      });
      
      //weather
  var weatherLayer = new google.maps.weather.WeatherLayer({
     temperatureUnits: google.maps.weather.TemperatureUnit.FAHRENHEIT
  	});
      var cloudLayer = new google.maps.weather.CloudLayer();
      $('#toggle_weather').click(function(){
    	  if(weatherLayer.getMap()||cloudLayer.getMap()){
    		  weatherLayer.setMap(null);
    		  cloudLayer.setMap(null);
    	  }
    	  else{
    		  weatherLayer.setMap(map);
    		  cloudLayer.setMap(map);
    	  }
    	  
      });  
      
       
      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
    
  } 
  
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    <style>
      #target {
        width: 345px;
      }
    </style>
  </head>
  <body>
  	<% String idStr = request.getParameter("id"); %>
    <input id="pac-input" class="controls" type="text" size="50" placeholder="Search Please typing here">
    <div id="map-canvas"></div>
    <button id="refresh">Refresh</button>
<button id="toggle_traffic">Traffic</button>
<button id="toggle_weather">Weather</button>
<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p>
  </body>
</html>