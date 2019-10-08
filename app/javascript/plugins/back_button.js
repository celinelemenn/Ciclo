const goBack = () => {
  const back = document.querySelector('#go-back')
  if (back) {
  back.addEventListener("click", (event) => {
    event.preventDefault();
    window.history.back();
  });
}
}

export { goBack };
