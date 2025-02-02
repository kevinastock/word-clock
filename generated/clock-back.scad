module m5() {
    cube([177, 177, 5], center=false);
}

module m4() {
    translate([1.5, 1.5, 0])
        m5();
}

module m7() {
    cube([159.75, 159.75, 14.5], center=false);
}

module m6() {
    translate([10.125, 10.125, 0])
        m7();
}

module m3() {
    union() {
        m4();
        m6();
    }
}

module m10() {
    cylinder(h=1000000, d=2.85, center=false, $fn=20);
}

module m11() {
    cylinder(h=2, d=4.5, center=false, $fn=20);
}

module m9() {
    union() {
        m10();
        m11();
    }
}

module m8() {
    translate([5.832738110421965, 5.832738110421965, 0])
        m9();
}

module m14() {
    cylinder(h=1000000, d=2.85, center=false, $fn=20);
}

module m15() {
    cylinder(h=2, d=4.5, center=false, $fn=20);
}

module m13() {
    union() {
        m14();
        m15();
    }
}

module m12() {
    translate([5.832738110421965, 174.16726188957804, 0])
        m13();
}

module m18() {
    cylinder(h=1000000, d=2.85, center=false, $fn=20);
}

module m19() {
    cylinder(h=2, d=4.5, center=false, $fn=20);
}

module m17() {
    union() {
        m18();
        m19();
    }
}

module m16() {
    translate([174.16726188957804, 5.832738110421965, 0])
        m17();
}

module m22() {
    cylinder(h=1000000, d=2.85, center=false, $fn=20);
}

module m23() {
    cylinder(h=2, d=4.5, center=false, $fn=20);
}

module m21() {
    union() {
        m22();
        m23();
    }
}

module m20() {
    translate([174.16726188957804, 174.16726188957804, 0])
        m21();
}

module m25() {
    cube([155.75, 155.75, 1000000], center=false);
}

module m24() {
    translate([12.125, 12.125, 1.5])
        m25();
}

module m27() {
    cube([5, 29.25, 1000000], center=true);
}

module m26() {
    translate([90.0, 0, 0])
        m27();
}

module m29() {
    cylinder(h=1000000, d=5, center=true, $fn=40);
}

module m28() {
    translate([90.0, 14.625, 0])
        m29();
}

module m2() {
    difference() {
        m3();
        m8();
        m12();
        m16();
        m20();
        m24();
        m26();
        m28();
    }
}

module m33() {
    cylinder(h=3.5, d=8, center=true, $fn=40);
}

module m32() {
    translate([0, 0, 1.75])
        m33();
}

module m35() {
    cylinder(h=6.5, d=3.1, center=true, $fn=40);
}

module m34() {
    translate([0, 0, 3.25])
        m35();
}

module m31() {
    union() {
        m32();
        m34();
    }
}

module m30() {
    translate([161.875, 36.125, 0])
        m31();
}

module m39() {
    cylinder(h=3.5, d=8, center=true, $fn=40);
}

module m38() {
    translate([0, 0, 1.75])
        m39();
}

module m41() {
    cylinder(h=6.5, d=3.1, center=true, $fn=40);
}

module m40() {
    translate([0, 0, 3.25])
        m41();
}

module m37() {
    union() {
        m38();
        m40();
    }
}

module m36() {
    translate([77.975, 36.125, 0])
        m37();
}

module m45() {
    cylinder(h=3.5, d=8, center=true, $fn=40);
}

module m44() {
    translate([0, 0, 1.75])
        m45();
}

module m47() {
    cylinder(h=6.5, d=3.1, center=true, $fn=40);
}

module m46() {
    translate([0, 0, 3.25])
        m47();
}

module m43() {
    union() {
        m44();
        m46();
    }
}

module m42() {
    translate([161.875, 89.425, 0])
        m43();
}

module m51() {
    cylinder(h=3.5, d=8, center=true, $fn=40);
}

module m50() {
    translate([0, 0, 1.75])
        m51();
}

module m53() {
    cylinder(h=6.5, d=3.1, center=true, $fn=40);
}

module m52() {
    translate([0, 0, 3.25])
        m53();
}

module m49() {
    union() {
        m50();
        m52();
    }
}

module m48() {
    translate([77.975, 89.425, 0])
        m49();
}

module m55() {
    cylinder(h=14.5, d=8, center=false, $fn=40);
}

module m54() {
    translate([140, 120, 0])
        m55();
}

module m57() {
    cylinder(h=14.5, d=8, center=false, $fn=40);
}

module m56() {
    translate([40, 110, 0])
        m57();
}

module m59() {
    cylinder(h=14.5, d=8, center=false, $fn=40);
}

module m58() {
    translate([90.0, 105, 0])
        m59();
}

module m61() {
    cylinder(h=14.5, d=8, center=false, $fn=40);
}

module m60() {
    translate([135.0, 17.325, 0])
        m61();
}

module m63() {
    cube([8.0001, 25.0001, 14.5], center=false);
}

module m62() {
    translate([12.125, 142.875, 0])
        m63();
}

module m65() {
    cube([8.0001, 25.0001, 14.5], center=false);
}

module m64() {
    translate([159.875, 142.875, 0])
        m65();
}

module m67() {
    cube([38.849999999999994, 2, 14.5], center=false);
}

module m66() {
    translate([12.125, 65.275, 0])
        m67();
}

