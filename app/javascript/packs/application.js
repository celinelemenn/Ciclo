import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { highlighter } from '../plugins/navbar_highlighter';
import { run_mapbox_page } from '../plugins/mapbox/init_mapbox';
import { bookmark_highlighter } from '../plugins/bookmark_highlighter';
import { geolocator } from '../plugins/geolocalizer';
import { loadDynamicBannerTitle } from '../plugins/banner';
import { dropdown } from '../plugins/dropdown_menu';
import { addCampingsToMap } from '../plugins/mapbox/add_campsites_to_map';
import { alert } from '../plugins/alert';
import { tab } from '../plugins/tabs';
import { goBack } from '../plugins/back_button';

run_mapbox_page();
highlighter();
bookmark_highlighter();


// new_location();

geolocator();
loadDynamicBannerTitle();
dropdown();
addCampingsToMap();

/// other js
tab();
goBack();
