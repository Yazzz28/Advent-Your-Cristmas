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
    // Génère une blague aléatoire
    fetch('https://api.blablagues.net/?rub=blagues')
        .then(response => response.json())
        .then(data => {
            const blague = document.getElementById("blague");
            blague.innerHTML = `${data.data.content.text}${data.data.content.text_head}\n${data.data.content.text_hidden}`;
        })
        .catch(err => console.log(err));


    // Génère une idée de cadeau et une recette
    fetch("/selectCadeauRandom")
        .then(response => response.json())
        .then(data => {
            document.getElementById('cadeau').setAttribute("value", data.cadeau.idea);
            console.log(data)
            document.getElementById('title_recipe').setAttribute("value", data.recette.title);
        })
        .catch(err => console.error(err));
}