module m70() {
    cylinder(h=14.5, d=31, center=false, $fn=40);
}

module m71() {
    cylinder(h=1000000, d=27, center=false, $fn=40);
}

module m69() {
    difference() {
        m70();
        m71();
    }
}

module m68() {
    translate([32.625, 44.775, 0])
        m69();
}

module m74() {
    cylinder(h=14.5, d=45, center=false, $fn=40);
}

module m75() {
    cylinder(h=1000000, d=41, center=false, $fn=40);
}

module m77() {
    cube([1000000, 1000000, 1000000], center=true);
}

module m76() {
    translate([-500000.0, 0, 0])
        m77();
}

module m80() {
    cube([1000000, 1000000, 1000000], center=true);
}

module m79() {
    translate([0, 500000.0, 0])
        m80();
}

module m78() {
    rotate([0, 0, -35])
        m79();
}

module m73() {
    difference() {
        m74();
        m75();
        m76();
        m78();
    }
}

module m72() {
    translate([32.625, 44.775, 0])
        m73();
}

module m83() {
    cube([95.5, 19.5, 9.5], center=false);
}

module m85() {
    cube([13.5, 18, 1000000], center=false);
}

module m84() {
    translate([1.5, 0, 0])
        m85();
}

module m87() {
    cube([13.5, 18, 1000000], center=false);
}

module m86() {
    translate([16.5, 0, 0])
        m87();
}

module m89() {
    cube([30.5, 18, 1000000], center=false);
}

module m88() {
    translate([31.5, 0, 0])
        m89();
}

module m91() {
    cube([30.5, 18, 1000000], center=false);
}

module m90() {
    translate([63.5, 0, 0])
        m91();
}

module m82() {
    difference() {
        m83();
        m84();
        m86();
        m88();
        m90();
    }
}

module m81() {
    translate([27.25, 128.5, 0])
        m82();
}

module m100() {
    circle(r=8, $fn=40);
}

module m99() {
    translate([10.5, 0, 0])
        m100();
}

module m98() {
    rotate_extrude(convexity=10, $fn=40)
        m99();
}

module m102() {
    cube([1000000, 1000000, 1000000], center=true);
}

module m101() {
    translate([0, 0, -500000.0])
        m102();
}

module m104() {
    cube([1000000, 1000000, 1000000], center=true);
}

module m103() {
    translate([0, -500000.0, 0])
        m104();
}

module m97() {
    difference() {
        m98();
        m101();
        m103();
    }
}

module m105() {
    cylinder(h=1000000, d=26, center=true, $fn=40);
}

module m96() {
    intersection() {
        m97();
        m105();
    }
}

module m95() {
    translate([0, 2.5, 0])
        m96();
}

module m108() {
    cylinder(h=2.5, center=false, r=8, $fn=40);
}

module m107() {
    rotate([-90, 0, 0])
        m108();
}

module m106() {
    translate([10.5, 0, 0])
        m107();
}

module m111() {
    cylinder(h=2.5, center=false, r=8, $fn=40);
}

module m110() {
    rotate([-90, 0, 0])
        m111();
}

module m109() {
    translate([-10.5, 0, 0])
        m110();
}

module m94() {
    union() {
        m95();
        m106();
        m109();
    }
}

module m113() {
    cube([1000000, 1000000, 1000000], center=true);
}

module m112() {
    translate([0, 0, -500000.0])
        m113();
}

module m115() {
    cube([1000000, 1000000, 1000000], center=true);
}

module m114() {
    translate([500013.0, 0, 0])
        m115();
}

module m117() {
    cube([1000000, 1000000, 1000000], center=true);
}

module m116() {
    translate([-500013.0, 0, 0])
        m117();
}

module m93() {
    difference() {
        m94();
        m112();
        m114();
        m116();
    }
}

module m92() {
    translate([90.0, 12.125, 1.4999])
        m93();
}

module m1() {
    union() {
        m2();
        m30();
        m36();
        m42();
        m48();
        m54();
        m56();
        m58();
        m60();
        m62();
        m64();
        m66();
        m68();
        m72();
        m81();
        m92();
    }
}

module m121() {
    cylinder(h=500000.0, d=5, center=true, $fn=40);
}

module m120() {
    rotate([-45, 0, 0])
        m121();
}

module m123() {
    cube(1000000, center=true);
}

module m122() {
    translate([0, 0, -500001.0])
        m123();
}

module m125() {
    cube(1000000, center=true);
}

module m124() {
    translate([0, 0, 500012.5])
        m125();
}

module m119() {
    difference() {
        m120();
        m122();
        m124();
    }
}

module m118() {
    translate([16.125, 147.875, 0])
        m119();
}

module m129() {
    cylinder(h=500000.0, d=5, center=true, $fn=40);
}

module m128() {
    rotate([-45, 0, 0])
        m129();
}

module m131() {
    cube(1000000, center=true);
}

module m130() {
    translate([0, 0, -500001.0])
        m131();
}

module m133() {
    cube(1000000, center=true);
}

module m132() {
    translate([0, 0, 500012.5])
        m133();
}

module m127() {
    difference() {
        m128();
        m130();
        m132();
    }
}

module m126() {
    translate([163.875, 147.875, 0])
        m127();
}

module m0() {
    difference() {
        m1();
        m118();
        m126();
    }
}

m0();
