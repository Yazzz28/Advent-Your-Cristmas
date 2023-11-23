const forgot = document.getElementById('forgot');

document.addEventListener('DOMContentLoaded', function () => {
    forgot.addEventListener('submit', (event) => {
        event.preventDEfault()
        fetch('/forgot', {
            method: 'POST', 
            body: new FormData(forgot)
            })
            .then(res => res.json())
            .then(data => {

            })
    })
})