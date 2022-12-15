window.addEventListener('DOMContentLoaded', () => on_Start())
function init() {
    
    instart = true;
    abc = false;
    bcd = false;

    canvas = document.getElementById('game');
    context = canvas.getContext('2d');

    next_Figurs_canvas = document.getElementById('next_Figurs');
    next_Figurs_context = next_Figurs_canvas.getContext('2d');

    Store_canvas = document.getElementById('Store');
    Store_context = Store_canvas.getContext('2d');

    window.Rect_größe = Math.floor(canvas.height/21);
    window.draw_Rect_größe = Math.floor(canvas.height/30);

    Colors  = [
        "rgb(0, 240, 240)",//   Türkis  I
        "rgb(0, 0, 240)",//     Blau    J
        "rgb(240, 160, 0)",//   Orange  L
        "rgb(240, 240, 0)",//   Gelb    O
        "rgb(160, 0, 240)",//   Lila    T
        "rgb(0, 240, 0)",//     Grün    S
        "rgb(240, 0, 0)"]//     Rot     Z

    Blöcke_x = 10;
    Blöcke_y =21;
    
    Gamestate = [];
    next_Figurs_List = [];
    for (let i = 0; i < 5; i++) next_Figurs_List.push(Math.floor(Math.random()*7));
    for (let Y = 0; Y <= Blöcke_y-1; Y++) {
        Gamestate.push([])
        for (let X = 0; X <= Blöcke_x-1; X++) {
            Gamestate[Y].push(0)
         }}
    runter_gedrückt = false;
    links_gedrückt = false;
    rechts_gedrückt = false;
    behrührt = false;
    glines = 0;
    Points = 0;
    bfps = 1;
    Stored_Block = -1;
    Stored_Block_old = -1;
    Was_Stored = false;
    bps = 10;
    Highscore = 0;
    loosetime = 0;
    ticktime = 0;
    blocktime = 0;
    runtertime = 0;
    dd=performance.now();
}

    

class Figure{
Tetreminos =[
[[1, 5, 9, 13], [4, 5, 6, 7], [2, 6, 10, 14], [8, 9, 10, 11]],//I
[[4,8,9,10],[5,6,9,13],[8,9,10,14],[5,9,12,13]], //             J
[[8,9,10,12],[4,5,9,13],[6,8,9,10],[5,9,13,14]], //             L
[[5,6,9,10],[5,6,9,10],[5,6,9,10],[5,6,9,10]], //               O
[[4,5,6,9],[1,4,5,9],[1,4,5,6],[1,5,6,9]], //                   T
[[1,2,4,5],[1,5,6,10],[5,6,8,9],[0,4,5,9]], //                  S
[[0,1,5,6],[2,5,6,9],[4,5,9,10],[1,4,5,8]]] //                  Z
    
    constructor(x,y,type) {
        type===-1 ? this.type = next_Figurs_List[0] : this.type=type
        this.x=x;
        this.y=y;
        this.color=Colors[this.type];
        this.rotation =0;
        this.Hologramm = new Hologramm(this)
    }
    rotate(direction) {
        if (direction) this.rotation = (this.rotation +1)-(4*Math.floor((this.rotation +1) / 4));
        else {this.rotation = (this.rotation -1)-(4*Math.floor((this.rotation -1) / 4))};
    }
    get pos(){return this.Tetreminos[this.type][this.rotation];
    }
}
class Hologramm{
    
    Tetreminos = [
        [[1, 5, 9, 13], [4, 5, 6, 7], [2, 6, 10, 14], [8, 9, 10, 11]],//I
        [[4,8,9,10],[5,6,9,13],[8,9,10,14],[5,9,12,13]], //             J
        [[8,9,10,12],[4,5,9,13],[6,8,9,10],[5,9,13,14]], //             L
        [[5,6,9,10],[5,6,9,10],[5,6,9,10],[5,6,9,10]], //               O
        [[4,5,6,9],[1,4,5,9],[1,4,5,6],[1,5,6,9]], //                   T
        [[1,2,4,5],[1,5,6,10],[5,6,8,9],[0,4,5,9]], //                  S
        [[0,1,5,6],[2,5,6,9],[4,5,9,10],[1,4,5,8]]] //                  Z
    
