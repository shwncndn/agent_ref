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
          center: { lat: 27.2691041, lng: -80.3135028 },
          zoom: 11,
      
          zoomControl: true,
          mapTypeControl: false,
          scaleControl: false,
          streetViewControl: false,
          rotateControl: false,
          fullscreenControl: true,
          styles: [
            {
              "featureType": "all",
              "stylers": [
                { "saturation": -100 }
              ]
            },
            {
              "featureType": "water",
              "stylers": [
                { "saturation": 0 ,
                // "color": "#30A4DC"
                "color": "#79b0cb"
              }
              ]
            }
          ]
        });
      });
  }
}
