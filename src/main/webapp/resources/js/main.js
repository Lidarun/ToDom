let userbox = document.querySelector('#menu-icon');
let navbar = document.querySelector('.navbar');

userbox.onclick = () => {
    userbox.classList.toggle('bx-x');
    navbar.classList.toggle('open');
}