    constructor(Creator) {
        this.type = Creator.type;
        this.y = Creator.y;
        this.x = Creator.x;
        this.color = Colors[this.type];
        this.rotation = Creator.rotation;
        this.Creator = Creator;
    }
    update(){
        this.y = this.Creator.y;
        this.x = this.Creator.x;
        this.rotation = this.Creator.rotation;
        while (Hologramm_is_possible()) this.y++;
        this.y--;
    }
    get pos(){return this.Tetreminos[this.type][this.rotation]}
    }
class Draw_Figure{
    Tetreminos = [
        [1, 5, 9, 13],  //I
        [5,6,9,13],     //J
        [5,9,13,14],    //L
        [5,6,9,10],     //O
        [5,9,10,13],      //T
        [5,9,10,14],     //S
        [6,9,10,13],      //Z
    ]
   constructor(type){
        this.type = type              
        this.color = Colors[this.type]
    }
    get pos(){
        if (this.type == -1) return [-1]
        return this.Tetreminos[this.type]}
    }
function New(){
    blocktime = 0;
    if (fps===undefined) fps=60;
    dd=performance.now()-501;
    runtertime = 0.5*fps;
    new_Figur = new Figure(3,0,-1);
    while (Possible())new_Figur.y--;
    new_Figur.y ++
    if (!Possible())do_Gameover();
    Was_Stored = false;
}
function next_Figure() {
    next_Figurs_List.shift();
	next_Figurs_List.push(Math.floor(Math.random()*new_Figur.Tetreminos.length));
    New();
}
function Possible() {
    let possible = true;
    for (let Höhe = 0; Höhe < 4; Höhe++){
        for (let Breite = 0; Breite < 4; Breite++){
            let index = Höhe * 4 + Breite;                
            if(new_Figur.pos.includes(index)){
                //console.log(new_Figur.y+Höhe,new_Figur.x+Breite);
                if (new_Figur.y+Höhe>Blöcke_y-1||new_Figur.y+Höhe<0||new_Figur.x+Breite<0||new_Figur.x+Breite>Blöcke_x-1) {
                    possible = false;
                }
                else if (Gamestate[new_Figur.y+Höhe][new_Figur.x+Breite] != 0) possible = false;
            } // if (new_Figur.y+Höhe<0) possible = false;
                // if (new_Figur.x+Breite<0) possible = false;
                // if (new_Figur.x+Breite>Blöcke_x-1) possible = false;
        
        }}
    return possible;
}
function Hologramm_is_possible() {
    let possible = true;
    for (let Höhe = 0; Höhe < 4; Höhe++){
        for (let Breite = 0; Breite < 4; Breite++){
            let index = Höhe * 4 + Breite;                
            if(new_Figur.Hologramm.pos.includes(index)){
                if (new_Figur.Hologramm.y+Höhe>20) possible = false
                else if (new_Figur.Hologramm.y+Höhe<0) possible = false
                else if (Gamestate[new_Figur.Hologramm.y+Höhe][new_Figur.Hologramm.x+Breite] != 0) possible = false
            }
        
        }}
    return possible;
}
function Left() {
    new_Figur.x--;
    if (!Possible()) {new_Figur.x++;}
}
function Right() {
    new_Figur.x++;
    if (!Possible()) {new_Figur.x--;}
}
function down(Playermade) {
    if (Playermade) Points += bfps;
    new_Figur.y++;
    if (!Possible()) {
        new_Figur.y--;
        behrührt = true;
        if (performance.now()-loosetime <=1 &&!Playermade) {
            return
        }
        for (let Höhe = 0; Höhe < 4; Höhe++){
            for (let Breite = 0; Breite < 4; Breite++){
                let index = Höhe * 4 + Breite;
                if(new_Figur.pos.includes(index)) {
                    Gamestate[new_Figur.y+Höhe][new_Figur.x+Breite] = new_Figur.type+1;}
        }}
        next_Figure();
        CheckLayer();
    }
    loosetime = performance.now();
    behrührt = false;
    return false;}
