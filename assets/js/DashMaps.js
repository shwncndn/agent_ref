import { Loader } from "@googlemaps/js-api-loader"
export default {
  mounted() {
    const hook = this;

    elt = hook.el;
    hook.map = null;
    const loader = new Loader({
      apiKey: 'AIzaSyDy_Xbknd07AivPkqWYivyIjcaQCVA2YLk',
      version: "weekly"
    });
    loader
      .importLibrary('maps')
      .then(({Map}) => {
        hook.map = new Map(elt, {
          mapId: '3451f9a78130317b',
          center: { lat: 37.0902, lng: -95.7129 }, 
          zoom: 4, 
          zoomControl: false, 
          mapTypeControl: false, 
          scaleControl: false, 
          streetViewControl: false, 
          rotateControl: false,
          fullscreenControl: false, 
          draggable: false, 
          scrollwheel: false 
        });
      });
  }
}