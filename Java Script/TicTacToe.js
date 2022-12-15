window.addEventListener('DOMContentLoaded', () => {
    const feld = Array.from(document.querySelectorAll('.feld'));
    let Player = "X";
    ended=false;
    Game = ["", "", "", "", "", "", "", "", ""];
    win_condicones = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
];


function möglich(index) {
    if (Game[index] != "") {
        return false
    } else return true
}
const next_player = () => {
    Player = Player === 'X' ? 'O' : 'X';
} 

function show_change(tile) {
    let Color;
    Player === 'X' ? Color = '#340c95' :Color = "green";
    tile.style.color = Color;
    tile.classList.add('noHover');
    tile.innerText = Player;
}

function reset() {
    ended=false;
    document.getElementById("h1").innerHTML =" ";
    let Player = "X";
    Game = ['', '', '', '', '', '', '', '', ''];
    for (let index = 0; index < feld.length; index++) {
        const tile = feld[index];
        tile.innerText = "";
    }
}

function win() {
    let winner;
    let Won = false;
    for (let i = 0; i <= win_condicones.length - 1; i++) {
        const a = Game[win_condicones[i][0]];
        const b = Game[win_condicones[i][1]];
        const c = Game[win_condicones[i][2]];
        if (a === "" || b === "" || c === "") {
            continue;
        }
        if (a === b && b === c) {
            Won = true;
            winner = a;
            break;
        }
    }
    if (Won) {
        document.getElementById("h1").innerHTML ="Spieler "+ winner + " hat das Spiel Gewonnen";
        ended = true;
        feld.forEach(tile => tile.classList.remove('noHover'));
    } else if (!Game.includes("")) {
        ended = true;
        document.getElementById("h1").innerHTML = "Unentschieden";
        feld.forEach(tile => tile.classList.remove('noHover'));
    }
    
}

function änder_Feld(tile, index) {
    if (ended) {reset();return;}
    if (!möglich(index)) {
        return
    } else Game[index] = Player
    show_change(tile);
    win();
    next_player();
}
feld.forEach((tile, index) => tile.addEventListener('click', () => änder_Feld(tile, index)))
})
function pause() {
    if (B_pressed===false) {
    document.getElementById('Pause').style.display= "block";
        B_pressed = true
    } else {
        document.getElementById('Pause').style.display= "none";
    }
}
