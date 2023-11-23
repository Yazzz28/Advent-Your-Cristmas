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

function test() {
    // fetch('https://api.blablagues.net/?rub=blagues')
    // .then(response => response.json())
    // .then(data => {
    //     const blague = document.getElementById("blague");
    //     blague.innerHTML = `${data.data.content.text}${data.data.content.text_head}\n${data.data.content.text_hidden}`

    // })

    fetch("https://api.themoviedb.org/3/movie"), {
        headers: {
            Authorization:""
        }
    }
    
    .then(response => response.json())
    .then(data => {
        console.log(data)
    })
}
