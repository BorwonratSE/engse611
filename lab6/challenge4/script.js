document.querySelectorAll('nav a').forEach(link => {
    link.addEventListener('click', function(event) {
        alert(this.textContent); 
        event.preventDefault(); 
    });
});
