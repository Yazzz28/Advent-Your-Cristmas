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
                    }, 800);
                }
                if (data.errors) {
                    if (data.errors.email) {
                        const errorsLoginEmail = document.querySelector('#errorsEmail')
                        errorsLoginEmail.setAttribute('placeholder', data.errors.email)
                    }
                    if (data.errors.password) {
                        const errorsLoginPassword = document.querySelector('#errorsPassword');
                        errorsLoginPassword.setAttribute('placeholder', data.errors.password)
                    }
                }

                if (data.status === 'error') {
                    UIkit.notification({ message: data.message_error, status: 'warning', pos: 'top-right' })
                }
            })
    })

})