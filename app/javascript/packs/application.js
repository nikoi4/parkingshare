import "bootstrap";
import '../components/parking-popover';
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initToggle } from '../components/toggle';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { loadDynamicBannerText } from '../components/banner';
initToggle();
initMapbox();
initAutocomplete();
loadDynamicBannerText();

