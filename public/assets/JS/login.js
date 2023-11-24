const login = document.getElementById('login')

document.addEventListener('DOMContentLoaded', function () {

    login.addEventListener('submit', (event) => {
        event.preventDefault()
        fetch('/login', {
            method: 'POST',
            body: new FormData(login)
        })
            .then(res => res.json())
            .then(data => {
                if (data.status_login === 'success') {
                    setTimeout(() => {
                        const modal = document.querySelector('#modal-center-1');
                        modal.classList.remove('uk-open');
                        modal.classList.add('uk-close');
                    }, 800);
                    setTimeout(() => {
                        UIkit.notification({ message: data.message_success, status: 'success', pos: 'top-right' })
                    }, 1200);
                }
                if (data.errorsLogin) {
                    if (data.errorsLogin.email) {
                        const errorsLoginEmail = document.querySelector('#errorsEmail')
                        errorsLoginEmail.setAttribute('placeholder', data.errorsLogin.email)
                    }
                    if (data.errorsLogin.password) {
                        const errorsLoginPassword = document.querySelector('#errorsPassword');
                        errorsLoginPassword.setAttribute('placeholder', data.errorsLogin.password)
                    }
                }

                if (data.status_login === 'error') {
                    UIkit.notification({ message: data.message_error, status: 'warning', pos: 'top-right' })
                }
            })
    })

})