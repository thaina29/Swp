document.querySelector('.custom-dropbtn').addEventListener('click', function () {
    const dropdownContent = document.getElementById('customDropdownContent');
    dropdownContent.style.display = dropdownContent.style.display === 'block' ? 'none' : 'block';
});
document.querySelector('.customUserImage').addEventListener('click', function () {
    const dropdownContent = document.getElementById('customDropdownContent');
    dropdownContent.style.display = dropdownContent.style.display === 'block' ? 'none' : 'block';
});
window.onclick = function (event) {
    if (!event.target.matches('.custom-dropbtn')) {
        const dropdowns = document.getElementsByClassName("custom-dropdown-content");
        for (let i = 0; i < dropdowns.length; i++) {
            const openDropdown = dropdowns[i];
            if (openDropdown.style.display === 'block') {
                openDropdown.style.display = 'none';
            }
        }
    }
}