function CheckLayer() {
    let lines = 0;
    Gamestate.forEach((value,index) => {
        if (!value.includes(0)) {
            lines++;
            for (let h = index; h > 0 ; h--) {
                Gamestate[h] = Gamestate[h-1];
            }
            Gamestate[0] = [];
            for (let X = 0; X <= Blöcke_x-1; X++) {
                Gamestate[0].push(0);
        }
    }});
    glines += lines
    if (lines == 0) Points +=0;
    if (lines == 1) Points +=(100*bfps);
    if (lines == 2) Points +=(300*bfps);
    if (lines == 3) Points +=(500*bfps);
    if (lines == 4) Points +=(800*bfps);
    CheckLevel();
}
function Store() {
    if (Was_Stored) return false;
    if (Stored_Block== -1) {
        Stored_Block = new_Figur.type;
        next_Figure();
        Was_Stored = true;
        return false
    }
    Stored_Block_old = Stored_Block;
    Stored_Block = new_Figur.type;
    new_Figur = new Figure(3,0,Stored_Block_old);
    while (Possible()) new_Figur.y--;
    new_Figur.y++
    Was_Stored =true
}
function rotate(direction) {
    new_Figur.rotate(direction);
    if (!Possible()) {
        new_Figur.y++
        if (!Possible()) {
            new_Figur.y--
            new_Figur.x--
            if (!Possible()) {
                new_Figur.x++;
                new_Figur.x++;
                if (!Possible()) {
                    new_Figur.x--
                    new_Figur.rotate(!direction)
    }}}}}

