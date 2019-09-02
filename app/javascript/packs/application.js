import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { highlighter } from '../plugins/navbar_highlighter';
import { run_mapbox_page } from '../plugins/mapbox/init_mapbox';
import { hider } from '../plugins/navbar_hider';
import { bookmark_highlighter } from '../plugins/bookmark_highlighter';
import { menu_hider } from '../plugins/navbar_hider';
import { geolocator } from '../plugins/geolocalizer';
import { loadDynamicBannerTitle } from '../plugins/banner';
import { dropdown } from '../plugins/dropdown_menu';
import { addCampingsToMap } from '../plugins/mapbox/add_campsites_to_map';

run_mapbox_page();
highlighter();
hider();
bookmark_highlighter();
menu_hider();
geolocator();
loadDynamicBannerTitle();
dropdown();
addCampingsToMap();
