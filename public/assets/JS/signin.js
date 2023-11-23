const signin = document.getElementById('signin')

document.addEventListener('DOMContentLoaded', function () {

    signin.addEventListener('submit', (event) => {
        event.preventDefault()
        fetch('/signin', {
            method: 'POST',
            body: new FormData(signin)
        })
        .then(res => res.json())
        .then(data => {

        })
    })

})