function CheckLevel(){
    bfps = Math.round((glines+10)/10);
    bps = 9+bfps;
}
function read(Name) {
    if (localStorage.getItem(Name)===null) {
        return 0}
    return localStorage.getItem(Name);
}
function write(Name,text) {
    localStorage.setItem(Name, text);
}
function log_Data() {
    console.log(new_Figur.x,"=x",new_Figur.y,"=y/n",new_Figur.Hologramm.x,"=Holox",new_Figur.Hologramm.y,"=Holoy");
}
function draw_Bord(){
    document.getElementById("Punkte").innerText="Punkte: "+Points;
    document.getElementById("Level").innerText="Level: "+bfps;
    context.clearRect(0, 0, canvas.width, canvas.height);
    next_Figurs_context.clearRect(0, 0, next_Figurs_canvas.width, next_Figurs_canvas.height);//SB
    Store_context.clearRect(0, 0, Store_canvas.width, Store_canvas.height);//NB
    // Stored Block zeichen
    for (let Höhe = 0; Höhe < 4; Höhe++) {
        for (let Breite = 0; Breite < 4; Breite++) {
            let index = Höhe * 4 + Breite;
            let SF = new Draw_Figure(Stored_Block)
            if (SF.pos.includes(index)) {Draw_Rect(Breite,Höhe,draw_Rect_größe,SF.color,Store_context)}//Stored Block zeichen 
        }
    }
    //Next Figurs zeichen
    for (let i = 0; i < 3; i++) {
        for (let Höhe = 0; Höhe < 4; Höhe++) {
            for (let Breite = 0; Breite < 4; Breite++) {
                let index = Höhe * 4 + Breite;
                let NB = new Draw_Figure(next_Figurs_List[i+1])
                if (NB.pos.includes(index)) {Draw_Rect(Breite,Höhe+(i*5),draw_Rect_größe,NB.color,next_Figurs_context)}//Stored Block zeichen 
            }
        }
    }
    //Gamsetate zeichen nummer = color|0=leer
    for (let Höhe = 0; Höhe < Blöcke_y; Höhe++) {
        for (let Breite = 0; Breite < Blöcke_x; Breite++) {
            if (Gamestate[Höhe][Breite]===0) Draw_Rect(Breite,Höhe,Rect_größe,"white",context);//leere Zeichnen
            else Draw_Rect(Breite,Höhe,Rect_größe,Colors[Gamestate[Höhe][Breite]-1],context); //print Colors(Gamestate[h][b])
        }
    }
    // Hologramm zeichen
    new_Figur.Hologramm.update();
    for (let Höhe = 0; Höhe < 4; Höhe++) {
        for (let Breite = 0; Breite < 4; Breite++) {
            let index = Höhe * 4 + Breite;
            if (new_Figur.Hologramm.pos.includes(index)) Draw_Rect(Breite+new_Figur.Hologramm.x,Höhe+new_Figur.Hologramm.y,Rect_größe,"gray",context);//Hologramm zeichnen
        }
    }
    // Figur zeichen
    for (let Höhe = 0; Höhe < 4; Höhe++) {
        for (let Breite = 0; Breite < 4; Breite++) {
            let index = Höhe * 4 + Breite;
            if (new_Figur.pos.includes(index)) Draw_Rect(Breite+new_Figur.x,Höhe+new_Figur.y,Rect_größe,new_Figur.color,context);//block zeichen
        }
    }
}
function Draw_Rect(pos_X,pos_Y,Größe,color,c){
    c.fillStyle = color;
    c.fillRect(pos_X * Größe, pos_Y * Größe, Größe-2, Größe-2);
}
let times=[];
let fps;
let rAF = null;
function on_Start() {
    rescale();
    document.getElementById('Fill').style.display= "block";
    document.getElementById('state').innerText="Tetris";
    document.getElementById('instruction').innerText="press Space to start";
    document.getElementById('Gameover').innerText="Highscore: "+read("Highscore");
    Started=true;
    Gameover=false;
}
function Start() {
    if (!Started) return false
    init();
    New();
    document.getElementById('Fill').style.display= "none";
    document.getElementById('state').innerText=""
    document.getElementById('instruction').innerText=""
    document.getElementById('Gameover').innerText="";
    Started=false
    window.requestAnimationFrame(gameLoop);
}
function do_Gameover() {
    window.cancelAnimationFrame(rAF);
    Highscore = read("Highscore");
    Gameover=true;
    if (parseInt(Highscore) < Points){
        Highscore = Points;
        write("Highscore",String(Highscore));
    }
    document.getElementById('Fill').style.display= "block";
    document.getElementById('state').innerText="Gameover";
    document.getElementById('instruction').innerText="press Space to restart";
    document.getElementById('Gameover').innerText="Highscore: "+Highscore;
}
function can_down() {
    let possi
    new_Figur.y++;
    Possible()?possi=true:possi=false;
    new_Figur.y--;
    return possi;
}
function rescale() {

    canvas = document.getElementById('game');
    context = canvas.getContext('2d');

    next_Figurs_canvas = document.getElementById('next_Figurs');
    next_Figurs_context = next_Figurs_canvas.getContext('2d');

    Store_canvas = document.getElementById('Store');
    Store_context = Store_canvas.getContext('2d');

    document.getElementById('h1').style.fontSize=window.innerHeight/8.651785714285714
    document.getElementById('state').style.fontSize=window.innerHeight/6.729166666666667
    document.getElementById('instruction').style.fontSize=window.innerHeight/11.4
    document.getElementById('Keys').style.fontSize=window.innerHeight/15.140625
    document.getElementById('Gameover').style.fontSize=window.innerHeight/8.651785714285714

    document.getElementById('Img').height=window.innerHeight/20
    document.getElementById('Img').width=window.innerHeight/20

    Texte = document.getElementById("Texte");

    canvas.height=window.innerHeight
    canvas.width=(window.innerHeight/2.1)

    window.Rect_größe = Math.floor(canvas.height/21);
    window.draw_Rect_größe = Math.floor(canvas.height/30);

    next_Figurs_canvas.height=draw_Rect_größe*14
    next_Figurs_canvas.width=draw_Rect_größe*4

    Store_canvas.height=draw_Rect_größe*4
    Store_canvas.width=draw_Rect_größe*4

    Texte.style.left=next_Figurs_canvas.getBoundingClientRect().left;
}
let going_down;
function Compleatly_down() {
    going_down=true;
    while (can_down()) {
        down(true);
    }
    for (let Höhe = 0; Höhe < 4; Höhe++){
        for (let Breite = 0; Breite < 4; Breite++){
            let index = Höhe * 4 + Breite;
            if(new_Figur.pos.includes(index)) {
                Gamestate[new_Figur.y+Höhe][new_Figur.x+Breite] = new_Figur.type+1;}
    }}
    next_Figure();
    CheckLayer();
    going_down=false;
}
let B_pressed = false
function pause() {
    if (Gameover) return false
    if (Started) return false
    if (rAF!==null) {
        if (B_pressed===false) {
            window.cancelAnimationFrame(rAF);
        document.getElementById('Pause').style.display= "block";
        document.getElementById('h1').innerText="Pause"
        document.getElementById('Keys').innerText=" use ← → to move the Blocks\n use A and D to rotate\nhold ↓ to lower Block \n duble tap ↓ do lower is to the bottom\n use ↑ to store a Block"

            B_pressed = true
        } else {
            window.requestAnimationFrame(gameLoop);
            document.getElementById('Pause').style.display= "none";
            document.getElementById('h1').innerText=""
            document.getElementById('Keys').innerText=""
            B_pressed =false
        }
    }
}

