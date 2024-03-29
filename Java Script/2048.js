window.addEventListener('DOMContentLoaded', () => init())
function init(){
    Highscore = read("Highscore2048")
    if(Highscore == null){Highscore = "0"}
    Gamestate=[];
    Points = 0;
    for(let Breite=0;Breite<4;Breite++){
        Gamestate.push([])
        for(let Länge=0;Länge<4;Länge++){
            Gamestate[Breite].push(0)
    }}
    new_Block();new_Block();
    if(read("Localsavefile") != null){
        loadProgress(read("Localsavefile"))}
    Gameoverstate = false;
    
}
function read(Name) {
    if (localStorage.getItem(Name)===null) {
        return null}
    return localStorage.getItem(Name);
}
function write(Name,text) {
    localStorage.setItem(Name, text);
}
function löschen(Name){ //delete ist reserviert...
    localStorage.removeItem(Name) 
}
function saveProgress(){
    Ergebnis = ""
    Gamestate.forEach((useless,firstIndex)=>{
        Gamestate[firstIndex].forEach((value,secondIndex)=>{
        Ergebnis = Ergebnis + value.toString(10) + ";"


        })
    })        
    Ergebnis = Ergebnis + Points.toString(10)
    return(Ergebnis)
}
function loadProgress(Savefile){
    PreGamestate = []
    tempValue = ""
    for (let index = 0; index < Savefile.length; index++) {
        value = Savefile[index]    
        if (value == ";") {
            PreGamestate.push(parseInt(tempValue))
            tempValue = ""
        }
        else {
            tempValue=tempValue+value
        }
    }
    Gamestate = [[PreGamestate[0],PreGamestate[1],PreGamestate[2],PreGamestate[3]],[PreGamestate[4],PreGamestate[5],PreGamestate[6],PreGamestate[7]],[PreGamestate[8],PreGamestate[9],PreGamestate[10],PreGamestate[11]],[PreGamestate[12],PreGamestate[13],PreGamestate[14],PreGamestate[15]]]
    Points = parseInt(tempValue)
    update()
}
function update(){
    if (checkdeath()==true){Gameover()}
    document.getElementById("Score").innerText = "Score:\n"+String(Points);
    document.getElementById("Highscore").innerText= "Highscore:\n"+Highscore.toString(10);
    Gamestate.forEach((useless,firstIndex)=>{
        Gamestate[firstIndex].forEach((value,secondIndex)=>{
            
            index=firstIndex*4+secondIndex;
            if(value==undefined){return;}
            if(value==0){value=""}
            document.getElementById(String(index+1)).innerHTML=value;
            if (value == ""){
                document.getElementById(String(index+1)).style.backgroundColor = "#ffffff";
                return
            }
            if(value <= 64){
            document.getElementById(String(index+1)).style.backgroundColor = "#ff"+(255-(value*3)+1).toString(16)+(255-(value*3)+1).toString(16);
            }
            else if(value <= 1024){
                document.getElementById(String(index+1)).style.backgroundColor = "#ff00"+((value/4)-1).toString(16);
                document.getElementById(String(index+1)).style.fontSize = "15vh";
            }
            else if(value == 1024){
                document.getElementById(String(index+1)).style.backgroundColor = "#ff00"+((value/4)-1).toString(16);
                document.getElementById(String(index+1)).style.fontSize = "12vh";
            }
            else if(value <= 2048){
                document.getElementById(String(index+1)).style.backgroundColor = "#aaffaa";
                document.getElementById(String(index+1)).style.fontSize = "8vh";
            }
            else {
                document.getElementById(String(index+1)).style.backgroundColor = "#111111";
            }
            })
    })
    //checkFont()
}
function checkFont(){
    Gamestate.forEach((useless,firstIndex)=>{
        Gamestate[firstIndex].forEach((value, secondindex) => {
            let id = (firstIndex+1)*4+(secondindex+1);
            let ziffern = value.toString(10).length;
            var kasten = document.getElementById(id.toString(10));
            kasten.style.fontsize = (20-ziffern*2).toString+"em";

    })})
}
function new_Block() {
    FreeSpaces = [];
    Gamestate.forEach((useless, firstIndex) => {
        Gamestate[firstIndex].forEach((value, index) => {
            if (value != 0) { return; }
            FreeSpaces.push([firstIndex, index]);
        })
    })
    if (FreeSpaces.length == 0) { Gameover(); return; }
    let rand = Math.floor(Math.random() * FreeSpaces.length)
    let y = FreeSpaces[rand][0]
    let x = FreeSpaces[rand][1]
    let val = (0 == Math.floor(Math.random() * 4)) ? 4 : 2
    Gamestate[y][x] = val
    setTimeout(function () {update(); }, 200);
    
}
function Gameover() {
    console.log("Gameover")
    löschen("Localsavefile")
    Highscore = read("Highscore2048");
    if(Highscore == null){Highscore = 0}
    if (parseInt(Highscore) < Points){
        Highscore = Points;
        write(String(Highscore));
    }
    write("Highscore2048", Highscore)
    document.getElementById("h1").innerHTML="Gameover"
    document.getElementById("h3").innerHTML="Drücke Irgndetwas zum Neustarten"
    document.body.style.backgroundColor = "red";
    Gameoverstate = true;
}

