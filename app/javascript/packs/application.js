import "bootstrap";

import "mapbox-gl/dist/mapbox-gl.css"; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { highlighter } from "../plugins/navbar_highlighter";
import { startMap } from "../plugins/mapbox/start_mapbox";
import { bookmark_highlighter } from "../plugins/bookmark_highlighter";
import { loadDynamicBannerTitle } from "../plugins/banner";
import { dropdown } from "../plugins/dropdown_menu";
import { alert } from "../plugins/alert";
import { tab } from "../plugins/tabs";
import { goBack } from "../plugins/back_button";
import "../plugins/poi_checkbox";

highlighter();
bookmark_highlighter();

loadDynamicBannerTitle();
dropdown();

tab();
goBack();

const mapElement = document.getElementById("map");
if (mapElement) {
  startMap();
}