function key_down_events(e){
    if (e.code=== "Escape") pause();
    if (e.code === "ArrowUp"){Store();}
    if (e.code === "KeyA"){rotate(false);}
    if (e.code === "KeyD"){rotate(true);}
    if (e.code === "ArrowDown") {
        if (!runter_gedrückt) {
        runter_gedrückt=true;
        if (blocktime/fps>= 1/bps) {
            blocktime = 0;
            if (performance.now()-dd<=0.3*1000){
                Compleatly_down();
        }}
            dd=performance.now();
        }} //console.log(runter_gedrückt=true);
    if (e.code === "ArrowLeft") {links_gedrückt =true;}
    if (e.code === "ArrowRight") {rechts_gedrückt =true;}
    if (e.code==="KeyR") {rescale()}
    if (e.code==="Space") {
        restart(); 
        Start();
}}
function restart() {
    if (!Gameover) return false
    init();
    document.getElementById('Fill').style.display= "none";
    document.getElementById('state').innerText=""
    document.getElementById('instruction').innerText=""
    document.getElementById('Gameover').innerText="";
    Gameover=false
    window.requestAnimationFrame(gameLoop);
}
    
function gameLoop(timeStamp) {
    rAF = requestAnimationFrame(gameLoop);
    const now  = performance.now();
    while (times.length>0&&times[0]<=now-1000){
        times.shift();
    }
    times.push(now);
    fps = times.length;
    
    
    if (runter_gedrückt) {if (blocktime/fps>= 1/bps) {blocktime = 0; down(true);}}
    if (rechts_gedrückt) {if (blocktime/fps>= 1/bps) {blocktime = 0; Right();}}
    if (links_gedrückt) {if (blocktime/fps>= 1/bps) {blocktime = 0; Left();}}
    blocktime++;
    draw_Bord();

    if (++runtertime/fps>= 1/bfps) {
        down(false);
        runtertime = 0;
    }}

document.addEventListener("keydown",(e) => {
    key_down_events(e);
})

document.addEventListener("keyup",(e) => {
    if (e.code === "ArrowDown") runter_gedrückt =false;
    if (e.code === "ArrowLeft") links_gedrückt =false;
    if (e.code === "ArrowRight") rechts_gedrückt =false;
})
