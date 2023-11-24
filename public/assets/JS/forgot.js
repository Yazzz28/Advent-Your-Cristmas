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
                if (data.status_forgot === 'success') {
                    setTimeout(() => {
                        const modal = document.querySelector("#modal-center-3");
                        modal.classList.remove("uk-open");
                        modal.classList.add("uk-close");
                    }, 800);
                    setTimeout(() => {
                        UIkit.notification({
                            message: data.message_success,
                            status: "success",
                            pos: "top-right",
                        });
                    }, 1200);
                }

                if (data.errorsForgot) {
                    if (data.errorsForgot.email) {
                        const affichageErrorEmailForgot =
                            document.querySelector("#errorEmailForgot");
                        affichageErrorEmailForgot.setAttribute(
                            "placeholder",
                            data.errorsForgot.email
                        );
                    }
                }
            })
    })
});
