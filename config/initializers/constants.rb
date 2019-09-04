POINT_OF_INTEREST = {
  water_refill: {
    label: 'water_refill',
    name: "Water Refill",
    marker_icon: "https://i.imgur.com/LOnp8YJ.png",
    color: "#41D5FF"
  },
  camping: {
    label: "camping",
    name: "Camping ",
    marker_icon: "https://i.imgur.com/KRowqX7.png",
    color: "#F6CD03"
  },
  caution: {
    label: "caution",
    name: "Caution!",
    marker_icon: "https://i.imgur.com/CvMVM2g.png",
    color: "#2D3B44"
  },
  landmark: {
    label: "landmark",
    name: "Landmark",
    marker_icon: "https://i.imgur.com/mQDJNpw.png",
    color: "#09D898"
  }
}

ISSUE_TYPE = ["It doesn't appear to be here", "Report a problem"]

ROUTES_NO_NAV = [
  { controller: 'registrations', action: 'new' },
  { controller: 'registrations', action: 'create' },
  { controller: 'registrations', action: 'cancel' },

  { controller: 'passwords', action: 'edit' },
  { controller: 'passwords', action: 'new' },
  { controller: 'sessions', action: 'new' },
  { controller: 'sessions', action: 'create' },
  { controller: 'pages', action: 'home' },
  { controller: 'pages', action: 'userprofile' },
  { controller: 'point_of_interest', action: 'new' },
  { controller: 'point_of_interest', action: 'create' },
  { controller: 'point_of_interest', action: 'show' },
  { controller: 'likes', action: 'create' },
  { controller: 'downvotes', action: 'create' },
  { controller: 'bookmarks', action: 'create' },
  { controller: 'point_of_interests', action: 'new' },
  { controller: 'point_of_interests', action: 'show' },
  { controller: 'preferences', action: 'edit' },
]

ROUTES_NO_MENU = [
  { controller: 'registrations', action: 'edit' },
  {controller: 'trips', action: 'new'}

]

ROUTES_BACK_MAP = [
  { controller: 'pages', action: 'userprofile' },
  { controller: 'point_of_interests', action: 'new' },
  { controller: 'point_of_interests', action: 'show' },
  { controller: 'point_of_interests', action: 'index' },
  { controller: 'likes', action: 'create'},
  { controller: 'downvotes', action: 'create' },
  { controller: 'bookmarks', action: 'create' },
  { controller: 'preferences', action: 'edit' },
]
