// Garra robótica com base de elevação - OpenSCAD

$fn = 60;

// ---------- PARÂMETROS ----------
esp = 5;

// ---------- BASE ----------
module base() {
    difference() {
        cube([70, 50, 8], center=true);

        // Furos da base
        for (x = [-25, 25])
            for (y = [-15, 15])
                translate([x, y, 0])
                    cylinder(h=12, r=2.5, center=true);

        // Furo central
        cylinder(h=12, r=5, center=true);
    }
}

// ---------- TORRE PARA SUBIR/DESCER ----------
module torre_vertical() {
    translate([0, -35, 35])
    difference() {
        cube([18, 12, 70], center=true);

        // furo do eixo do servo de elevação
        translate([0, 0, 18])
            rotate([90, 0, 0])
                cylinder(h=20, r=4, center=true);
    }
}

// ---------- BRAÇO DE ELEVAÇÃO ----------
module braco_elevacao() {
    translate([0, -35, 72])
    rotate([0, 0, 0])
    difference() {
        union() {
            cube([18, 65, 8], center=true);

            translate([0, -32, 0])
                cylinder(h=8, r=10, center=true);

            translate([0, 32, 0])
                cylinder(h=8, r=10, center=true);
        }

        translate([0, -32, 0])
            cylinder(h=12, r=4, center=true);

        translate([0, 32, 0])
            cylinder(h=12, r=4, center=true);
    }
}

// ---------- CORPO DA GARRA ----------
module corpo_garra() {
    translate([0, 35, 72])
    difference() {
        union() {
            cube([55, 35, 14], center=true);

            translate([0, 0, 10])
                cylinder(h=10, r=18, center=true);
        }

        // encaixe central do servo da garra
        translate([0, 0, 10])
            cylinder(h=16, r=5, center=true);
    }
}


// ---------- DEDO DA GARRA ----------
module dedo(lado = 1) {
    translate([lado * 25, 52, 72])
    rotate([0, 0, lado * 26])
    union() {

        // base circular do dedo
        difference() {
            cylinder(h=8, r=10, center=true);
            cylinder(h=12, r=3.5, center=true);
        }

        // primeiro segmento: sai mais aberto da base
        translate([lado * 9, 24, 0])
        rotate([0, 0, lado * -50])
        difference() {
            cube([14, 50, 8], center=true);

            translate([0, 8, 0])
                cylinder(h=12, r=3, center=true);
        }

        // articulação intermediária
        translate([lado * 33, 44, 0])
            cylinder(h=8, r=8, center=true);

        // segundo segmento: começa a fechar a ponta para dentro
        translate([lado * 33, 66, 0])
        rotate([0, 0, lado * 0])
            cube([14, 34, 8], center=true);

        // ponta final mais fechada
        translate([lado * 34, 90, 0])
        rotate([0, 0, lado * -100])
            cube([18, 10, 10], center=true);

        // pequena ponta de contato
        translate([lado * 32, 100, 0])
        rotate([0, 0, lado * -72])
            cube([12, 10, 10], center=true);
    }
}
// ---------- MODELO FINAL ----------
module modelo_final() {
    color("dimgray")
        base();

    color("gray")
        torre_vertical();

    color("silver")
        braco_elevacao();

    color("darkgray")
        corpo_garra();

    color("orange")
        dedo(1);

    color("orange")
        dedo(-1);

    color("lightgray")
        eixo_garra();
}

modelo_final();