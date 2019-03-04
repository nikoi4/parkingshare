import mapboxgl from 'mapbox-gl';
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { duration: 1, padding: 70, maxZoom: 15 });
  };
  const flyToParking = (lat, lng, map) => {
    map.flyTo({
      center: [lat, lng],
      zoom: 15,
      speed: 2,
      curve: 2,
      // easing(t) {
      //   return t;
      // }
    });
  };
  const flyToParkingMove = (lat, lng, map) => {
    map.flyTo({
      center: [lat-0.005, lng],
      zoom: 15,
      speed: 2,
      curve: 2,
      // easing(t) {
      //   return t;
      // }
    });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
  });
  fitMapToMarkers(map, markers);
  const nav = new mapboxgl.NavigationControl();
  map.addControl(nav, 'top-right');
  const geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true,
    },
    fitBoundsOptions: {
      maxZoom: 13
    },
    trackUserLocation: true
  });
  map.addControl(geolocate, 'top-right');

  map.on('load', function(){
    geolocate.trigger();
  });

  if (markers.length == 1) {

    let directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken
    })

    geolocate.on('geolocate', function(){

      //Get the updated user location, this returns a javascript object.
      let userlocation = geolocate._lastKnownPosition;

      //Your work here - Get coordinates like so
      let lat1 = userlocation.coords.latitude;
      let lng2 = userlocation.coords.longitude;
      directions.setOrigin([lng2,lat1])
    });

    directions.setDestination([markers[0].lng, markers[0].lat])
    map.addControl(directions, 'top-left')
  }

  const cards = document.querySelectorAll('.card');
  cards.forEach((card) => {
    card.addEventListener('mouseover', (event) => {
      flyToParking(parseFloat(card.dataset.lng), parseFloat(card.dataset.lat), map);
    });
  });

  const cardsTwo = document.querySelectorAll('.card');
  cardsTwo.forEach((card) => {
    card.addEventListener('click', (event) => {
      flyToParkingMove(parseFloat(card.dataset.lng), parseFloat(card.dataset.lat), map);
    });
  });
}
};

export { initMapbox };




