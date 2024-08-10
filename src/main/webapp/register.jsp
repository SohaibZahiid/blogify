<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html data-bs-theme="dark">
    <head>
        <title>Register</title>
        <!-- css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/style.css" rel="stylesheet" />
        <style>
            .banner-background {
                clip-path: polygon(0 0, 100% 0, 100% 74%, 0% 100%);
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <section style="min-height: 80vh;" class="d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header py-4 primary-background">
                                <h4 class="mb-0"><i class="fa fa-user"></i> Register</h4>
                            </div>
                            <div class="card-body">
                                <form id="register-form" method="POST" action="RegisterServlet">
                                    <!-- INSERT INFO MESSAGES HERE -->
                                    <div class="message mb-3">
                                    </div>
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" name="email">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" value="male" id="male">
                                            <label class="form-check-label" for="male">
                                               Male
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" value="female" id="female">
                                            <label class="form-check-label" for="female">
                                                Female
                                            </label>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="about" class="form-label">About</label>
                                        <textarea class="form-control" placeholder="Tell about yourself" id="about" name="about" style="height: 100px"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-text">Already have an account? <a href="login.jsp">Login here</a></div>
                                    </div>
                                    <button id="register-btn" type="submit" class="btn custom-button">
                                        Register</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- javascript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="js/script.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const registerBtn = document.querySelector("#register-btn");
                const registerForm = document.querySelector("#register-form");
                const message = document.querySelector(".message");

                const showMessage = (text, type="info") => {
                    console.log(text, type)
                    message.innerHTML = `
                                <div class="alert alert-\${type}" role="alert">
                                  \${text}
                                </div>
                               `
                }

                registerBtn.addEventListener("click", e => {
                    e.preventDefault();

                    const form = new FormData(registerForm)

                    registerBtn.disabled = true
                    fetch("RegisterServlet", {
                        method: "POST",
                        body: form
                    }).then(res => res.text())
                        .then(data => {
                            if(data.trim()==="success") {
                                showMessage("Registration successful!", "success")
                                window.location = "login.jsp"
                            } else {
                                showMessage("Registration failed. Please try again.", "danger")
                            }
                        })
                        .catch(err => {
                            showMessage(err.message, "danger")
                            registerBtn.disabled = false;
                    }).finally(() => {
                        registerBtn.disabled = false;
                    })
                })


            })
        </script>
    </body>
</html>
