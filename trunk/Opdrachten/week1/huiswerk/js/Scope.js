var iterator,
    max,
    min;

(function() {
    var iterator,
        max,
        min;

    // Een closure is een programmeer begrip waarmee je encapsulatie kunt nabootsen.
    // Een closure is een locale scope van een function. 
    // Hiermee kun je variable verbergen zodat dingen van buiten de closure deze variable niet kunnen aanpassen.
    // Zo kun je dus encapsulatie nabootsen en nog veel meer vette dingen doen.
    // Dingen van binnen de closure kunnen wel dingen buiten de closure benaderen.
    
    var dat = 'Ik ben niet zo beschermd als dat... :(';
    function test() {
        var dit = 'Ik ben beschremd!';
    }

    // Tevens komt de scope van een functie mee als je hem doorgeeft aan een hoge orde functie.

}());
