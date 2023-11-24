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
            if (data.status_signin === 'success'){  
                setTimeout(() => {
                    const modal = document.querySelector('#modal-center-2');
                    modal.classList.remove('uk-open');
                    modal.classList.add('uk-close');
                    window.location.reload()
                }, 800);  
                setTimeout(() => {                
                UIkit.notification({ message: data.message_success, status: 'success', pos: 'top-right'})  
                }, 1200);              
            }
            if (data.errorSignin){
                if (data.errorSignin.firstname){
                    const affichageErrorsFirstname = document.querySelector('#errorFirstname')
                    affichageErrorsFirstname.setAttribute('placeholder', data.errorSignin.firstname)
                }
                if (data.errorSignin.password){
                    const affichageErrorsPassword = document.querySelector('#errorPassword')
                    affichageErrorsPassword.setAttribute('placeholder', data.errorSignin.password)
                }
                if (data.errorSignin.email){
                    const affichageErrorsEmail = document.querySelector('#errorEmail')
                    affichageErrorsEmail.setAttribute('placeholder', data.errorSignin.email)
                }
            }
            

        })
    })

});