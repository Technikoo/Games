let B_pressed = false
function pause() {
        if (B_pressed===false) {
        document.getElementById('Pause').style.display= "block";
            B_pressed = true
        } else {
            document.getElementById('Pause').style.display= "none";
    }
}