function Resume() {
    document.body.style.backgroundColor = "#BAD1CD";
    document.getElementById("h1").innerHTML="2048"
    document.getElementById("h3").innerHTML=""
    init()
}

function right() {
        let moved = false
        let firstIndex;
        let alreadymearged = 0;
        Gamestate.forEach((useless, firstIndex) => {
            for (let index = useless.length - 1; index >= 0; index--) {
                let value = Gamestate[firstIndex][index];
                let tempindex = index;
                let TempGamestate = Array.from(Gamestate, a => a);
                if (value == 0) { continue; }
                while (index >= 0 && index != 3 && (Gamestate[firstIndex][index + 1] == 0 || Gamestate[firstIndex][index + 1] == value)) {
                    if (Gamestate[firstIndex][index + 1] == value) {
                    
                        if (alreadymearged == ((index + 1) + 1) * ((firstIndex) + 1)) {
                            alreadymearged = 0;
                            break;
                        }
                        alreadymearged = ((index + 1) + 1) * ((firstIndex) + 1);

                        TempGamestate[firstIndex][index] = 0;
                        Gamestate[firstIndex][index] = 0;
                        index++;
                        TempGamestate[firstIndex][index] = value * 2;
                        Gamestate[firstIndex][index] = value * 2;
                        Points = Points+value*2
                        moved = true;
                        break;

                    
                    } else if (Gamestate[firstIndex][index + 1] == 0) {
                        TempGamestate[firstIndex][index] = 0;
                        Gamestate[firstIndex][index] = 0;
                        TempGamestate[firstIndex][index + 1] = value;
                        Gamestate[firstIndex][index + 1] = value;
                        index++;
                        moved = true;
                    }

                }
                //animations list here
                index = tempindex;
                Gamestate = TempGamestate;
            }
        })
        update();
        if (moved == false) {return;}
        new_Block();
        write("Localsavefile",saveProgress())
    }
function left() {
        let moved = false
        let firstIndex;
        let alreadymearged = 0;
        Gamestate.forEach((useless, firstIndex) => {
            let len = useless.length - 1;
            for (let index = 0; index <= len; index++) {
                let value = Gamestate[firstIndex][index];
                let tempindex = index;
                if (value == 0) { continue; }
                while (index <= 3 && index != 0 && (Gamestate[firstIndex][index - 1] == 0 || Gamestate[firstIndex][index - 1] == value)) {
                    if (Gamestate[firstIndex][index - 1] == value) {
                        if (alreadymearged == ((index - 1) + 1) * ((firstIndex) + 1)) {
                            alreadymearged = 0;
                            break;
                        }
                        alreadymearged = ((index - 1) + 1) * ((firstIndex) + 1);
                        Gamestate[firstIndex][index] = 0;
                        value = value * 2;
                        Gamestate[firstIndex][index - 1] = value;
                        index--;
                        moved = true;
                        Points = Points+value*2
                        break;
                    } else if (Gamestate[firstIndex][index - 1] == 0) {
                        Gamestate[firstIndex][index] = 0;
                        Gamestate[firstIndex][index - 1] = value;
                        index--;
                        moved = true;
                    }
                }
                //animations list here
                index = tempindex;
            }
        })
        update();
        if (moved == false) {return; }
        new_Block();
        write("Localsavefile",saveProgress())
    }//<=3   !4  0,1,2,3
    // <=12   !16 0,4,8,12
function up() {
        let moved = false;
        let len = Gamestate.length - 1
        let alreadymearged = 0;
        for (let firstIndex = 0; firstIndex <= len; firstIndex++) {
            for (let secondIndex = 1; secondIndex <= len; secondIndex++) {
                let index = secondIndex;
                let value = Gamestate[secondIndex][firstIndex];
                if (value == 0) { continue; }
                while (index > 0 && (Gamestate[index - 1][firstIndex] == value || Gamestate[index - 1][firstIndex] == 0)) {
                    value = Gamestate[index][firstIndex];
                    if (Gamestate[index - 1][firstIndex] == value) {
                        if (alreadymearged == ((index - 1) + 1) * ((firstIndex) + 1)) {
                            alreadymearged = 0;
                            break;
                        }
                        value = value * 2;
                        Gamestate[index - 1][firstIndex] = value;
                        Gamestate[index][firstIndex] = 0;
                        alreadymearged = ((index - 1) + 1) * ((firstIndex) + 1);
                        index--;
                        moved = true;
                        Points = Points+value*2
                        break;
                    
                    }
                    else if (Gamestate[index - 1][firstIndex] == 0) {
                        Gamestate[index - 1][firstIndex] = value;
                        Gamestate[index][firstIndex] = 0;
                        index--;
                        moved = true;
                    
                    }

                }
                secondIndex = index;
            }
        }
        update();
        if (moved == false) {return; }
        new_Block();
        write("Localsavefile",saveProgress())
    }
