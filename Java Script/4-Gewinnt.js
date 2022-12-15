window.addEventListener('DOMContentLoaded', () => init())
function init(){
    isAktiv=true;
    Gamestate=[]
    Player="Rot";
    for (let Breite = 0; Breite < 7; Breite++) {
        Gamestate.push([])
        for (let Höhe = 0; Höhe < 6; Höhe++) {
                Gamestate[Breite].push(0)
    }}}
const next_player = () => {
    Player = Player === 'Rot' ? 'Gelb' : 'Rot';
}

const Img = {
    Rot:"../images/rot.gif",
    Gelb:"../images/gelb.gif",
    Leer:"../images/leer.gif"
};
function Won(colum,row) {
    if (CheckWin(colum,row)){
        isAktiv=false;
        Player == 'Rot' ? document.getElementById("h1").style.color="Red" : document.getElementById("h1").style.color="yellow";
        document.getElementById("h1").innerHTML ="Spieler "+ Player + " hat das Spiel gewonnen";
    }
    tie=true;
    Gamestate.forEach(element => {
        if (element.includes(0)) tie=false;
    });
    if (tie) {
        document.getElementById("h1").innerHTML = "Unentschieden";
        isAktiv=false;
    }
}
function reset() {
    Array.from(document.querySelectorAll('.feld')).forEach(element => {
        element.src=Img["Leer"]
    });
    isAktiv=true;
    Gamestate=[]
    Player="Rot";
    for (let Breite = 0; Breite < 7; Breite++) {
        Gamestate.push([])
        for (let Höhe = 0; Höhe < 6; Höhe++) {
                Gamestate[Breite].push(0)
                document.getElementById("h1").innerHTML =""
    }}}
function CheckWin(colum,row){
    P = Gamestate[colum][row]
    x=colum
    y=row
    count=1;

    // check down
    while (Gamestate[x][y+1]===P) {
        y++;
        count++;
        if (count>=4){return true}
    }
    x=colum
    y=row
    count=1;
    //right
    if (Gamestate[x+1]!==undefined){
    while (Gamestate[x+1][y]===P) {
        console.log(x,y,count,Gamestate[x][y],"right",count);
        x++;
        count++;
        if (count>=4){return true}
        if (Gamestate[x+1]===undefined) {break;}
    }}
    x=colum
    y=row
    //plus left
    if (Gamestate[x-1]!==undefined){
    while (Gamestate[x-1][y]===P) {
        console.log(x,y,count,Gamestate[x][y],"left",count);
        x--;
        count++;
        if (count>=4){return true}
        if (Gamestate[x-1]===undefined) {break;}
    }}
    x=colum
    y=row
    count=1;
    //diagnoly down right
    if (Gamestate[x+1]!==undefined){if (Gamestate[x][y+1]!==undefined){
    while (Gamestate[x+1][y+1]===P) {
        x++;
        y++;
        count++;
        if (count>=4){return true}
        if (Gamestate[x+1]===undefined||Gamestate[x][y+1]===undefined) {break;}
    }}}
    x=colum
    y=row
    //plus diagnoly up left
    if (Gamestate[x-1]!==undefined){if (Gamestate[x][y-1]!==undefined){
        while (Gamestate[x-1][y-1]===P) {
            x--;
            y--;
            count++;
            if (count>=4){return true}
            if (Gamestate[x-1]===undefined||Gamestate[x][y-1]===undefined) {break;}
        }}}

    x=colum
    y=row
    count=1;
    //diagnoly down right
    if (Gamestate[x+1]!==undefined){if (Gamestate[x][y-1]!==undefined){
    while (Gamestate[x+1][y-1]===P) {
        x++;
        y--;
        count++;
        if (count>=4){return true}
        if (Gamestate[x+1]===undefined||Gamestate[x][y-1]===undefined) {break;}
    }}}
    x=colum
    y=row
    //plus diagnoly up left
    if (Gamestate[x-1]!==undefined){if (Gamestate[x][y+1]!==undefined){
        while (Gamestate[x-1][y+1]===P) {
            x--;
            y++;
            count++;
            if (count>=4){return true}
            if (Gamestate[x-1]===undefined||Gamestate[x][y+1]===undefined) {break;}
        }}}
    return false

}
function click_event(colum) {
    if (isAktiv==false) {
        reset();
        isAktiv=true;
        return false;}
    let to_set=0;
    G_length=Gamestate[colum].length-1
    for (let i = 0; i < G_length; i++) {
        const elm = Gamestate[colum];
        if (elm[i]===0&&elm[i+1]===0) to_set++;
    }
    if (Gamestate[colum][to_set]===0) {Gamestate[colum][to_set]=Player;
    document.getElementById(colum+"|"+to_set).src = Img[Player];
    Won(colum,to_set);
    next_player();
}}