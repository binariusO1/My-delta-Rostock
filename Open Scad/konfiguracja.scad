/*
    PARAMETRY UKŁADU
*/
    // WIELKOŚCI GŁÓWNE
 
     //MKY3
     //dg
    srednica_grzalki=[214,214];
        
    //dw
    //Średnica wałka prowadzącego
    srednica_walka=8;
    
    //H
    // Wysokość konstrukcji (zależna od prowadnic fi8) [H]
    // Wysokosc manipulatora (750mm) wynika z założonego materiału (długość pręta fi8 150cm)
    wysokosc_konstrukcji=750;


    // WIELKOŚCI INNE
    
    
    // Wysokość dolnej podstawy od ziemii   [h]
    //(motor_end_height)
    wysokosc_podstawy=62.3;
    
    
    // Grubość podstawy górnej i dolnej
    grubosc_podstawy=8;
    
    // Wysokość stołu grzejnego wraz z grubością
    wysokosc_grzalki=2;
    
    
    
    //Zaokrąglenie podstawy
    corner_radius=12;
    
    //Grubość platformy roboczej
    grubosc_platformy=8;
    

    // WARTOŚCI OBLICZONE
    
    //rk
    promien_konstrukcji = srednica_grzalki[0]*0.9;
    //192,6mm
    // wyznaczenie położenia prętów i innych elekentów konstrukcji od środka układu współrzędnych
    
    dlugosc_ramion=srednica_grzalki[0]*1.2;
    //259,2

    //Promień podstawy
    //frame_radius
    promien_podstawy=(promien_konstrukcji-srednica_walka/2-1.9*corner_radius)/cos(30);
    platform_hinge_offset=33;
    carriage_hinge_offset=22;             // default rostock mini platform
    wysokosc_wozka=32;
    idler_end_height=32; 
    
    //echo
    echo("Promień konstrukcji",promien_konstrukcji);
    echo("Długość ramion",dlugosc_ramion);
    echo("Promień podstawy",promien_podstawy);
    
    dlugosc_tasmy=ceil((25*3.14/2)+((22+0)*3.14/2)+2*(wysokosc_konstrukcji-42.3/2-5-14.95));
    echo("Długość taśmy",dlugosc_tasmy,"mm");
    ilosc_modulow=dlugosc_tasmy/2;
    echo("Ilość modułów",ilosc_modulow);