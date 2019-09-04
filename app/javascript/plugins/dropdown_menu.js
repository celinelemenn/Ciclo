const dropdown = () => {
  const button = document.querySelector('.btn-drop');

  button.addEventListener ("click", (event) => {
  document.querySelector("#dropdown-items").classList.toggle("show");
  button.classList.toggle("focus");
  })
}

export { dropdown };
