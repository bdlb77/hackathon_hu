function showChecked() {
    let form = document.getElementById("residence_status_form");
    let inputs = document.querySelectorAll(".picture-input");
    // for every click, check if checkbox is checked, then apply style
    form.addEventListener("click", (event) => {
      inputs.forEach(function(input) {
      if(input.firstElementChild.checked) {
        input.classList.add("checkbox-checked")
      }
      else {
        input.classList.remove("checkbox-checked")
      }
      });
    });
  }
showChecked();
// export { showChecked };


