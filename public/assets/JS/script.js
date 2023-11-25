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


function generateContent() {
    
    //Génére une blague aléatoire
    fetch('https://api.blablagues.net/?rub=blagues')
    .then(response => response.json())
    .then(data => {
        const blague = document.getElementById("blague");
        blague.innerHTML = `${data.data.content.text}${data.data.content.text_head}\n${data.data.content.text_hidden}`
    })

    fetch("/selectCadeauRandom")
    .then(response => response.json())
    .then(data => {
        document.getElementById('cadeau').setAttribute("value", data.cadeau.idea);
        document.getElementById('title_recipe').setAttribute("value", data.recette.title);
        document.getElementById('film').setAttribute("value", data.film.movie_title);
    })

}
