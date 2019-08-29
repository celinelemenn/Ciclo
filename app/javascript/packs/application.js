import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { highlighter } from '../plugins/navbar_highlighter';
import { initMapbox } from '../plugins/mapbox/init_mapbox';
import {hider} from '../plugins/navbar_hider';

initMapbox();
highlighter();
hider();
