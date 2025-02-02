use <Name Smile.otf>
module m10() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m9() {
    rotate([180, 0, 0])
        m10();
}

module m8() {
    translate([10.0, 10.0, 0])
        m9();
}

module m7() {
    linear_extrude(height=0.0001, center=false)
        m8();
}

module m6() {
    translate([0, 0, 0.5])
        m7();
}

module m12() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m11() {
    translate([12.1, 10.9, 18.66])
        m12();
}

module m5() {
    union() {
        m6();
        m11();
    }
}

module m4() {
    hull() {
        m5();
    }
}

module m13() {
    cube(0.8, center=true);
}

module m3() {
    minkowski() {
        m4();
        m13();
    }
}

module m15() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m14() {
    difference() {
        m4();
        m15();
    }
}

module m2() {
    difference() {
        m3();
        m14();
    }
}

module m17() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m16() {
    translate([0, 0, 0.5])
        m17();
}

module m1() {
    intersection() {
        m2();
        m16();
    }
}

module m27() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m26() {
    rotate([180, 0, 0])
        m27();
}

module m25() {
    translate([30.0, 10.0, 0])
        m26();
}

module m24() {
    linear_extrude(height=0.0001, center=false)
        m25();
}

module m23() {
    translate([0, 0, 0.5])
        m24();
}

module m29() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m28() {
    translate([22.1, 10.9, 18.66])
        m29();
}

module m22() {
    union() {
        m23();
        m28();
    }
}

module m21() {
    hull() {
        m22();
    }
}

module m30() {
    cube(0.8, center=true);
}

module m20() {
    minkowski() {
        m21();
        m30();
    }
}

module m32() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m31() {
    difference() {
        m21();
        m32();
    }
}

module m19() {
    difference() {
        m20();
        m31();
    }
}

module m34() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m33() {
    translate([0, 0, 0.5])
        m34();
}

module m18() {
    intersection() {
        m19();
        m33();
    }
}

module m44() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m43() {
    rotate([180, 0, 0])
        m44();
}

module m42() {
    translate([50.0, 10.0, 0])
        m43();
}

module m41() {
    linear_extrude(height=0.0001, center=false)
        m42();
}

module m40() {
    translate([0, 0, 0.5])
        m41();
}

module m46() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m45() {
    translate([42.1, 10.9, 18.66])
        m46();
}

module m39() {
    union() {
        m40();
        m45();
    }
}

module m38() {
    hull() {
        m39();
    }
}

module m47() {
    cube(0.8, center=true);
}

module m37() {
    minkowski() {
        m38();
        m47();
    }
}

module m49() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m48() {
    difference() {
        m38();
        m49();
    }
}

module m36() {
    difference() {
        m37();
        m48();
    }
}

module m51() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m50() {
    translate([0, 0, 0.5])
        m51();
}

module m35() {
    intersection() {
        m36();
        m50();
    }
}

module m61() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m60() {
    rotate([180, 0, 0])
        m61();
}

module m59() {
    translate([70.0, 10.0, 0])
        m60();
}

module m58() {
    linear_extrude(height=0.0001, center=false)
        m59();
}

module m57() {
    translate([0, 0, 0.5])
        m58();
}

module m63() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m62() {
    translate([62.1, 10.9, 18.66])
        m63();
}

module m56() {
    union() {
        m57();
        m62();
    }
}

module m55() {
    hull() {
        m56();
    }
}

module m64() {
    cube(0.8, center=true);
}

module m54() {
    minkowski() {
        m55();
        m64();
    }
}

module m66() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m65() {
    difference() {
        m55();
        m66();
    }
}

module m53() {
    difference() {
        m54();
        m65();
    }
}

module m68() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m67() {
    translate([0, 0, 0.5])
        m68();
}

module m52() {
    intersection() {
        m53();
        m67();
    }
}

