const forgot = document.getElementById('forgot');

document.addEventListener('DOMContentLoaded', function () {
    forgot.addEventListener('submit', (event) => {
        event.preventDefault()
        fetch('/forgot', {
            method: 'POST', 
            body: new FormData(forgot)
            })
            .then(res => res.json())
            .then(data => {
                if (data.status === 'success') {
                    UIkit.notification({ message: data.message_sucess, status: 'success', pos: 'top-right', timeout: 5000 })
                }
                if (data.errorsForgot) {
                    if (data.errorsForgot.email) {
                    const affichageErrorEmailForgot = document.querySelector('#errorEmailForgot')
                    affichageErrorEmailForgot.setAttribute('placeholder', data.errorsForgot.email)
                    }
                }
                if (data.status === 'error') {
                    UIkit.notification({ message: data.message_error, status: 'warning', pos: 'top-right', timeout: 5000 })
                }
            })
    })
})