function down() {
        let moved = false;
        let len = Gamestate.length - 1
        let alreadymearged = 0;
        for (let firstIndex = 0; firstIndex <= len; firstIndex++) {
            for (let secondIndex = len; secondIndex >= 0; secondIndex--) {
                let index = secondIndex;
                let value = Gamestate[secondIndex][firstIndex];
                if (value == 0) { continue; }
                while (index < len && (Gamestate[index + 1][firstIndex] == value || Gamestate[index + 1][firstIndex] == 0)) {
                    value = Gamestate[index][firstIndex];
                    if (Gamestate[index + 1][firstIndex] == value) {
                        if (alreadymearged == ((index + 1) + 1) * ((firstIndex) + 1)) {
                            alreadymearged = 0;
                            break;
                        }
                        
                        value = value * 2;
                        Gamestate[index + 1][firstIndex] = value;
                        Gamestate[index][firstIndex] = 0;
                        alreadymearged = ((index + 1) + 1) * ((firstIndex) + 1);
                        index--;
                        moved = true;
                        Points = Points+value*2
                        break;
                    
                    }
                    else if (Gamestate[index + 1][firstIndex] == 0) {
                        Gamestate[index + 1][firstIndex] = value;
                        Gamestate[index][firstIndex] = 0;
                        index++;
                        moved = true;
                    
                    }

                }
                secondIndex = index;
            }
        }
        update();
        if (moved == false) {; return; }
        new_Block();
        write("Localsavefile",saveProgress())
    }
function checkdeath() {
        let len = Gamestate.length - 1
        let value
        for (let firstindex = 0; firstindex < len+1; firstindex++) {
            for (let secondindex = 0; secondindex < len+1; secondindex++) {
                value = Gamestate[firstindex][secondindex];
                if (value == 0) { return false; }
                if (firstindex != 0) {
                    if (Gamestate[firstindex - 1][secondindex] == value) {
                        return false;
                    }
                }
                if (firstindex != len) {
                    if (Gamestate[firstindex + 1][secondindex] == value) {
                        return false;
                    }
                }
                if (secondindex != 0) {
                    if (Gamestate[firstindex][secondindex - 1] == value) {
                        return false;
                    }
                }
                if (secondindex != len) {
                    if (Gamestate[firstindex][secondindex + 1] == value) {
                        return false;
                    }
                
                }
            
            
            }
        
        }
        return true;

    }

    document.addEventListener('touchstart', handleTouchStart, false);        
    document.addEventListener('touchmove', handleTouchMove, false);
    
    var xDown = null;                                                        
    var yDown = null;
    
    function getTouches(evt) {
      return evt.touches ||             // browser API
             evt.originalEvent.touches; // jQuery
    }                                                     
                                                                             
    function handleTouchStart(evt) {
        const firstTouch = getTouches(evt)[0];                                      
        xDown = firstTouch.clientX;                                      
        yDown = firstTouch.clientY;                                      
    };                                                
                                                                             
    function handleTouchMove(evt) {
        if ( ! xDown || ! yDown ) {
            return;
        }
        
        if(Gameoverstate == true){Resume()}

        var xUp = evt.touches[0].clientX;                                    
        var yUp = evt.touches[0].clientY;
    
        var xDiff = xDown - xUp;
        var yDiff = yDown - yUp;
                                                                             
        if ( Math.abs( xDiff ) > Math.abs( yDiff ) ) {/*most significant*/
            if ( xDiff > 0 ) {
                /* right swipe */ 
                left()
            } else {
                /* left swipe */
                right()
            }                       
        } else {
            if ( yDiff > 0 ) {
                /* down swipe */ 
                up()
            } else { 
                /* up swipe */
                down()
            }                                                                 
        }
        /* reset values */
        xDown = null;
        yDown = null;                                             
    };

document.addEventListener("keydown", (e) => {
        
        if (e.code === "ArrowDown" | e.code === "KeyS") { down() }
        else if (e.code === "ArrowUp" | e.code === "KeyW") { up() }
        else if (e.code === "ArrowLeft" | e.code === "KeyA") { left() }
        else if (e.code === "ArrowRight" | e.code === "KeyD") { right() }
        else if(Gameoverstate == true){Resume()}
    })
