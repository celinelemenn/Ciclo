POINT_OF_INTEREST = {
  caution: {
    label: "caution",
    name: "Caution!",
    marker_icon: "https://i.imgur.com/CvMVM2g.png",
    color: "#2D3B44"
  },
  landmark: {
    label: "landmark",
    name: "Landmark",
    marker_icon: "https://i.imgur.com/lBM5EDK.png",
    color: "#09D898"
  },
  water_refill: {
    label: 'water_refill',
    name: "Water Refill",
    marker_icon: "https://i.imgur.com/HDEH5Mk.png",
    color: "#41D5FF"
  },
  toilet: {
    label: 'toilet',
    name: "Toilet",
    marker_icon: "https://res.cloudinary.com/dwkwy2q1n/image/upload/v1571052177/logos/toilet.png",
    color: "#41D5FF"
  },
  picnic: {
    label: "picnic",
    name: "Picnic Table",
    marker_icon: "https://i.imgur.com/ijxY7ZC.png",
    color: ""
  },
  repair: {
    label: "repair",
    name: "Bike Repair Shop",
    marker_icon: "https://i.imgur.com/H0mw0d4.png",
    color: ""
  },
  wifi: {
    label: "wifi",
    name: "Wifi zone",
    marker_icon: "https://i.imgur.com/5dmng0G.png",
    color: ""
  },
  info_point: {
    label: "info_point",
    name: "Info Point",
    marker_icon: "https://i.imgur.com/5dmng0G.png",
    color: ""
  },
  electricity: {
    label: "electricity",
    name: "Charging Point",
    marker_icon: "https://i.imgur.com/5dmng0G.png",
    color: ""
  },
  camping: {
    label: "camping",
    name: "Camping ",
    marker_icon: "https://i.imgur.com/KRowqX7.png",
    color: "#F6CD03"
  },
  wild_camping: {
    label: "wild_camping",
    name: "Wild Camping ",
    marker_icon: "https://i.imgur.com/lyd4BAA.png",
    color: "#F6CD03"
  },
  shopping: {
    label: "shopping",
    name: "Grocery Store",
    marker_icon: "https://i.imgur.com/IbWzRwS.png",
    color: "#F6CD03"
  },
   hotel: {
    label: "hotel",
    name: "Ho(s)tel",
    marker_icon: "https://i.imgur.com/SgAg1yF.png",
    color: "#F6CD03"
  },
  bar: {
    label: "bar",
    name: "Bar",
    marker_icon: "https://i.imgur.com/JeCPtpf.png",
    color: "#F6CD03"
  },
  resto: {
    label: "restaurant",
    name: "Restaurant",
    marker_icon: "https://i.imgur.com/B1YLLX8.png",
    color: "#F6CD03"
  },
}

ISSUE_TYPE = ["It doesn't appear to be here", "Report a problem"]


MAIN_MENU_PAGES = [
   { controller: 'pages', action: 'home' },
   { controller: 'pages', action: 'profile' },
   { controller: 'pages', action: 'feed' },
   { controller: 'pages', action: 'map' },
   { controller: 'trips', action: 'index' },
   { controller: 'conversations', action: 'index' },
]