module m78() {
    text("W", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m77() {
    rotate([180, 0, 0])
        m78();
}

module m76() {
    translate([90.0, 10.0, 0])
        m77();
}

module m75() {
    linear_extrude(height=0.0001, center=false)
        m76();
}

module m74() {
    translate([0, 0, 0.5])
        m75();
}

module m80() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m79() {
    translate([82.1, 10.9, 18.66])
        m80();
}

module m73() {
    union() {
        m74();
        m79();
    }
}

module m72() {
    hull() {
        m73();
    }
}

module m81() {
    cube(0.8, center=true);
}

module m71() {
    minkowski() {
        m72();
        m81();
    }
}

module m83() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m82() {
    difference() {
        m72();
        m83();
    }
}

module m70() {
    difference() {
        m71();
        m82();
    }
}

module m85() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m84() {
    translate([0, 0, 0.5])
        m85();
}

module m69() {
    intersection() {
        m70();
        m84();
    }
}

module m95() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m94() {
    rotate([180, 0, 0])
        m95();
}

module m93() {
    translate([110.0, 10.0, 0])
        m94();
}

module m92() {
    linear_extrude(height=0.0001, center=false)
        m93();
}

module m91() {
    translate([0, 0, 0.5])
        m92();
}

module m97() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m96() {
    translate([102.1, 10.9, 18.66])
        m97();
}

module m90() {
    union() {
        m91();
        m96();
    }
}

module m89() {
    hull() {
        m90();
    }
}

module m98() {
    cube(0.8, center=true);
}

module m88() {
    minkowski() {
        m89();
        m98();
    }
}

module m100() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m99() {
    difference() {
        m89();
        m100();
    }
}

module m87() {
    difference() {
        m88();
        m99();
    }
}

module m102() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m101() {
    translate([0, 0, 0.5])
        m102();
}

module m86() {
    intersection() {
        m87();
        m101();
    }
}

module m112() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m111() {
    rotate([180, 0, 0])
        m112();
}

module m110() {
    translate([130.0, 10.0, 0])
        m111();
}

module m109() {
    linear_extrude(height=0.0001, center=false)
        m110();
}

module m108() {
    translate([0, 0, 0.5])
        m109();
}

module m114() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m113() {
    translate([122.1, 10.9, 18.66])
        m114();
}

module m107() {
    union() {
        m108();
        m113();
    }
}

module m106() {
    hull() {
        m107();
    }
}

module m115() {
    cube(0.8, center=true);
}

module m105() {
    minkowski() {
        m106();
        m115();
    }
}

module m117() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m116() {
    difference() {
        m106();
        m117();
    }
}

module m104() {
    difference() {
        m105();
        m116();
    }
}

module m119() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m118() {
    translate([0, 0, 0.5])
        m119();
}

module m103() {
    intersection() {
        m104();
        m118();
    }
}

module m129() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m128() {
    rotate([180, 0, 0])
        m129();
}

module m127() {
    translate([150.0, 10.0, 0])
        m128();
}

module m126() {
    linear_extrude(height=0.0001, center=false)
        m127();
}

module m125() {
    translate([0, 0, 0.5])
        m126();
}

module m131() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m130() {
    translate([142.1, 10.9, 18.66])
        m131();
}

module m124() {
    union() {
        m125();
        m130();
    }
}

module m123() {
    hull() {
        m124();
    }
}

module m132() {
    cube(0.8, center=true);
}

module m122() {
    minkowski() {
        m123();
        m132();
    }
}

module m134() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m133() {
    difference() {
        m123();
        m134();
    }
}

module m121() {
    difference() {
        m122();
        m133();
    }
}

module m136() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m135() {
    translate([0, 0, 0.5])
        m136();
}

module m120() {
    intersection() {
        m121();
        m135();
    }
}

module m146() {
    text("Y", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m145() {
    rotate([180, 0, 0])
        m146();
}

module m144() {
    translate([170.0, 10.0, 0])
        m145();
}

module m143() {
    linear_extrude(height=0.0001, center=false)
        m144();
}

module m142() {
    translate([0, 0, 0.5])
        m143();
}

module m148() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m147() {
    translate([162.1, 10.9, 18.66])
        m148();
}

module m141() {
    union() {
        m142();
        m147();
    }
}

module m140() {
    hull() {
        m141();
    }
}

module m149() {
    cube(0.8, center=true);
}

module m139() {
    minkowski() {
        m140();
        m149();
    }
}

module m151() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m150() {
    difference() {
        m140();
        m151();
    }
}

module m138() {
    difference() {
        m139();
        m150();
    }
}

module m153() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m152() {
    translate([0, 0, 0.5])
        m153();
}

module m137() {
    intersection() {
        m138();
        m152();
    }
}

module m163() {
    text("A", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m162() {
    rotate([180, 0, 0])
        m163();
}

module m161() {
    translate([10.0, 30.0, 0])
        m162();
}

module m160() {
    linear_extrude(height=0.0001, center=false)
        m161();
}

module m159() {
    translate([0, 0, 0.5])
        m160();
}

module m165() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m164() {
    translate([12.1, 30.9, 18.66])
        m165();
}

module m158() {
    union() {
        m159();
        m164();
    }
}

module m157() {
    hull() {
        m158();
    }
}

module m166() {
    cube(0.8, center=true);
}

module m156() {
    minkowski() {
        m157();
        m166();
    }
}

module m168() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m167() {
    difference() {
        m157();
        m168();
    }
}

module m155() {
    difference() {
        m156();
        m167();
    }
}

module m170() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m169() {
    translate([0, 0, 0.5])
        m170();
}

module m154() {
    intersection() {
        m155();
        m169();
    }
}

module m180() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m179() {
    rotate([180, 0, 0])
        m180();
}

module m178() {
    translate([30.0, 30.0, 0])
        m179();
}

module m177() {
    linear_extrude(height=0.0001, center=false)
        m178();
}

module m176() {
    translate([0, 0, 0.5])
        m177();
}

module m182() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m181() {
    translate([32.1, 20.9, 18.66])
        m182();
}

module m175() {
    union() {
        m176();
        m181();
    }
}

module m174() {
    hull() {
        m175();
    }
}

module m183() {
    cube(0.8, center=true);
}

module m173() {
    minkowski() {
        m174();
        m183();
    }
}

module m185() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m184() {
    difference() {
        m174();
        m185();
    }
}

module m172() {
    difference() {
        m173();
        m184();
    }
}

module m187() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m186() {
    translate([0, 0, 0.5])
        m187();
}

module m171() {
    intersection() {
        m172();
        m186();
    }
}

module m197() {
    text("Q", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m196() {
    rotate([180, 0, 0])
        m197();
}

module m195() {
    translate([50.0, 30.0, 0])
        m196();
}

module m194() {
    linear_extrude(height=0.0001, center=false)
        m195();
}

module m193() {
    translate([0, 0, 0.5])
        m194();
}

module m199() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m198() {
    translate([42.1, 30.9, 18.66])
        m199();
}

module m192() {
    union() {
        m193();
        m198();
    }
}

module m191() {
    hull() {
        m192();
    }
}

module m200() {
    cube(0.8, center=true);
}

module m190() {
    minkowski() {
        m191();
        m200();
    }
}

module m202() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m201() {
    difference() {
        m191();
        m202();
    }
}

module m189() {
    difference() {
        m190();
        m201();
    }
}

module m204() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m203() {
    translate([0, 0, 0.5])
        m204();
}

module m188() {
    intersection() {
        m189();
        m203();
    }
}

module m214() {
    text("U", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m213() {
    rotate([180, 0, 0])
        m214();
}

module m212() {
    translate([70.0, 30.0, 0])
        m213();
}

module m211() {
    linear_extrude(height=0.0001, center=false)
        m212();
}

module m210() {
    translate([0, 0, 0.5])
        m211();
}

module m216() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m215() {
    translate([62.1, 30.9, 18.66])
        m216();
}

module m209() {
    union() {
        m210();
        m215();
    }
}

module m208() {
    hull() {
        m209();
    }
}

module m217() {
    cube(0.8, center=true);
}

module m207() {
    minkowski() {
        m208();
        m217();
    }
}

module m219() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m218() {
    difference() {
        m208();
        m219();
    }
}

module m206() {
    difference() {
        m207();
        m218();
    }
}

module m221() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m220() {
    translate([0, 0, 0.5])
        m221();
}

module m205() {
    intersection() {
        m206();
        m220();
    }
}

module m231() {
    text("A", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m230() {
    rotate([180, 0, 0])
        m231();
}

module m229() {
    translate([90.0, 30.0, 0])
        m230();
}

module m228() {
    linear_extrude(height=0.0001, center=false)
        m229();
}

module m227() {
    translate([0, 0, 0.5])
        m228();
}

module m233() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m232() {
    translate([82.1, 30.9, 18.66])
        m233();
}

module m226() {
    union() {
        m227();
        m232();
    }
}

module m225() {
    hull() {
        m226();
    }
}

module m234() {
    cube(0.8, center=true);
}

module m224() {
    minkowski() {
        m225();
        m234();
    }
}

module m236() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m235() {
    difference() {
        m225();
        m236();
    }
}

module m223() {
    difference() {
        m224();
        m235();
    }
}

module m238() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m237() {
    translate([0, 0, 0.5])
        m238();
}

module m222() {
    intersection() {
        m223();
        m237();
    }
}

module m248() {
    text("R", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m247() {
    rotate([180, 0, 0])
        m248();
}

module m246() {
    translate([110.0, 30.0, 0])
        m247();
}

module m245() {
    linear_extrude(height=0.0001, center=false)
        m246();
}

module m244() {
    translate([0, 0, 0.5])
        m245();
}

module m250() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m249() {
    translate([102.1, 30.9, 18.66])
        m250();
}

module m243() {
    union() {
        m244();
        m249();
    }
}

module m242() {
    hull() {
        m243();
    }
}

module m251() {
    cube(0.8, center=true);
}

module m241() {
    minkowski() {
        m242();
        m251();
    }
}

module m253() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m252() {
    difference() {
        m242();
        m253();
    }
}

module m240() {
    difference() {
        m241();
        m252();
    }
}

module m255() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m254() {
    translate([0, 0, 0.5])
        m255();
}

module m239() {
    intersection() {
        m240();
        m254();
    }
}

module m265() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m264() {
    rotate([180, 0, 0])
        m265();
}

module m263() {
    translate([130.0, 30.0, 0])
        m264();
}

module m262() {
    linear_extrude(height=0.0001, center=false)
        m263();
}

module m261() {
    translate([0, 0, 0.5])
        m262();
}

module m267() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m266() {
    translate([122.1, 30.9, 18.66])
        m267();
}

module m260() {
    union() {
        m261();
        m266();
    }
}

module m259() {
    hull() {
        m260();
    }
}

module m268() {
    cube(0.8, center=true);
}

module m258() {
    minkowski() {
        m259();
        m268();
    }
}

module m270() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m269() {
    difference() {
        m259();
        m270();
    }
}

module m257() {
    difference() {
        m258();
        m269();
    }
}

module m272() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m271() {
    translate([0, 0, 0.5])
        m272();
}

module m256() {
    intersection() {
        m257();
        m271();
    }
}

module m282() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m281() {
    rotate([180, 0, 0])
        m282();
}

module m280() {
    translate([150.0, 30.0, 0])
        m281();
}

module m279() {
    linear_extrude(height=0.0001, center=false)
        m280();
}

module m278() {
    translate([0, 0, 0.5])
        m279();
}

module m284() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m283() {
    translate([142.1, 20.9, 18.66])
        m284();
}

module m277() {
    union() {
        m278();
        m283();
    }
}

module m276() {
    hull() {
        m277();
    }
}

module m285() {
    cube(0.8, center=true);
}

module m275() {
    minkowski() {
        m276();
        m285();
    }
}

module m287() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m286() {
    difference() {
        m276();
        m287();
    }
}

module m274() {
    difference() {
        m275();
        m286();
    }
}

module m289() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m288() {
    translate([0, 0, 0.5])
        m289();
}

module m273() {
    intersection() {
        m274();
        m288();
    }
}

module m299() {
    text("R", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m298() {
    rotate([180, 0, 0])
        m299();
}

module m297() {
    translate([170.0, 30.0, 0])
        m298();
}

module m296() {
    linear_extrude(height=0.0001, center=false)
        m297();
}

module m295() {
    translate([0, 0, 0.5])
        m296();
}

module m301() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m300() {
    translate([152.1, 30.9, 18.66])
        m301();
}

module m294() {
    union() {
        m295();
        m300();
    }
}

module m293() {
    hull() {
        m294();
    }
}

module m302() {
    cube(0.8, center=true);
}

module m292() {
    minkowski() {
        m293();
        m302();
    }
}

module m304() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m303() {
    difference() {
        m293();
        m304();
    }
}

module m291() {
    difference() {
        m292();
        m303();
    }
}

module m306() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m305() {
    translate([0, 0, 0.5])
        m306();
}

module m290() {
    intersection() {
        m291();
        m305();
    }
}

module m316() {
    text("F", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m315() {
    rotate([180, 0, 0])
        m316();
}

module m314() {
    translate([10.0, 50.0, 0])
        m315();
}

module m313() {
    linear_extrude(height=0.0001, center=false)
        m314();
}

module m312() {
    translate([0, 0, 0.5])
        m313();
}

module m318() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m317() {
    translate([12.1, 40.9, 18.66])
        m318();
}

module m311() {
    union() {
        m312();
        m317();
    }
}

module m310() {
    hull() {
        m311();
    }
}

module m319() {
    cube(0.8, center=true);
}

module m309() {
    minkowski() {
        m310();
        m319();
    }
}

module m321() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m320() {
    difference() {
        m310();
        m321();
    }
}

module m308() {
    difference() {
        m309();
        m320();
    }
}

module m323() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m322() {
    translate([0, 0, 0.5])
        m323();
}

module m307() {
    intersection() {
        m308();
        m322();
    }
}

module m333() {
    text("I", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m332() {
    rotate([180, 0, 0])
        m333();
}

module m331() {
    translate([30.0, 50.0, 0])
        m332();
}

module m330() {
    linear_extrude(height=0.0001, center=false)
        m331();
}

module m329() {
    translate([0, 0, 0.5])
        m330();
}

module m335() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m334() {
    translate([22.1, 50.9, 18.66])
        m335();
}

module m328() {
    union() {
        m329();
        m334();
    }
}

module m327() {
    hull() {
        m328();
    }
}

module m336() {
    cube(0.8, center=true);
}

module m326() {
    minkowski() {
        m327();
        m336();
    }
}

module m338() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m337() {
    difference() {
        m327();
        m338();
    }
}

module m325() {
    difference() {
        m326();
        m337();
    }
}

module m340() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m339() {
    translate([0, 0, 0.5])
        m340();
}

module m324() {
    intersection() {
        m325();
        m339();
    }
}

module m350() {
    text("V", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m349() {
    rotate([180, 0, 0])
        m350();
}

module m348() {
    translate([50.0, 50.0, 0])
        m349();
}

module m347() {
    linear_extrude(height=0.0001, center=false)
        m348();
}

module m346() {
    translate([0, 0, 0.5])
        m347();
}

module m352() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m351() {
    translate([42.1, 40.9, 18.66])
        m352();
}

module m345() {
    union() {
        m346();
        m351();
    }
}

module m344() {
    hull() {
        m345();
    }
}

module m353() {
    cube(0.8, center=true);
}

module m343() {
    minkowski() {
        m344();
        m353();
    }
}

module m355() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m354() {
    difference() {
        m344();
        m355();
    }
}

module m342() {
    difference() {
        m343();
        m354();
    }
}

module m357() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m356() {
    translate([0, 0, 0.5])
        m357();
}

module m341() {
    intersection() {
        m342();
        m356();
    }
}

module m367() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m366() {
    rotate([180, 0, 0])
        m367();
}

module m365() {
    translate([70.0, 50.0, 0])
        m366();
}

module m364() {
    linear_extrude(height=0.0001, center=false)
        m365();
}

module m363() {
    translate([0, 0, 0.5])
        m364();
}

module m369() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m368() {
    translate([62.1, 40.9, 18.66])
        m369();
}

module m362() {
    union() {
        m363();
        m368();
    }
}

module m361() {
    hull() {
        m362();
    }
}

module m370() {
    cube(0.8, center=true);
}

module m360() {
    minkowski() {
        m361();
        m370();
    }
}

module m372() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m371() {
    difference() {
        m361();
        m372();
    }
}

module m359() {
    difference() {
        m360();
        m371();
    }
}

module m374() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m373() {
    translate([0, 0, 0.5])
        m374();
}

module m358() {
    intersection() {
        m359();
        m373();
    }
}

module m384() {
    text("K", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m383() {
    rotate([180, 0, 0])
        m384();
}

module m382() {
    translate([90.0, 50.0, 0])
        m383();
}

module m381() {
    linear_extrude(height=0.0001, center=false)
        m382();
}

module m380() {
    translate([0, 0, 0.5])
        m381();
}

module m386() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m385() {
    translate([82.1, 40.9, 18.66])
        m386();
}

module m379() {
    union() {
        m380();
        m385();
    }
}

module m378() {
    hull() {
        m379();
    }
}

module m387() {
    cube(0.8, center=true);
}

module m377() {
    minkowski() {
        m378();
        m387();
    }
}

module m389() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m388() {
    difference() {
        m378();
        m389();
    }
}

module m376() {
    difference() {
        m377();
        m388();
    }
}

module m391() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m390() {
    translate([0, 0, 0.5])
        m391();
}

module m375() {
    intersection() {
        m376();
        m390();
    }
}

module m401() {
    text("H", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m400() {
    rotate([180, 0, 0])
        m401();
}

module m399() {
    translate([110.0, 50.0, 0])
        m400();
}

module m398() {
    linear_extrude(height=0.0001, center=false)
        m399();
}

module m397() {
    translate([0, 0, 0.5])
        m398();
}

module m403() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m402() {
    translate([102.1, 40.9, 18.66])
        m403();
}

module m396() {
    union() {
        m397();
        m402();
    }
}

module m395() {
    hull() {
        m396();
    }
}

module m404() {
    cube(0.8, center=true);
}

module m394() {
    minkowski() {
        m395();
        m404();
    }
}

module m406() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m405() {
    difference() {
        m395();
        m406();
    }
}

module m393() {
    difference() {
        m394();
        m405();
    }
}

module m408() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m407() {
    translate([0, 0, 0.5])
        m408();
}

module m392() {
    intersection() {
        m393();
        m407();
    }
}

module m418() {
    text("A", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m417() {
    rotate([180, 0, 0])
        m418();
}

module m416() {
    translate([130.0, 50.0, 0])
        m417();
}

module m415() {
    linear_extrude(height=0.0001, center=false)
        m416();
}

module m414() {
    translate([0, 0, 0.5])
        m415();
}

module m420() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m419() {
    translate([122.1, 40.9, 18.66])
        m420();
}

module m413() {
    union() {
        m414();
        m419();
    }
}

module m412() {
    hull() {
        m413();
    }
}

module m421() {
    cube(0.8, center=true);
}

module m411() {
    minkowski() {
        m412();
        m421();
    }
}

module m423() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m422() {
    difference() {
        m412();
        m423();
    }
}

module m410() {
    difference() {
        m411();
        m422();
    }
}

module m425() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m424() {
    translate([0, 0, 0.5])
        m425();
}

module m409() {
    intersection() {
        m410();
        m424();
    }
}

module m435() {
    text("L", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m434() {
    rotate([180, 0, 0])
        m435();
}

module m433() {
    translate([150.0, 50.0, 0])
        m434();
}

module m432() {
    linear_extrude(height=0.0001, center=false)
        m433();
}

module m431() {
    translate([0, 0, 0.5])
        m432();
}

module m437() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m436() {
    translate([142.1, 40.9, 18.66])
        m437();
}

module m430() {
    union() {
        m431();
        m436();
    }
}

module m429() {
    hull() {
        m430();
    }
}

module m438() {
    cube(0.8, center=true);
}

module m428() {
    minkowski() {
        m429();
        m438();
    }
}

module m440() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m439() {
    difference() {
        m429();
        m440();
    }
}

module m427() {
    difference() {
        m428();
        m439();
    }
}

module m442() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m441() {
    translate([0, 0, 0.5])
        m442();
}

module m426() {
    intersection() {
        m427();
        m441();
    }
}

module m452() {
    text("F", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m451() {
    rotate([180, 0, 0])
        m452();
}

module m450() {
    translate([170.0, 50.0, 0])
        m451();
}

module m449() {
    linear_extrude(height=0.0001, center=false)
        m450();
}

module m448() {
    translate([0, 0, 0.5])
        m449();
}

module m454() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m453() {
    translate([162.1, 40.9, 18.66])
        m454();
}

module m447() {
    union() {
        m448();
        m453();
    }
}

module m446() {
    hull() {
        m447();
    }
}

module m455() {
    cube(0.8, center=true);
}

module m445() {
    minkowski() {
        m446();
        m455();
    }
}

module m457() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m456() {
    difference() {
        m446();
        m457();
    }
}

module m444() {
    difference() {
        m445();
        m456();
    }
}

module m459() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m458() {
    translate([0, 0, 0.5])
        m459();
}

module m443() {
    intersection() {
        m444();
        m458();
    }
}

module m469() {
    text("P", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m468() {
    rotate([180, 0, 0])
        m469();
}

module m467() {
    translate([10.0, 70.0, 0])
        m468();
}

module m466() {
    linear_extrude(height=0.0001, center=false)
        m467();
}

module m465() {
    translate([0, 0, 0.5])
        m466();
}

module m471() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m470() {
    translate([12.1, 60.9, 18.66])
        m471();
}

module m464() {
    union() {
        m465();
        m470();
    }
}

module m463() {
    hull() {
        m464();
    }
}

module m472() {
    cube(0.8, center=true);
}

module m462() {
    minkowski() {
        m463();
        m472();
    }
}

module m474() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m473() {
    difference() {
        m463();
        m474();
    }
}

module m461() {
    difference() {
        m462();
        m473();
    }
}

module m476() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m475() {
    translate([0, 0, 0.5])
        m476();
}

module m460() {
    intersection() {
        m461();
        m475();
    }
}

module m486() {
    text("A", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m485() {
    rotate([180, 0, 0])
        m486();
}

module m484() {
    translate([30.0, 70.0, 0])
        m485();
}

module m483() {
    linear_extrude(height=0.0001, center=false)
        m484();
}

module m482() {
    translate([0, 0, 0.5])
        m483();
}

module m488() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m487() {
    translate([32.1, 60.9, 18.66])
        m488();
}

module m481() {
    union() {
        m482();
        m487();
    }
}

module m480() {
    hull() {
        m481();
    }
}

module m489() {
    cube(0.8, center=true);
}

module m479() {
    minkowski() {
        m480();
        m489();
    }
}

module m491() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m490() {
    difference() {
        m480();
        m491();
    }
}

module m478() {
    difference() {
        m479();
        m490();
    }
}

module m493() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m492() {
    translate([0, 0, 0.5])
        m493();
}

module m477() {
    intersection() {
        m478();
        m492();
    }
}

module m503() {
    text("S", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m502() {
    rotate([180, 0, 0])
        m503();
}

module m501() {
    translate([50.0, 70.0, 0])
        m502();
}

module m500() {
    linear_extrude(height=0.0001, center=false)
        m501();
}

module m499() {
    translate([0, 0, 0.5])
        m500();
}

module m505() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m504() {
    translate([52.1, 60.9, 18.66])
        m505();
}

module m498() {
    union() {
        m499();
        m504();
    }
}

module m497() {
    hull() {
        m498();
    }
}

module m506() {
    cube(0.8, center=true);
}

module m496() {
    minkowski() {
        m497();
        m506();
    }
}

module m508() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m507() {
    difference() {
        m497();
        m508();
    }
}

module m495() {
    difference() {
        m496();
        m507();
    }
}

module m510() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m509() {
    translate([0, 0, 0.5])
        m510();
}

module m494() {
    intersection() {
        m495();
        m509();
    }
}

module m520() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m519() {
    rotate([180, 0, 0])
        m520();
}

module m518() {
    translate([70.0, 70.0, 0])
        m519();
}

module m517() {
    linear_extrude(height=0.0001, center=false)
        m518();
}

module m516() {
    translate([0, 0, 0.5])
        m517();
}

module m522() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m521() {
    translate([72.1, 60.9, 18.66])
        m522();
}

module m515() {
    union() {
        m516();
        m521();
    }
}

module m514() {
    hull() {
        m515();
    }
}

module m523() {
    cube(0.8, center=true);
}

module m513() {
    minkowski() {
        m514();
        m523();
    }
}

module m525() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m524() {
    difference() {
        m514();
        m525();
    }
}

module m512() {
    difference() {
        m513();
        m524();
    }
}

module m527() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m526() {
    translate([0, 0, 0.5])
        m527();
}

module m511() {
    intersection() {
        m512();
        m526();
    }
}

module m537() {
    text("O", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m536() {
    rotate([180, 0, 0])
        m537();
}

module m535() {
    translate([90.0, 70.0, 0])
        m536();
}

module m534() {
    linear_extrude(height=0.0001, center=false)
        m535();
}

module m533() {
    translate([0, 0, 0.5])
        m534();
}

module m539() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m538() {
    translate([92.1, 60.9, 18.66])
        m539();
}

module m532() {
    union() {
        m533();
        m538();
    }
}

module m531() {
    hull() {
        m532();
    }
}

module m540() {
    cube(0.8, center=true);
}

module m530() {
    minkowski() {
        m531();
        m540();
    }
}

module m542() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m541() {
    difference() {
        m531();
        m542();
    }
}

module m529() {
    difference() {
        m530();
        m541();
    }
}

module m544() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m543() {
    translate([0, 0, 0.5])
        m544();
}

module m528() {
    intersection() {
        m529();
        m543();
    }
}

module m554() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m553() {
    rotate([180, 0, 0])
        m554();
}

module m552() {
    translate([110.0, 70.0, 0])
        m553();
}

module m551() {
    linear_extrude(height=0.0001, center=false)
        m552();
}

module m550() {
    translate([0, 0, 0.5])
        m551();
}

module m556() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m555() {
    translate([112.1, 60.9, 18.66])
        m556();
}

module m549() {
    union() {
        m550();
        m555();
    }
}

module m548() {
    hull() {
        m549();
    }
}

module m557() {
    cube(0.8, center=true);
}

module m547() {
    minkowski() {
        m548();
        m557();
    }
}

module m559() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m558() {
    difference() {
        m548();
        m559();
    }
}

module m546() {
    difference() {
        m547();
        m558();
    }
}

module m561() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m560() {
    translate([0, 0, 0.5])
        m561();
}

module m545() {
    intersection() {
        m546();
        m560();
    }
}

module m571() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m570() {
    rotate([180, 0, 0])
        m571();
}

module m569() {
    translate([130.0, 70.0, 0])
        m570();
}

module m568() {
    linear_extrude(height=0.0001, center=false)
        m569();
}

module m567() {
    translate([0, 0, 0.5])
        m568();
}

module m573() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m572() {
    translate([132.1, 60.9, 18.66])
        m573();
}

module m566() {
    union() {
        m567();
        m572();
    }
}

module m565() {
    hull() {
        m566();
    }
}

module m574() {
    cube(0.8, center=true);
}

module m564() {
    minkowski() {
        m565();
        m574();
    }
}

module m576() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m575() {
    difference() {
        m565();
        m576();
    }
}

module m563() {
    difference() {
        m564();
        m575();
    }
}

module m578() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m577() {
    translate([0, 0, 0.5])
        m578();
}

module m562() {
    intersection() {
        m563();
        m577();
    }
}

module m588() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m587() {
    rotate([180, 0, 0])
        m588();
}

module m586() {
    translate([150.0, 70.0, 0])
        m587();
}

module m585() {
    linear_extrude(height=0.0001, center=false)
        m586();
}

module m584() {
    translate([0, 0, 0.5])
        m585();
}

module m590() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m589() {
    translate([142.1, 60.9, 18.66])
        m590();
}

module m583() {
    union() {
        m584();
        m589();
    }
}

module m582() {
    hull() {
        m583();
    }
}

module m591() {
    cube(0.8, center=true);
}

module m581() {
    minkowski() {
        m582();
        m591();
    }
}

module m593() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m592() {
    difference() {
        m582();
        m593();
    }
}

module m580() {
    difference() {
        m581();
        m592();
    }
}

module m595() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m594() {
    translate([0, 0, 0.5])
        m595();
}

module m579() {
    intersection() {
        m580();
        m594();
    }
}

module m605() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m604() {
    rotate([180, 0, 0])
        m605();
}

module m603() {
    translate([170.0, 70.0, 0])
        m604();
}

module m602() {
    linear_extrude(height=0.0001, center=false)
        m603();
}

module m601() {
    translate([0, 0, 0.5])
        m602();
}

module m607() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m606() {
    translate([162.1, 60.9, 18.66])
        m607();
}

module m600() {
    union() {
        m601();
        m606();
    }
}

module m599() {
    hull() {
        m600();
    }
}

module m608() {
    cube(0.8, center=true);
}

module m598() {
    minkowski() {
        m599();
        m608();
    }
}

module m610() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m609() {
    difference() {
        m599();
        m610();
    }
}

module m597() {
    difference() {
        m598();
        m609();
    }
}

module m612() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m611() {
    translate([0, 0, 0.5])
        m612();
}

module m596() {
    intersection() {
        m597();
        m611();
    }
}

module m622() {
    text("F", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m621() {
    rotate([180, 0, 0])
        m622();
}

module m620() {
    translate([10.0, 90.0, 0])
        m621();
}

module m619() {
    linear_extrude(height=0.0001, center=false)
        m620();
}

module m618() {
    translate([0, 0, 0.5])
        m619();
}

module m624() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m623() {
    translate([12.1, 80.9, 18.66])
        m624();
}

module m617() {
    union() {
        m618();
        m623();
    }
}

module m616() {
    hull() {
        m617();
    }
}

module m625() {
    cube(0.8, center=true);
}

module m615() {
    minkowski() {
        m616();
        m625();
    }
}

module m627() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m626() {
    difference() {
        m616();
        m627();
    }
}

module m614() {
    difference() {
        m615();
        m626();
    }
}

module m629() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m628() {
    translate([0, 0, 0.5])
        m629();
}

module m613() {
    intersection() {
        m614();
        m628();
    }
}

module m639() {
    text("O", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m638() {
    rotate([180, 0, 0])
        m639();
}

module m637() {
    translate([30.0, 90.0, 0])
        m638();
}

module m636() {
    linear_extrude(height=0.0001, center=false)
        m637();
}

module m635() {
    translate([0, 0, 0.5])
        m636();
}

module m641() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m640() {
    translate([22.1, 90.9, 18.66])
        m641();
}

module m634() {
    union() {
        m635();
        m640();
    }
}

module m633() {
    hull() {
        m634();
    }
}

module m642() {
    cube(0.8, center=true);
}

module m632() {
    minkowski() {
        m633();
        m642();
    }
}

module m644() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m643() {
    difference() {
        m633();
        m644();
    }
}

module m631() {
    difference() {
        m632();
        m643();
    }
}

module m646() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m645() {
    translate([0, 0, 0.5])
        m646();
}

module m630() {
    intersection() {
        m631();
        m645();
    }
}

module m656() {
    text("U", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m655() {
    rotate([180, 0, 0])
        m656();
}

module m654() {
    translate([50.0, 90.0, 0])
        m655();
}

module m653() {
    linear_extrude(height=0.0001, center=false)
        m654();
}

module m652() {
    translate([0, 0, 0.5])
        m653();
}

module m658() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m657() {
    translate([42.1, 80.9, 18.66])
        m658();
}

module m651() {
    union() {
        m652();
        m657();
    }
}

module m650() {
    hull() {
        m651();
    }
}

module m659() {
    cube(0.8, center=true);
}

module m649() {
    minkowski() {
        m650();
        m659();
    }
}

module m661() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m660() {
    difference() {
        m650();
        m661();
    }
}

module m648() {
    difference() {
        m649();
        m660();
    }
}

module m663() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m662() {
    translate([0, 0, 0.5])
        m663();
}

module m647() {
    intersection() {
        m648();
        m662();
    }
}

module m673() {
    text("R", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m672() {
    rotate([180, 0, 0])
        m673();
}

module m671() {
    translate([70.0, 90.0, 0])
        m672();
}

module m670() {
    linear_extrude(height=0.0001, center=false)
        m671();
}

module m669() {
    translate([0, 0, 0.5])
        m670();
}

module m675() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m674() {
    translate([62.1, 80.9, 18.66])
        m675();
}

module m668() {
    union() {
        m669();
        m674();
    }
}

module m667() {
    hull() {
        m668();
    }
}

module m676() {
    cube(0.8, center=true);
}

module m666() {
    minkowski() {
        m667();
        m676();
    }
}

module m678() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m677() {
    difference() {
        m667();
        m678();
    }
}

module m665() {
    difference() {
        m666();
        m677();
    }
}

module m680() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m679() {
    translate([0, 0, 0.5])
        m680();
}

module m664() {
    intersection() {
        m665();
        m679();
    }
}

module m690() {
    text("S", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m689() {
    rotate([180, 0, 0])
        m690();
}

module m688() {
    translate([90.0, 90.0, 0])
        m689();
}

module m687() {
    linear_extrude(height=0.0001, center=false)
        m688();
}

module m686() {
    translate([0, 0, 0.5])
        m687();
}

module m692() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m691() {
    translate([82.1, 80.9, 18.66])
        m692();
}

module m685() {
    union() {
        m686();
        m691();
    }
}

module m684() {
    hull() {
        m685();
    }
}

module m693() {
    cube(0.8, center=true);
}

module m683() {
    minkowski() {
        m684();
        m693();
    }
}

module m695() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m694() {
    difference() {
        m684();
        m695();
    }
}

module m682() {
    difference() {
        m683();
        m694();
    }
}

module m697() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m696() {
    translate([0, 0, 0.5])
        m697();
}

module m681() {
    intersection() {
        m682();
        m696();
    }
}

module m707() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m706() {
    rotate([180, 0, 0])
        m707();
}

module m705() {
    translate([110.0, 90.0, 0])
        m706();
}

module m704() {
    linear_extrude(height=0.0001, center=false)
        m705();
}

module m703() {
    translate([0, 0, 0.5])
        m704();
}

module m709() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m708() {
    translate([102.1, 80.9, 18.66])
        m709();
}

module m702() {
    union() {
        m703();
        m708();
    }
}

module m701() {
    hull() {
        m702();
    }
}

module m710() {
    cube(0.8, center=true);
}

module m700() {
    minkowski() {
        m701();
        m710();
    }
}

module m712() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m711() {
    difference() {
        m701();
        m712();
    }
}

module m699() {
    difference() {
        m700();
        m711();
    }
}

module m714() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m713() {
    translate([0, 0, 0.5])
        m714();
}

module m698() {
    intersection() {
        m699();
        m713();
    }
}

module m724() {
    text("V", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m723() {
    rotate([180, 0, 0])
        m724();
}

module m722() {
    translate([130.0, 90.0, 0])
        m723();
}

module m721() {
    linear_extrude(height=0.0001, center=false)
        m722();
}

module m720() {
    translate([0, 0, 0.5])
        m721();
}

module m726() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m725() {
    translate([122.1, 80.9, 18.66])
        m726();
}

module m719() {
    union() {
        m720();
        m725();
    }
}

module m718() {
    hull() {
        m719();
    }
}

module m727() {
    cube(0.8, center=true);
}

module m717() {
    minkowski() {
        m718();
        m727();
    }
}

module m729() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m728() {
    difference() {
        m718();
        m729();
    }
}

module m716() {
    difference() {
        m717();
        m728();
    }
}

module m731() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m730() {
    translate([0, 0, 0.5])
        m731();
}

module m715() {
    intersection() {
        m716();
        m730();
    }
}

module m741() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m740() {
    rotate([180, 0, 0])
        m741();
}

module m739() {
    translate([150.0, 90.0, 0])
        m740();
}

module m738() {
    linear_extrude(height=0.0001, center=false)
        m739();
}

module m737() {
    translate([0, 0, 0.5])
        m738();
}

module m743() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m742() {
    translate([142.1, 80.9, 18.66])
        m743();
}

module m736() {
    union() {
        m737();
        m742();
    }
}

module m735() {
    hull() {
        m736();
    }
}

module m744() {
    cube(0.8, center=true);
}

module m734() {
    minkowski() {
        m735();
        m744();
    }
}

module m746() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m745() {
    difference() {
        m735();
        m746();
    }
}

module m733() {
    difference() {
        m734();
        m745();
    }
}

module m748() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m747() {
    translate([0, 0, 0.5])
        m748();
}

module m732() {
    intersection() {
        m733();
        m747();
    }
}

module m758() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m757() {
    rotate([180, 0, 0])
        m758();
}

module m756() {
    translate([170.0, 90.0, 0])
        m757();
}

module m755() {
    linear_extrude(height=0.0001, center=false)
        m756();
}

module m754() {
    translate([0, 0, 0.5])
        m755();
}

module m760() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m759() {
    translate([162.1, 80.9, 18.66])
        m760();
}

module m753() {
    union() {
        m754();
        m759();
    }
}

module m752() {
    hull() {
        m753();
    }
}

module m761() {
    cube(0.8, center=true);
}

module m751() {
    minkowski() {
        m752();
        m761();
    }
}

module m763() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m762() {
    difference() {
        m752();
        m763();
    }
}

module m750() {
    difference() {
        m751();
        m762();
    }
}

module m765() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m764() {
    translate([0, 0, 0.5])
        m765();
}

module m749() {
    intersection() {
        m750();
        m764();
    }
}

module m775() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m774() {
    rotate([180, 0, 0])
        m775();
}

module m773() {
    translate([10.0, 110.0, 0])
        m774();
}

module m772() {
    linear_extrude(height=0.0001, center=false)
        m773();
}

module m771() {
    translate([0, 0, 0.5])
        m772();
}

module m777() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m776() {
    translate([12.1, 100.9, 18.66])
        m777();
}

module m770() {
    union() {
        m771();
        m776();
    }
}

module m769() {
    hull() {
        m770();
    }
}

module m778() {
    cube(0.8, center=true);
}

module m768() {
    minkowski() {
        m769();
        m778();
    }
}

module m780() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m779() {
    difference() {
        m769();
        m780();
    }
}

module m767() {
    difference() {
        m768();
        m779();
    }
}

module m782() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m781() {
    translate([0, 0, 0.5])
        m782();
}

module m766() {
    intersection() {
        m767();
        m781();
    }
}

module m792() {
    text("W", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m791() {
    rotate([180, 0, 0])
        m792();
}

module m790() {
    translate([30.0, 110.0, 0])
        m791();
}

module m789() {
    linear_extrude(height=0.0001, center=false)
        m790();
}

module m788() {
    translate([0, 0, 0.5])
        m789();
}

module m794() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m793() {
    translate([32.1, 100.9, 18.66])
        m794();
}

module m787() {
    union() {
        m788();
        m793();
    }
}

module m786() {
    hull() {
        m787();
    }
}

module m795() {
    cube(0.8, center=true);
}

module m785() {
    minkowski() {
        m786();
        m795();
    }
}

module m797() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m796() {
    difference() {
        m786();
        m797();
    }
}

module m784() {
    difference() {
        m785();
        m796();
    }
}

module m799() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m798() {
    translate([0, 0, 0.5])
        m799();
}

module m783() {
    intersection() {
        m784();
        m798();
    }
}

module m809() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m808() {
    rotate([180, 0, 0])
        m809();
}

module m807() {
    translate([50.0, 110.0, 0])
        m808();
}

module m806() {
    linear_extrude(height=0.0001, center=false)
        m807();
}

module m805() {
    translate([0, 0, 0.5])
        m806();
}

module m811() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m810() {
    translate([52.1, 100.9, 18.66])
        m811();
}

module m804() {
    union() {
        m805();
        m810();
    }
}

module m803() {
    hull() {
        m804();
    }
}

module m812() {
    cube(0.8, center=true);
}

module m802() {
    minkowski() {
        m803();
        m812();
    }
}

module m814() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m813() {
    difference() {
        m803();
        m814();
    }
}

module m801() {
    difference() {
        m802();
        m813();
    }
}

module m816() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m815() {
    translate([0, 0, 0.5])
        m816();
}

module m800() {
    intersection() {
        m801();
        m815();
    }
}

module m826() {
    text("L", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m825() {
    rotate([180, 0, 0])
        m826();
}

module m824() {
    translate([70.0, 110.0, 0])
        m825();
}

module m823() {
    linear_extrude(height=0.0001, center=false)
        m824();
}

module m822() {
    translate([0, 0, 0.5])
        m823();
}

module m828() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m827() {
    translate([72.1, 100.9, 18.66])
        m828();
}

module m821() {
    union() {
        m822();
        m827();
    }
}

module m820() {
    hull() {
        m821();
    }
}

module m829() {
    cube(0.8, center=true);
}

module m819() {
    minkowski() {
        m820();
        m829();
    }
}

module m831() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m830() {
    difference() {
        m820();
        m831();
    }
}

module m818() {
    difference() {
        m819();
        m830();
    }
}

module m833() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m832() {
    translate([0, 0, 0.5])
        m833();
}

module m817() {
    intersection() {
        m818();
        m832();
    }
}

module m843() {
    text("V", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m842() {
    rotate([180, 0, 0])
        m843();
}

module m841() {
    translate([90.0, 110.0, 0])
        m842();
}

module m840() {
    linear_extrude(height=0.0001, center=false)
        m841();
}

module m839() {
    translate([0, 0, 0.5])
        m840();
}

module m845() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m844() {
    translate([92.1, 100.9, 18.66])
        m845();
}

module m838() {
    union() {
        m839();
        m844();
    }
}

module m837() {
    hull() {
        m838();
    }
}

module m846() {
    cube(0.8, center=true);
}

module m836() {
    minkowski() {
        m837();
        m846();
    }
}

module m848() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m847() {
    difference() {
        m837();
        m848();
    }
}

module m835() {
    difference() {
        m836();
        m847();
    }
}

module m850() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m849() {
    translate([0, 0, 0.5])
        m850();
}

module m834() {
    intersection() {
        m835();
        m849();
    }
}

module m860() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m859() {
    rotate([180, 0, 0])
        m860();
}

module m858() {
    translate([110.0, 110.0, 0])
        m859();
}

module m857() {
    linear_extrude(height=0.0001, center=false)
        m858();
}

module m856() {
    translate([0, 0, 0.5])
        m857();
}

module m862() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m861() {
    translate([112.1, 100.9, 18.66])
        m862();
}

module m855() {
    union() {
        m856();
        m861();
    }
}

module m854() {
    hull() {
        m855();
    }
}

module m863() {
    cube(0.8, center=true);
}

module m853() {
    minkowski() {
        m854();
        m863();
    }
}

module m865() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m864() {
    difference() {
        m854();
        m865();
    }
}

module m852() {
    difference() {
        m853();
        m864();
    }
}

module m867() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m866() {
    translate([0, 0, 0.5])
        m867();
}

module m851() {
    intersection() {
        m852();
        m866();
    }
}

module m877() {
    text("S", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m876() {
    rotate([180, 0, 0])
        m877();
}

module m875() {
    translate([130.0, 110.0, 0])
        m876();
}

module m874() {
    linear_extrude(height=0.0001, center=false)
        m875();
}

module m873() {
    translate([0, 0, 0.5])
        m874();
}

module m879() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m878() {
    translate([132.1, 100.9, 18.66])
        m879();
}

module m872() {
    union() {
        m873();
        m878();
    }
}

module m871() {
    hull() {
        m872();
    }
}

module m880() {
    cube(0.8, center=true);
}

module m870() {
    minkowski() {
        m871();
        m880();
    }
}

module m882() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m881() {
    difference() {
        m871();
        m882();
    }
}

module m869() {
    difference() {
        m870();
        m881();
    }
}

module m884() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m883() {
    translate([0, 0, 0.5])
        m884();
}

module m868() {
    intersection() {
        m869();
        m883();
    }
}

module m894() {
    text("I", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m893() {
    rotate([180, 0, 0])
        m894();
}

module m892() {
    translate([150.0, 110.0, 0])
        m893();
}

module m891() {
    linear_extrude(height=0.0001, center=false)
        m892();
}

module m890() {
    translate([0, 0, 0.5])
        m891();
}

module m896() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m895() {
    translate([142.1, 100.9, 18.66])
        m896();
}

module m889() {
    union() {
        m890();
        m895();
    }
}

module m888() {
    hull() {
        m889();
    }
}

module m897() {
    cube(0.8, center=true);
}

module m887() {
    minkowski() {
        m888();
        m897();
    }
}

module m899() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m898() {
    difference() {
        m888();
        m899();
    }
}

module m886() {
    difference() {
        m887();
        m898();
    }
}

module m901() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m900() {
    translate([0, 0, 0.5])
        m901();
}

module m885() {
    intersection() {
        m886();
        m900();
    }
}

module m911() {
    text("X", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m910() {
    rotate([180, 0, 0])
        m911();
}

module m909() {
    translate([170.0, 110.0, 0])
        m910();
}

module m908() {
    linear_extrude(height=0.0001, center=false)
        m909();
}

module m907() {
    translate([0, 0, 0.5])
        m908();
}

module m913() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m912() {
    translate([162.1, 100.9, 18.66])
        m913();
}

module m906() {
    union() {
        m907();
        m912();
    }
}

module m905() {
    hull() {
        m906();
    }
}

module m914() {
    cube(0.8, center=true);
}

module m904() {
    minkowski() {
        m905();
        m914();
    }
}

module m916() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m915() {
    difference() {
        m905();
        m916();
    }
}

module m903() {
    difference() {
        m904();
        m915();
    }
}

module m918() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m917() {
    translate([0, 0, 0.5])
        m918();
}

module m902() {
    intersection() {
        m903();
        m917();
    }
}

module m928() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m927() {
    rotate([180, 0, 0])
        m928();
}

module m926() {
    translate([10.0, 130.0, 0])
        m927();
}

module m925() {
    linear_extrude(height=0.0001, center=false)
        m926();
}

module m924() {
    translate([0, 0, 0.5])
        m925();
}

module m930() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m929() {
    translate([12.1, 120.9, 18.66])
        m930();
}

module m923() {
    union() {
        m924();
        m929();
    }
}

module m922() {
    hull() {
        m923();
    }
}

module m931() {
    cube(0.8, center=true);
}

module m921() {
    minkowski() {
        m922();
        m931();
    }
}

module m933() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m932() {
    difference() {
        m922();
        m933();
    }
}

module m920() {
    difference() {
        m921();
        m932();
    }
}

module m935() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m934() {
    translate([0, 0, 0.5])
        m935();
}

module m919() {
    intersection() {
        m920();
        m934();
    }
}

module m945() {
    text("I", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m944() {
    rotate([180, 0, 0])
        m945();
}

module m943() {
    translate([30.0, 130.0, 0])
        m944();
}

module m942() {
    linear_extrude(height=0.0001, center=false)
        m943();
}

module m941() {
    translate([0, 0, 0.5])
        m942();
}

module m947() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m946() {
    translate([22.1, 130.9, 18.66])
        m947();
}

module m940() {
    union() {
        m941();
        m946();
    }
}

module m939() {
    hull() {
        m940();
    }
}

module m948() {
    cube(0.8, center=true);
}

module m938() {
    minkowski() {
        m939();
        m948();
    }
}

module m950() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m949() {
    difference() {
        m939();
        m950();
    }
}

module m937() {
    difference() {
        m938();
        m949();
    }
}

module m952() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m951() {
    translate([0, 0, 0.5])
        m952();
}

module m936() {
    intersection() {
        m937();
        m951();
    }
}

module m962() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m961() {
    rotate([180, 0, 0])
        m962();
}

module m960() {
    translate([50.0, 130.0, 0])
        m961();
}

module m959() {
    linear_extrude(height=0.0001, center=false)
        m960();
}

module m958() {
    translate([0, 0, 0.5])
        m959();
}

module m964() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m963() {
    translate([42.1, 120.9, 18.66])
        m964();
}

module m957() {
    union() {
        m958();
        m963();
    }
}

module m956() {
    hull() {
        m957();
    }
}

module m965() {
    cube(0.8, center=true);
}

module m955() {
    minkowski() {
        m956();
        m965();
    }
}

module m967() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m966() {
    difference() {
        m956();
        m967();
    }
}

module m954() {
    difference() {
        m955();
        m966();
    }
}

module m969() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m968() {
    translate([0, 0, 0.5])
        m969();
}

module m953() {
    intersection() {
        m954();
        m968();
    }
}

module m979() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m978() {
    rotate([180, 0, 0])
        m979();
}

module m977() {
    translate([70.0, 130.0, 0])
        m978();
}

module m976() {
    linear_extrude(height=0.0001, center=false)
        m977();
}

module m975() {
    translate([0, 0, 0.5])
        m976();
}

module m981() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m980() {
    translate([62.1, 120.9, 18.66])
        m981();
}

module m974() {
    union() {
        m975();
        m980();
    }
}

module m973() {
    hull() {
        m974();
    }
}

module m982() {
    cube(0.8, center=true);
}

module m972() {
    minkowski() {
        m973();
        m982();
    }
}

module m984() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m983() {
    difference() {
        m973();
        m984();
    }
}

module m971() {
    difference() {
        m972();
        m983();
    }
}

module m986() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m985() {
    translate([0, 0, 0.5])
        m986();
}

module m970() {
    intersection() {
        m971();
        m985();
    }
}

module m996() {
    text("L", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m995() {
    rotate([180, 0, 0])
        m996();
}

module m994() {
    translate([90.0, 130.0, 0])
        m995();
}

module m993() {
    linear_extrude(height=0.0001, center=false)
        m994();
}

module m992() {
    translate([0, 0, 0.5])
        m993();
}

module m998() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m997() {
    translate([82.1, 120.9, 18.66])
        m998();
}

module m991() {
    union() {
        m992();
        m997();
    }
}

module m990() {
    hull() {
        m991();
    }
}

module m999() {
    cube(0.8, center=true);
}

module m989() {
    minkowski() {
        m990();
        m999();
    }
}

module m1001() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1000() {
    difference() {
        m990();
        m1001();
    }
}

module m988() {
    difference() {
        m989();
        m1000();
    }
}

module m1003() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1002() {
    translate([0, 0, 0.5])
        m1003();
}

module m987() {
    intersection() {
        m988();
        m1002();
    }
}

module m1013() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1012() {
    rotate([180, 0, 0])
        m1013();
}

module m1011() {
    translate([110.0, 130.0, 0])
        m1012();
}

module m1010() {
    linear_extrude(height=0.0001, center=false)
        m1011();
}

module m1009() {
    translate([0, 0, 0.5])
        m1010();
}

module m1015() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1014() {
    translate([102.1, 120.9, 18.66])
        m1015();
}

module m1008() {
    union() {
        m1009();
        m1014();
    }
}

module m1007() {
    hull() {
        m1008();
    }
}

module m1016() {
    cube(0.8, center=true);
}

module m1006() {
    minkowski() {
        m1007();
        m1016();
    }
}

module m1018() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1017() {
    difference() {
        m1007();
        m1018();
    }
}

module m1005() {
    difference() {
        m1006();
        m1017();
    }
}

module m1020() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1019() {
    translate([0, 0, 0.5])
        m1020();
}

module m1004() {
    intersection() {
        m1005();
        m1019();
    }
}

module m1030() {
    text("V", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1029() {
    rotate([180, 0, 0])
        m1030();
}

module m1028() {
    translate([130.0, 130.0, 0])
        m1029();
}

module m1027() {
    linear_extrude(height=0.0001, center=false)
        m1028();
}

module m1026() {
    translate([0, 0, 0.5])
        m1027();
}

module m1032() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1031() {
    translate([122.1, 120.9, 18.66])
        m1032();
}

module m1025() {
    union() {
        m1026();
        m1031();
    }
}

module m1024() {
    hull() {
        m1025();
    }
}

module m1033() {
    cube(0.8, center=true);
}

module m1023() {
    minkowski() {
        m1024();
        m1033();
    }
}

module m1035() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1034() {
    difference() {
        m1024();
        m1035();
    }
}

module m1022() {
    difference() {
        m1023();
        m1034();
    }
}

module m1037() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1036() {
    translate([0, 0, 0.5])
        m1037();
}

module m1021() {
    intersection() {
        m1022();
        m1036();
    }
}

module m1047() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1046() {
    rotate([180, 0, 0])
        m1047();
}

module m1045() {
    translate([150.0, 130.0, 0])
        m1046();
}

module m1044() {
    linear_extrude(height=0.0001, center=false)
        m1045();
}

module m1043() {
    translate([0, 0, 0.5])
        m1044();
}

module m1049() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1048() {
    translate([142.1, 120.9, 18.66])
        m1049();
}

module m1042() {
    union() {
        m1043();
        m1048();
    }
}

module m1041() {
    hull() {
        m1042();
    }
}

module m1050() {
    cube(0.8, center=true);
}

module m1040() {
    minkowski() {
        m1041();
        m1050();
    }
}

module m1052() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1051() {
    difference() {
        m1041();
        m1052();
    }
}

module m1039() {
    difference() {
        m1040();
        m1051();
    }
}

module m1054() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1053() {
    translate([0, 0, 0.5])
        m1054();
}

module m1038() {
    intersection() {
        m1039();
        m1053();
    }
}

module m1064() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1063() {
    rotate([180, 0, 0])
        m1064();
}

module m1062() {
    translate([170.0, 130.0, 0])
        m1063();
}

module m1061() {
    linear_extrude(height=0.0001, center=false)
        m1062();
}

module m1060() {
    translate([0, 0, 0.5])
        m1061();
}

module m1066() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1065() {
    translate([162.1, 120.9, 18.66])
        m1066();
}

module m1059() {
    union() {
        m1060();
        m1065();
    }
}

module m1058() {
    hull() {
        m1059();
    }
}

module m1067() {
    cube(0.8, center=true);
}

module m1057() {
    minkowski() {
        m1058();
        m1067();
    }
}

module m1069() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1068() {
    difference() {
        m1058();
        m1069();
    }
}

module m1056() {
    difference() {
        m1057();
        m1068();
    }
}

module m1071() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1070() {
    translate([0, 0, 0.5])
        m1071();
}

module m1055() {
    intersection() {
        m1056();
        m1070();
    }
}

module m1081() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1080() {
    rotate([180, 0, 0])
        m1081();
}

module m1079() {
    translate([10.0, 150.0, 0])
        m1080();
}

module m1078() {
    linear_extrude(height=0.0001, center=false)
        m1079();
}

module m1077() {
    translate([0, 0, 0.5])
        m1078();
}

module m1083() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1082() {
    translate([12.1, 140.9, 18.66])
        m1083();
}

module m1076() {
    union() {
        m1077();
        m1082();
    }
}

module m1075() {
    hull() {
        m1076();
    }
}

module m1084() {
    cube(0.8, center=true);
}

module m1074() {
    minkowski() {
        m1075();
        m1084();
    }
}

module m1086() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1085() {
    difference() {
        m1075();
        m1086();
    }
}

module m1073() {
    difference() {
        m1074();
        m1085();
    }
}

module m1088() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1087() {
    translate([0, 0, 0.5])
        m1088();
}

module m1072() {
    intersection() {
        m1073();
        m1087();
    }
}

module m1098() {
    text("H", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1097() {
    rotate([180, 0, 0])
        m1098();
}

module m1096() {
    translate([30.0, 150.0, 0])
        m1097();
}

module m1095() {
    linear_extrude(height=0.0001, center=false)
        m1096();
}

module m1094() {
    translate([0, 0, 0.5])
        m1095();
}

module m1100() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1099() {
    translate([22.1, 140.9, 18.66])
        m1100();
}

module m1093() {
    union() {
        m1094();
        m1099();
    }
}

module m1092() {
    hull() {
        m1093();
    }
}

module m1101() {
    cube(0.8, center=true);
}

module m1091() {
    minkowski() {
        m1092();
        m1101();
    }
}

module m1103() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1102() {
    difference() {
        m1092();
        m1103();
    }
}

module m1090() {
    difference() {
        m1091();
        m1102();
    }
}

module m1105() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1104() {
    translate([0, 0, 0.5])
        m1105();
}

module m1089() {
    intersection() {
        m1090();
        m1104();
    }
}

module m1115() {
    text("R", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1114() {
    rotate([180, 0, 0])
        m1115();
}

module m1113() {
    translate([50.0, 150.0, 0])
        m1114();
}

module m1112() {
    linear_extrude(height=0.0001, center=false)
        m1113();
}

module m1111() {
    translate([0, 0, 0.5])
        m1112();
}

module m1117() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1116() {
    translate([42.1, 140.9, 18.66])
        m1117();
}

module m1110() {
    union() {
        m1111();
        m1116();
    }
}

module m1109() {
    hull() {
        m1110();
    }
}

module m1118() {
    cube(0.8, center=true);
}

module m1108() {
    minkowski() {
        m1109();
        m1118();
    }
}

module m1120() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1119() {
    difference() {
        m1109();
        m1120();
    }
}

module m1107() {
    difference() {
        m1108();
        m1119();
    }
}

module m1122() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1121() {
    translate([0, 0, 0.5])
        m1122();
}

module m1106() {
    intersection() {
        m1107();
        m1121();
    }
}

module m1132() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1131() {
    rotate([180, 0, 0])
        m1132();
}

module m1130() {
    translate([70.0, 150.0, 0])
        m1131();
}

module m1129() {
    linear_extrude(height=0.0001, center=false)
        m1130();
}

module m1128() {
    translate([0, 0, 0.5])
        m1129();
}

module m1134() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1133() {
    translate([62.1, 140.9, 18.66])
        m1134();
}

module m1127() {
    union() {
        m1128();
        m1133();
    }
}

module m1126() {
    hull() {
        m1127();
    }
}

module m1135() {
    cube(0.8, center=true);
}

module m1125() {
    minkowski() {
        m1126();
        m1135();
    }
}

module m1137() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1136() {
    difference() {
        m1126();
        m1137();
    }
}

module m1124() {
    difference() {
        m1125();
        m1136();
    }
}

module m1139() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1138() {
    translate([0, 0, 0.5])
        m1139();
}

module m1123() {
    intersection() {
        m1124();
        m1138();
    }
}

module m1149() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1148() {
    rotate([180, 0, 0])
        m1149();
}

module m1147() {
    translate([90.0, 150.0, 0])
        m1148();
}

module m1146() {
    linear_extrude(height=0.0001, center=false)
        m1147();
}

module m1145() {
    translate([0, 0, 0.5])
        m1146();
}

module m1151() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1150() {
    translate([82.1, 140.9, 18.66])
        m1151();
}

module m1144() {
    union() {
        m1145();
        m1150();
    }
}

module m1143() {
    hull() {
        m1144();
    }
}

module m1152() {
    cube(0.8, center=true);
}

module m1142() {
    minkowski() {
        m1143();
        m1152();
    }
}

module m1154() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1153() {
    difference() {
        m1143();
        m1154();
    }
}

module m1141() {
    difference() {
        m1142();
        m1153();
    }
}

module m1156() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1155() {
    translate([0, 0, 0.5])
        m1156();
}

module m1140() {
    intersection() {
        m1141();
        m1155();
    }
}

module m1166() {
    text("F", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1165() {
    rotate([180, 0, 0])
        m1166();
}

module m1164() {
    translate([110.0, 150.0, 0])
        m1165();
}

module m1163() {
    linear_extrude(height=0.0001, center=false)
        m1164();
}

module m1162() {
    translate([0, 0, 0.5])
        m1163();
}

module m1168() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1167() {
    translate([102.1, 140.9, 18.66])
        m1168();
}

module m1161() {
    union() {
        m1162();
        m1167();
    }
}

module m1160() {
    hull() {
        m1161();
    }
}

module m1169() {
    cube(0.8, center=true);
}

module m1159() {
    minkowski() {
        m1160();
        m1169();
    }
}

module m1171() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1170() {
    difference() {
        m1160();
        m1171();
    }
}

module m1158() {
    difference() {
        m1159();
        m1170();
    }
}

module m1173() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1172() {
    translate([0, 0, 0.5])
        m1173();
}

module m1157() {
    intersection() {
        m1158();
        m1172();
    }
}

module m1183() {
    text("I", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1182() {
    rotate([180, 0, 0])
        m1183();
}

module m1181() {
    translate([130.0, 150.0, 0])
        m1182();
}

module m1180() {
    linear_extrude(height=0.0001, center=false)
        m1181();
}

module m1179() {
    translate([0, 0, 0.5])
        m1180();
}

module m1185() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1184() {
    translate([122.1, 140.9, 18.66])
        m1185();
}

module m1178() {
    union() {
        m1179();
        m1184();
    }
}

module m1177() {
    hull() {
        m1178();
    }
}

module m1186() {
    cube(0.8, center=true);
}

module m1176() {
    minkowski() {
        m1177();
        m1186();
    }
}

module m1188() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1187() {
    difference() {
        m1177();
        m1188();
    }
}

module m1175() {
    difference() {
        m1176();
        m1187();
    }
}

module m1190() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1189() {
    translate([0, 0, 0.5])
        m1190();
}

module m1174() {
    intersection() {
        m1175();
        m1189();
    }
}

module m1200() {
    text("V", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1199() {
    rotate([180, 0, 0])
        m1200();
}

module m1198() {
    translate([150.0, 150.0, 0])
        m1199();
}

module m1197() {
    linear_extrude(height=0.0001, center=false)
        m1198();
}

module m1196() {
    translate([0, 0, 0.5])
        m1197();
}

module m1202() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1201() {
    translate([142.1, 140.9, 18.66])
        m1202();
}

module m1195() {
    union() {
        m1196();
        m1201();
    }
}

module m1194() {
    hull() {
        m1195();
    }
}

module m1203() {
    cube(0.8, center=true);
}

module m1193() {
    minkowski() {
        m1194();
        m1203();
    }
}

module m1205() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1204() {
    difference() {
        m1194();
        m1205();
    }
}

module m1192() {
    difference() {
        m1193();
        m1204();
    }
}

module m1207() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1206() {
    translate([0, 0, 0.5])
        m1207();
}

module m1191() {
    intersection() {
        m1192();
        m1206();
    }
}

module m1217() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1216() {
    rotate([180, 0, 0])
        m1217();
}

module m1215() {
    translate([170.0, 150.0, 0])
        m1216();
}

module m1214() {
    linear_extrude(height=0.0001, center=false)
        m1215();
}

module m1213() {
    translate([0, 0, 0.5])
        m1214();
}

module m1219() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1218() {
    translate([162.1, 140.9, 18.66])
        m1219();
}

module m1212() {
    union() {
        m1213();
        m1218();
    }
}

module m1211() {
    hull() {
        m1212();
    }
}

module m1220() {
    cube(0.8, center=true);
}

module m1210() {
    minkowski() {
        m1211();
        m1220();
    }
}

module m1222() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1221() {
    difference() {
        m1211();
        m1222();
    }
}

module m1209() {
    difference() {
        m1210();
        m1221();
    }
}

module m1224() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1223() {
    translate([0, 0, 0.5])
        m1224();
}

module m1208() {
    intersection() {
        m1209();
        m1223();
    }
}

module m1234() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1233() {
    rotate([180, 0, 0])
        m1234();
}

module m1232() {
    translate([10.0, 170.0, 0])
        m1233();
}

module m1231() {
    linear_extrude(height=0.0001, center=false)
        m1232();
}

module m1230() {
    translate([0, 0, 0.5])
        m1231();
}

module m1236() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1235() {
    translate([12.1, 160.9, 18.66])
        m1236();
}

module m1229() {
    union() {
        m1230();
        m1235();
    }
}

module m1228() {
    hull() {
        m1229();
    }
}

module m1237() {
    cube(0.8, center=true);
}

module m1227() {
    minkowski() {
        m1228();
        m1237();
    }
}

module m1239() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1238() {
    difference() {
        m1228();
        m1239();
    }
}

module m1226() {
    difference() {
        m1227();
        m1238();
    }
}

module m1241() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1240() {
    translate([0, 0, 0.5])
        m1241();
}

module m1225() {
    intersection() {
        m1226();
        m1240();
    }
}

module m1251() {
    text("I", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1250() {
    rotate([180, 0, 0])
        m1251();
}

module m1249() {
    translate([30.0, 170.0, 0])
        m1250();
}

module m1248() {
    linear_extrude(height=0.0001, center=false)
        m1249();
}

module m1247() {
    translate([0, 0, 0.5])
        m1248();
}

module m1253() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1252() {
    translate([32.1, 150.9, 18.66])
        m1253();
}

module m1246() {
    union() {
        m1247();
        m1252();
    }
}

module m1245() {
    hull() {
        m1246();
    }
}

module m1254() {
    cube(0.8, center=true);
}

module m1244() {
    minkowski() {
        m1245();
        m1254();
    }
}

module m1256() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1255() {
    difference() {
        m1245();
        m1256();
    }
}

module m1243() {
    difference() {
        m1244();
        m1255();
    }
}

module m1258() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1257() {
    translate([0, 0, 0.5])
        m1258();
}

module m1242() {
    intersection() {
        m1243();
        m1257();
    }
}

module m1268() {
    text("G", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1267() {
    rotate([180, 0, 0])
        m1268();
}

module m1266() {
    translate([50.0, 170.0, 0])
        m1267();
}

module m1265() {
    linear_extrude(height=0.0001, center=false)
        m1266();
}

module m1264() {
    translate([0, 0, 0.5])
        m1265();
}

module m1270() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1269() {
    translate([42.1, 160.9, 18.66])
        m1270();
}

module m1263() {
    union() {
        m1264();
        m1269();
    }
}

module m1262() {
    hull() {
        m1263();
    }
}

module m1271() {
    cube(0.8, center=true);
}

module m1261() {
    minkowski() {
        m1262();
        m1271();
    }
}

module m1273() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1272() {
    difference() {
        m1262();
        m1273();
    }
}

module m1260() {
    difference() {
        m1261();
        m1272();
    }
}

module m1275() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1274() {
    translate([0, 0, 0.5])
        m1275();
}

module m1259() {
    intersection() {
        m1260();
        m1274();
    }
}

module m1285() {
    text("H", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1284() {
    rotate([180, 0, 0])
        m1285();
}

module m1283() {
    translate([70.0, 170.0, 0])
        m1284();
}

module m1282() {
    linear_extrude(height=0.0001, center=false)
        m1283();
}

module m1281() {
    translate([0, 0, 0.5])
        m1282();
}

module m1287() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1286() {
    translate([62.1, 160.9, 18.66])
        m1287();
}

module m1280() {
    union() {
        m1281();
        m1286();
    }
}

module m1279() {
    hull() {
        m1280();
    }
}

module m1288() {
    cube(0.8, center=true);
}

module m1278() {
    minkowski() {
        m1279();
        m1288();
    }
}

module m1290() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1289() {
    difference() {
        m1279();
        m1290();
    }
}

module m1277() {
    difference() {
        m1278();
        m1289();
    }
}

module m1292() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1291() {
    translate([0, 0, 0.5])
        m1292();
}

module m1276() {
    intersection() {
        m1277();
        m1291();
    }
}

module m1302() {
    text("T", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1301() {
    rotate([180, 0, 0])
        m1302();
}

module m1300() {
    translate([90.0, 170.0, 0])
        m1301();
}

module m1299() {
    linear_extrude(height=0.0001, center=false)
        m1300();
}

module m1298() {
    translate([0, 0, 0.5])
        m1299();
}

module m1304() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1303() {
    translate([82.1, 160.9, 18.66])
        m1304();
}

module m1297() {
    union() {
        m1298();
        m1303();
    }
}

module m1296() {
    hull() {
        m1297();
    }
}

module m1305() {
    cube(0.8, center=true);
}

module m1295() {
    minkowski() {
        m1296();
        m1305();
    }
}

module m1307() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1306() {
    difference() {
        m1296();
        m1307();
    }
}

module m1294() {
    difference() {
        m1295();
        m1306();
    }
}

module m1309() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1308() {
    translate([0, 0, 0.5])
        m1309();
}

module m1293() {
    intersection() {
        m1294();
        m1308();
    }
}

module m1319() {
    text("W", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1318() {
    rotate([180, 0, 0])
        m1319();
}

module m1317() {
    translate([110.0, 170.0, 0])
        m1318();
}

module m1316() {
    linear_extrude(height=0.0001, center=false)
        m1317();
}

module m1315() {
    translate([0, 0, 0.5])
        m1316();
}

module m1321() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1320() {
    translate([102.1, 160.9, 18.66])
        m1321();
}

module m1314() {
    union() {
        m1315();
        m1320();
    }
}

module m1313() {
    hull() {
        m1314();
    }
}

module m1322() {
    cube(0.8, center=true);
}

module m1312() {
    minkowski() {
        m1313();
        m1322();
    }
}

module m1324() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1323() {
    difference() {
        m1313();
        m1324();
    }
}

module m1311() {
    difference() {
        m1312();
        m1323();
    }
}

module m1326() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1325() {
    translate([0, 0, 0.5])
        m1326();
}

module m1310() {
    intersection() {
        m1311();
        m1325();
    }
}

module m1336() {
    text("O", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1335() {
    rotate([180, 0, 0])
        m1336();
}

module m1334() {
    translate([130.0, 170.0, 0])
        m1335();
}

module m1333() {
    linear_extrude(height=0.0001, center=false)
        m1334();
}

module m1332() {
    translate([0, 0, 0.5])
        m1333();
}

module m1338() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1337() {
    translate([122.1, 160.9, 18.66])
        m1338();
}

module m1331() {
    union() {
        m1332();
        m1337();
    }
}

module m1330() {
    hull() {
        m1331();
    }
}

module m1339() {
    cube(0.8, center=true);
}

module m1329() {
    minkowski() {
        m1330();
        m1339();
    }
}

module m1341() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1340() {
    difference() {
        m1330();
        m1341();
    }
}

module m1328() {
    difference() {
        m1329();
        m1340();
    }
}

module m1343() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1342() {
    translate([0, 0, 0.5])
        m1343();
}

module m1327() {
    intersection() {
        m1328();
        m1342();
    }
}

module m1353() {
    text("N", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1352() {
    rotate([180, 0, 0])
        m1353();
}

module m1351() {
    translate([150.0, 170.0, 0])
        m1352();
}

module m1350() {
    linear_extrude(height=0.0001, center=false)
        m1351();
}

module m1349() {
    translate([0, 0, 0.5])
        m1350();
}

module m1355() {
    cube([5.8, 18.2, 0.0001], center=false);
}

module m1354() {
    translate([142.1, 150.9, 18.66])
        m1355();
}

module m1348() {
    union() {
        m1349();
        m1354();
    }
}

module m1347() {
    hull() {
        m1348();
    }
}

module m1356() {
    cube(0.8, center=true);
}

module m1346() {
    minkowski() {
        m1347();
        m1356();
    }
}

module m1358() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1357() {
    difference() {
        m1347();
        m1358();
    }
}

module m1345() {
    difference() {
        m1346();
        m1357();
    }
}

module m1360() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1359() {
    translate([0, 0, 0.5])
        m1360();
}

module m1344() {
    intersection() {
        m1345();
        m1359();
    }
}

module m1370() {
    text("E", font="Name Smile", halign="center", valign="center", size=14.0);
}

module m1369() {
    rotate([180, 0, 0])
        m1370();
}

module m1368() {
    translate([170.0, 170.0, 0])
        m1369();
}

module m1367() {
    linear_extrude(height=0.0001, center=false)
        m1368();
}

module m1366() {
    translate([0, 0, 0.5])
        m1367();
}

module m1372() {
    cube([15.8, 8.2, 0.0001], center=false);
}

module m1371() {
    translate([152.1, 160.9, 18.66])
        m1372();
}

module m1365() {
    union() {
        m1366();
        m1371();
    }
}

module m1364() {
    hull() {
        m1365();
    }
}

module m1373() {
    cube(0.8, center=true);
}

module m1363() {
    minkowski() {
        m1364();
        m1373();
    }
}

module m1375() {
    cube([1000000, 1000000, 0.8], center=false);
}

module m1374() {
    difference() {
        m1364();
        m1375();
    }
}

module m1362() {
    difference() {
        m1363();
        m1374();
    }
}

module m1377() {
    cube([1000000, 1000000, 18.16], center=false);
}

module m1376() {
    translate([0, 0, 0.5])
        m1377();
}

module m1361() {
    intersection() {
        m1362();
        m1376();
    }
}

module m1378() {
    linear_extrude(height=0.5, center=false)
        m8();
}

module m1379() {
    linear_extrude(height=0.5, center=false)
        m25();
}

module m1380() {
    linear_extrude(height=0.5, center=false)
        m42();
}

module m1381() {
    linear_extrude(height=0.5, center=false)
        m59();
}

module m1382() {
    linear_extrude(height=0.5, center=false)
        m76();
}

module m1383() {
    linear_extrude(height=0.5, center=false)
        m93();
}

module m1384() {
    linear_extrude(height=0.5, center=false)
        m110();
}

module m1385() {
    linear_extrude(height=0.5, center=false)
        m127();
}

module m1386() {
    linear_extrude(height=0.5, center=false)
        m144();
}

module m1387() {
    linear_extrude(height=0.5, center=false)
        m161();
}

module m1388() {
    linear_extrude(height=0.5, center=false)
        m178();
}

module m1389() {
    linear_extrude(height=0.5, center=false)
        m195();
}

module m1390() {
    linear_extrude(height=0.5, center=false)
        m212();
}

module m1391() {
    linear_extrude(height=0.5, center=false)
        m229();
}

module m1392() {
    linear_extrude(height=0.5, center=false)
        m246();
}

module m1393() {
    linear_extrude(height=0.5, center=false)
        m263();
}

module m1394() {
    linear_extrude(height=0.5, center=false)
        m280();
}

module m1395() {
    linear_extrude(height=0.5, center=false)
        m297();
}

module m1396() {
    linear_extrude(height=0.5, center=false)
        m314();
}

module m1397() {
    linear_extrude(height=0.5, center=false)
        m331();
}

module m1398() {
    linear_extrude(height=0.5, center=false)
        m348();
}

module m1399() {
    linear_extrude(height=0.5, center=false)
        m365();
}

module m1400() {
    linear_extrude(height=0.5, center=false)
        m382();
}

module m1401() {
    linear_extrude(height=0.5, center=false)
        m399();
}

module m1402() {
    linear_extrude(height=0.5, center=false)
        m416();
}

module m1403() {
    linear_extrude(height=0.5, center=false)
        m433();
}

module m1404() {
    linear_extrude(height=0.5, center=false)
        m450();
}

module m1405() {
    linear_extrude(height=0.5, center=false)
        m467();
}

module m1406() {
    linear_extrude(height=0.5, center=false)
        m484();
}

module m1407() {
    linear_extrude(height=0.5, center=false)
        m501();
}

module m1408() {
    linear_extrude(height=0.5, center=false)
        m518();
}

module m1409() {
    linear_extrude(height=0.5, center=false)
        m535();
}

module m1410() {
    linear_extrude(height=0.5, center=false)
        m552();
}

module m1411() {
    linear_extrude(height=0.5, center=false)
        m569();
}

module m1412() {
    linear_extrude(height=0.5, center=false)
        m586();
}

module m1413() {
    linear_extrude(height=0.5, center=false)
        m603();
}

module m1414() {
    linear_extrude(height=0.5, center=false)
        m620();
}

module m1415() {
    linear_extrude(height=0.5, center=false)
        m637();
}

module m1416() {
    linear_extrude(height=0.5, center=false)
        m654();
}

module m1417() {
    linear_extrude(height=0.5, center=false)
        m671();
}

module m1418() {
    linear_extrude(height=0.5, center=false)
        m688();
}

module m1419() {
    linear_extrude(height=0.5, center=false)
        m705();
}

module m1420() {
    linear_extrude(height=0.5, center=false)
        m722();
}

module m1421() {
    linear_extrude(height=0.5, center=false)
        m739();
}

module m1422() {
    linear_extrude(height=0.5, center=false)
        m756();
}

module m1423() {
    linear_extrude(height=0.5, center=false)
        m773();
}

module m1424() {
    linear_extrude(height=0.5, center=false)
        m790();
}

module m1425() {
    linear_extrude(height=0.5, center=false)
        m807();
}

module m1426() {
    linear_extrude(height=0.5, center=false)
        m824();
}

module m1427() {
    linear_extrude(height=0.5, center=false)
        m841();
}

module m1428() {
    linear_extrude(height=0.5, center=false)
        m858();
}

module m1429() {
    linear_extrude(height=0.5, center=false)
        m875();
}

module m1430() {
    linear_extrude(height=0.5, center=false)
        m892();
}

module m1431() {
    linear_extrude(height=0.5, center=false)
        m909();
}

module m1432() {
    linear_extrude(height=0.5, center=false)
        m926();
}

module m1433() {
    linear_extrude(height=0.5, center=false)
        m943();
}

module m1434() {
    linear_extrude(height=0.5, center=false)
        m960();
}

module m1435() {
    linear_extrude(height=0.5, center=false)
        m977();
}

module m1436() {
    linear_extrude(height=0.5, center=false)
        m994();
}

module m1437() {
    linear_extrude(height=0.5, center=false)
        m1011();
}

module m1438() {
    linear_extrude(height=0.5, center=false)
        m1028();
}

module m1439() {
    linear_extrude(height=0.5, center=false)
        m1045();
}

module m1440() {
    linear_extrude(height=0.5, center=false)
        m1062();
}

module m1441() {
    linear_extrude(height=0.5, center=false)
        m1079();
}

module m1442() {
    linear_extrude(height=0.5, center=false)
        m1096();
}

module m1443() {
    linear_extrude(height=0.5, center=false)
        m1113();
}

module m1444() {
    linear_extrude(height=0.5, center=false)
        m1130();
}

module m1445() {
    linear_extrude(height=0.5, center=false)
        m1147();
}

module m1446() {
    linear_extrude(height=0.5, center=false)
        m1164();
}

module m1447() {
    linear_extrude(height=0.5, center=false)
        m1181();
}

module m1448() {
    linear_extrude(height=0.5, center=false)
        m1198();
}

module m1449() {
    linear_extrude(height=0.5, center=false)
        m1215();
}

module m1450() {
    linear_extrude(height=0.5, center=false)
        m1232();
}

module m1451() {
    linear_extrude(height=0.5, center=false)
        m1249();
}

module m1452() {
    linear_extrude(height=0.5, center=false)
        m1266();
}

module m1453() {
    linear_extrude(height=0.5, center=false)
        m1283();
}

module m1454() {
    linear_extrude(height=0.5, center=false)
        m1300();
}

module m1455() {
    linear_extrude(height=0.5, center=false)
        m1317();
}

module m1456() {
    linear_extrude(height=0.5, center=false)
        m1334();
}

module m1457() {
    linear_extrude(height=0.5, center=false)
        m1351();
}

module m1458() {
    linear_extrude(height=0.5, center=false)
        m1368();
}

module m0() {
    union() {
        m1();
        m18();
        m35();
        m52();
        m69();
        m86();
        m103();
        m120();
        m137();
        m154();
        m171();
        m188();
        m205();
        m222();
        m239();
        m256();
        m273();
        m290();
        m307();
        m324();
        m341();
        m358();
        m375();
        m392();
        m409();
        m426();
        m443();
        m460();
        m477();
        m494();
        m511();
        m528();
        m545();
        m562();
        m579();
        m596();
        m613();
        m630();
        m647();
        m664();
        m681();
        m698();
        m715();
        m732();
        m749();
        m766();
        m783();
        m800();
        m817();
        m834();
        m851();
        m868();
        m885();
        m902();
        m919();
        m936();
        m953();
        m970();
        m987();
        m1004();
        m1021();
        m1038();
        m1055();
        m1072();
        m1089();
        m1106();
        m1123();
        m1140();
        m1157();
        m1174();
        m1191();
        m1208();
        m1225();
        m1242();
        m1259();
        m1276();
        m1293();
        m1310();
        m1327();
        m1344();
        m1361();
        m1378();
        m1379();
        m1380();
        m1381();
        m1382();
        m1383();
        m1384();
        m1385();
        m1386();
        m1387();
        m1388();
        m1389();
        m1390();
        m1391();
        m1392();
        m1393();
        m1394();
        m1395();
        m1396();
        m1397();
        m1398();
        m1399();
        m1400();
        m1401();
        m1402();
        m1403();
        m1404();
        m1405();
        m1406();
        m1407();
        m1408();
        m1409();
        m1410();
        m1411();
        m1412();
        m1413();
        m1414();
        m1415();
        m1416();
        m1417();
        m1418();
        m1419();
        m1420();
        m1421();
        m1422();
        m1423();
        m1424();
        m1425();
        m1426();
        m1427();
        m1428();
        m1429();
        m1430();
        m1431();
        m1432();
        m1433();
        m1434();
        m1435();
        m1436();
        m1437();
        m1438();
        m1439();
        m1440();
        m1441();
        m1442();
        m1443();
        m1444();
        m1445();
        m1446();
        m1447();
        m1448();
        m1449();
        m1450();
        m1451();
        m1452();
        m1453();
        m1454();
        m1455();
        m1456();
        m1457();
        m1458();
    }
}

m0();
