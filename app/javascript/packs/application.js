import "bootstrap";
import '../components/parking_popover';
import '../components/features_popover';
import '../components/chat';
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initToggle } from '../components/toggle';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { loadDynamicBannerText } from '../components/banner';
import { bookingProcess } from '../components/booking';
import { calendarPlus2 } from '../components/calendarPlus2';
import { initReview } from '../components/reviews';
import '../components/booking_amount';

initToggle();
initMapbox();
initAutocomplete();
loadDynamicBannerText();
bookingProcess();

calendarPlus2();
initReview();

