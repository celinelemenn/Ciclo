const tabs = document.querySelector('.tabs')



const tab = () => {
  if (tabs) {

const all = document.querySelector('#feed-all');
const me = document.querySelector('#feed-me');
const searchPath = document.location.search
 const activeTabs = document.querySelectorAll('.tab.active')

 activeTabs.forEach(item => item.classList.remove('active'))

if (searchPath == "?feed_type=all") {
  all.classList.add("active");
}
else {
  me.classList.add("active");
}
}
}

export { tab };
