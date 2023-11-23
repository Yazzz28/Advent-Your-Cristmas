window.onload = function () {
    const cubes = document.querySelectorAll(".cube");

    for (let i = 0; i < cubes.length; i++) {
        cubes[i].addEventListener("click", function() {
          ouverture(i)
        });
      }
}

function ouverture(i) {
    document.getElementById(i).querySelector(".front").classList.toggle("open");
}