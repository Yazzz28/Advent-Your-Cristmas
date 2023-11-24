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

    //Génére une idée de filme
    const options = {
        method: 'GET',
        headers: {
          accept: 'application/json'
      };


      const randomPage = Math.floor(Math.random() * (2 - 0 ) + 1);
      console.log(randomPage);

      const url = "https://api.themoviedb.org/3/search/collection?query=christmas&include_adult=false&language=fr-FR&page=1";
      console.log(url);

      fetch(url, options)
        .then(response => response.json())
        .then(response => {
            const randomNumber = Math.floor(Math.random() * 17)
            const nameFilmRandom = response.results[randomNumber].original_name
            document.getElementById('film').setAttribute("value", nameFilmRandom);

        })
            
        .catch(err => console.error(err));

    fetch("/selectCadeauRandom")
    .then(response => response.json())
    .then(data => {
        document.getElementById('cadeau').setAttribute("value", data.cadeau.idea);
        console.log(data)
        document.getElementById('title_recipe').setAttribute("value", data.recette.title);
    })


}
