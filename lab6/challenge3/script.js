document.querySelectorAll('nav a').forEach(link => {
    link.addEventListener('click', event => {
        alert('clicked!');
        event.preventDefault(); 
    });
});
