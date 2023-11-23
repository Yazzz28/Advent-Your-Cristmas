const login = document.getElementById('login')

document.addEventListener('DOMContentLoaded', function () {

    login.addEventListener('submit', (event) => {
        event.preventDefault()
        fetch('/login', {
            method: 'POST',
            body : new FormData(login)
        })
    .then(res => res.json())
    .then(data => {

    })
    })




})