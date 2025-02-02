import itertools
import math

from scad import circle, cube, cylinder, text, union, write_scad

# Comic Sans! (fantasque) - but the Q tail dipping below the baseline is
# frustrating. Also, characters feel a bit narrow.

# Look for more square fonts

# Each letter gets 12 leds in either 3x4 or 4x3, these represent if the letter
# is Horizontal or Vertical
H, V = True, False

LETTERS = [
    "tentwenty",
    "atquarter",
    "fivekhalf",
    "pastoeten",
    "fourseven",
    "twelvesix",
    "nineleven",
    "threefive",
    "eightwone",
]

if set(len(row) for row in LETTERS) != {
    len(LETTERS),
}:
    raise ValueError("letters must be square")

LEDS = 16

LED_CUTS = [
    [
        (0, 0, V),
        (0, 1, H),
        (0, 3, H),
        (0, 5, H),
        (0, 7, H),
        (0, 9, H),
        (0, 11, H),
        (0, 13, H),
        (0, 15, V),
    ],
    [
        (2, 0, H),
        (1, 2, V),
        (2, 3, H),
        (2, 5, H),
        (2, 7, H),
        (2, 9, H),
        (2, 11, H),
        (1, 13, V),
        (2, 14, H),
    ],
    [
        (3, 0, V),
        (4, 1, H),
        (3, 3, V),
        (3, 5, V),
        (3, 7, V),
        (3, 9, V),
        (3, 11, V),
        (3, 13, V),
        (3, 15, V),
    ],
    [
        (5, 0, V),
        (5, 2, V),
        (5, 4, V),
        (5, 6, V),
        (5, 8, V),
        (5, 10, V),
        (5, 12, V),
        (5, 13, H),
        (5, 15, V),
    ],
    [
        (7, 0, V),
        (8, 1, H),
        (7, 3, V),
        (7, 5, V),
        (7, 7, V),
        (7, 9, V),
        (7, 11, V),
        (7, 13, V),
        (7, 15, V),
    ],
    [
        (9, 0, V),
        (9, 2, V),
        (9, 4, V),
        (9, 6, V),
        (9, 8, V),
        (9, 10, V),
        (9, 12, V),
        (9, 13, H),
        (9, 15, V),
    ],
    [
        (11, 0, V),
        (12, 1, H),
        (11, 3, V),
        (11, 5, V),
        (11, 7, V),
        (11, 9, V),
        (11, 11, V),
        (11, 13, V),
        (11, 15, V),
    ],
    [
        (13, 0, V),
        (13, 1, H),
        (13, 3, H),
        (13, 5, H),
        (13, 7, H),
        (13, 9, H),
        (13, 11, H),
        (13, 13, H),
        (13, 15, V),
    ],
    [
        (15, 0, H),
        (14, 2, V),
        (15, 3, H),
        (15, 5, H),
        (15, 7, H),
        (15, 9, H),
        (15, 11, H),
        (14, 13, V),
        (15, 14, H),
    ],
]


STRIP_LAYOUT = [[0 for _ in range(LEDS)] for _ in range(LEDS)]
row, col = 15, 15
dx = -1
for i in range(LEDS * LEDS):
    STRIP_LAYOUT[row][col] = i
    if (dx == -1 and row == 0) or (dx == 1 and row == 15):
        dx = -dx
        col -= 1
    else:
        row += dx

if True:
    # Rotate this 180 degrees - the connectors need to be at the top of the unit
    # so the power cable fits at the bottom. The layout as printed still works
    # fine.
    STRIP_LAYOUT = [x[::-1] for x in STRIP_LAYOUT[::-1]]

for row in STRIP_LAYOUT:
    print(row)

row_strs = []
for row in LED_CUTS:
    col_strs = []
    for col in row:
        l1 = STRIP_LAYOUT[col[0]][col[1]]
        l2 = STRIP_LAYOUT[col[0] + (1 if col[2] == V else 0)][
            col[1] + (1 if col[2] == H else 0)
        ]
        col_strs.append(f"{{{l1},{l2}}}")
    row_strs.append("\n    {" + ", ".join(col_strs) + "}")
print("const uint8_t LETTER_LEDS[9][9][2] = {" + ",".join(row_strs) + "\n};")


EPSILON = 0.0001
INFINITY = 1000000

LAYER_HEIGHT = 0.15  # 0.15 is normal
NOZZLE_WIDTH = 0.4

PRINT_BED = 180
FRONT_CELL = PRINT_BED / len(LETTERS)

# values from neo pixel, work for dotstar too. could maybe be a bit tighter, but w/e
LED_HOLE_X = 5.8
LED_HOLE_Y = 8.2

LED_PLATE_DEPTH = 0.26
LED_PLATE_TOLERANCE = 0.75
LED_DEPTH = 2.1 - LED_PLATE_DEPTH

LED_PITCH = 10

# this is the clear part of the print. Adjust the last number to compensate for
# initial layer thickness
LETTER_DEPTH = LAYER_HEIGHT * 2 + 0.2

# TODO: 1x for normal settings, 2x for "extra fine" layer height
DIFFUSER_DEPTH = LAYER_HEIGHT * 2

BAFFLE_DEPTH = 20  # This could maybe be a bit smaller.
# TODO: 4x might prevent edge gap problems better, used to just be 1mm
BAFFLE_THICKNESS = 2 * NOZZLE_WIDTH

PANEL_START = (FRONT_CELL * len(LETTERS) - LEDS * LED_PITCH) / 2
LED_X_OFFSET = (LED_PITCH - LED_HOLE_X) / 2
LED_Y_OFFSET = (LED_PITCH - LED_HOLE_Y) / 2

BACKWALL_THICKNESS = 1.5
BACKEND_DEPTH = 11 + 2  # 11m for breadboard, 2mm so usb cable fits
BACK_OUTER_WALL = 1
BACK_TOLERANCE = 1
LED_SUPPORT_THICKNESS = 4
USB_CABLE_DIAMETER = 5

# Absolute offset to the working area in the back plate
BACK_INNER_OFFSET = (
    PANEL_START
    - LED_PLATE_TOLERANCE / 2
    + BACK_TOLERANCE / 2
    + LED_SUPPORT_THICKNESS / 2
)

# current plan is to use m2x6mm screws: 2mm hole for screw head, 3mm of the
# screw in back plate (spacing), and 3mm of the screw in the insert
INSERT_DEPTH = 3
SCREW_HEAD_DEPTH = 2
SCREW_SPACING = 3

# (1.9-2 is the actual diameter, but set to halfway between that and the 3.7mm
# of the head)
SCREW_THREAD_DIAMETER = 2.85

SCREW_HEAD_DIAMETER = 4.5  # (actually 3.75, but yea, leave some space)


# Ensures screw hole is equidistant from the outer edges and the inner corner
INSERT_CENTER_OFFSET = (PANEL_START - BACK_OUTER_WALL - LED_PLATE_TOLERANCE) * (
    2 - math.sqrt(2)
) + BACK_OUTER_WALL
INSERT_DIAMETER = 3.4

NAIL_HOLE_DIAMETER = 5
NAIL_CHAMBER_DIAMETER = 8
NAIL_MAGIC_A = 20
NAIL_MAGIC_B = 25

WAGO_HEIGHT = 8
WAGO_DEPTH = 18
WAGO_WIDTH_LARGE = 30.5
WAGO_WIDTH_SMALL = 13.5
WAGO_WALL_THICKNESS = 1.5
WAGO_LED_OFFSET = 22
TOTAL_WAGO_WIDTH = 2 * WAGO_WIDTH_LARGE + 2 * WAGO_WIDTH_SMALL + 5 * WAGO_WALL_THICKNESS

PCB_PAD_HEIGHT = BACKWALL_THICKNESS + 2
PCB_POST_HEIGHT = PCB_PAD_HEIGHT + 3
PCB_PAD_DIAMETER = 8
PCB_POST_DIAMETER = 3.1

PCB_POST_OFFSET_SHORT = 53.3
PCB_POST_OFFSET_LONG = 83.9
PCB_WALL_OFFSET = 6

PCB_X = PRINT_BED - BACK_INNER_OFFSET - PCB_WALL_OFFSET
PCB_Y = BACK_INNER_OFFSET + PCB_WALL_OFFSET + BACKEND_DEPTH + USB_CABLE_DIAMETER

# CABLE_GUIDE_DIAMETER = PCB_Y - BACK_INNER_OFFSET + PCB_POST_OFFSET_SHORT/2 - USB_CABLE_DIAMETER*3/2
CABLE_GUIDE_WALL_SIZE = 2
CABLE_GUIDE_DIAMETER = 31
CABLE_GUIDE_X = CABLE_GUIDE_DIAMETER / 2 + BACK_INNER_OFFSET + USB_CABLE_DIAMETER
CABLE_GUIDE_Y = (
    -CABLE_GUIDE_DIAMETER / 2
    + PCB_Y
    + PCB_POST_OFFSET_SHORT / 2
    - USB_CABLE_DIAMETER / 2
)

CABLE_WALL_Y = PCB_Y + PCB_POST_OFFSET_SHORT / 2 + USB_CABLE_DIAMETER / 2
CABLE_WALL_LENGTH = PCB_X - PCB_POST_OFFSET_LONG - BACK_INNER_OFFSET - 26 - 1


def _2d_letter(letter):
    o = text(
        letter.upper(),
        font="Name Smile",
        halign="center",
        valign="center",
        size=FRONT_CELL * 0.7,
    )  # maybe make this scaling a hair smaller? but seems ok.
    o = o.use("Name Smile.otf")
    o = o.rotate(x=180)
    return o


letters = []  # Letters to be used in white/clear print and a cutout for black print.
baffle_cuts = []  # Just the component behind the front plate
baffle_liners = []  # also the front diffuser

# We could try a bit harder to ensure we only cut holes for the leds that dont
# have letters, but w/e.
for row, col in itertools.product(range(LEDS), repeat=2):
    baffle_cuts.append(
        cube(LED_HOLE_X, LED_HOLE_Y, LED_DEPTH, center=False).translate(
            PANEL_START + LED_X_OFFSET + LED_PITCH * col,
            PANEL_START + LED_Y_OFFSET + LED_PITCH * row,
            LETTER_DEPTH + BAFFLE_DEPTH - LED_DEPTH,
        )
    )

for row, row_str in enumerate(LETTERS):
    for col, letter in enumerate(row_str):
        # This will produce all the components of the grid in their correct positions

        # The basic letter
        base_letter = _2d_letter(letter).translate(
            col * FRONT_CELL + FRONT_CELL / 2, row * FRONT_CELL + FRONT_CELL / 2, 0
        )
        letters.append(base_letter.linear_extrude(height=LETTER_DEPTH, center=False))

        # The baffle cutout (to edge of black)
        row_offset, col_offset, horizontal = LED_CUTS[row][col]
        if horizontal:
            X_HOLE, Y_HOLE = LED_PITCH + LED_HOLE_X, LED_HOLE_Y
        else:
            X_HOLE, Y_HOLE = LED_HOLE_X, LED_PITCH + LED_HOLE_Y

        baffle_top = cube(X_HOLE, Y_HOLE, EPSILON, center=False).translate(
            PANEL_START + LED_X_OFFSET + LED_PITCH * col_offset,
            PANEL_START + LED_Y_OFFSET + LED_PITCH * row_offset,
            LETTER_DEPTH + BAFFLE_DEPTH - LED_DEPTH,
        )

        led_hole = cube(X_HOLE, Y_HOLE, LED_DEPTH, center=False).translate(
            PANEL_START + LED_X_OFFSET + LED_PITCH * col_offset,
            PANEL_START + LED_Y_OFFSET + LED_PITCH * row_offset,
            LETTER_DEPTH + BAFFLE_DEPTH - LED_DEPTH,
        )

        baffle_tube = (
            base_letter.linear_extrude(height=EPSILON, center=False).translate(
                z=LETTER_DEPTH
            )
            + baffle_top
        ).hull()

        baffle_cuts.append(baffle_tube + led_hole)

        # The baffle liner (the white part)
        # 0.5 liner width was too small even with 0.25mm heads.
        baffle_liners.append(
            (
                baffle_tube.minkowski(cube(BAFFLE_THICKNESS))
                - (
                    baffle_tube
                    - cube(
                        INFINITY, INFINITY, LETTER_DEPTH + DIFFUSER_DEPTH, center=False
                    )
                )
            ).intersection(
                cube(
                    INFINITY, INFINITY, BAFFLE_DEPTH - LED_DEPTH, center=False
                ).translate(z=LETTER_DEPTH)
            )
        )

CLOSE = INSERT_CENTER_OFFSET
FAR = PRINT_BED - INSERT_CENTER_OFFSET
insert_holes = [
    cylinder(
        h=INFINITY,
        d=INSERT_DIAMETER,
        center=False,
        fn=20,
    ).translate(x, y, LETTER_DEPTH + BAFFLE_DEPTH + LED_PLATE_DEPTH)
    for x, y in [(CLOSE, CLOSE), (CLOSE, FAR), (FAR, CLOSE), (FAR, FAR)]
]
# TODO: idea: what if the front layer is white? Does it change the legibility of
# the letters? Can the black behind letters be seen when leds are off?

black = cube(
    PRINT_BED,
    PRINT_BED,
    LETTER_DEPTH + BAFFLE_DEPTH + LED_PLATE_DEPTH + BACKEND_DEPTH + BACKWALL_THICKNESS,
    center=False,
).difference(
    baffle_cuts
    + baffle_liners
    + letters
    + insert_holes
    + [
        cube(  # the area behind the led plate for electronics
            LEDS * LED_PITCH + LED_PLATE_TOLERANCE,
            LEDS * LED_PITCH + LED_PLATE_TOLERANCE,
            INFINITY,
            center=False,
        ).translate(
            PANEL_START - LED_PLATE_TOLERANCE / 2,
            PANEL_START - LED_PLATE_TOLERANCE / 2,
            LETTER_DEPTH + BAFFLE_DEPTH,
        ),
        cube(  # the gap around the edges for mounting the back plate
            PRINT_BED - BACK_OUTER_WALL * 2,
            PRINT_BED - BACK_OUTER_WALL * 2,
            INFINITY,
            center=False,
        ).translate(
            BACK_OUTER_WALL,
            BACK_OUTER_WALL,
            LETTER_DEPTH
            + BAFFLE_DEPTH
            + LED_PLATE_DEPTH
            + BACKEND_DEPTH
            + BACKWALL_THICKNESS
            - SCREW_HEAD_DEPTH
            - SCREW_SPACING,
        ),
        cube(
            USB_CABLE_DIAMETER,
            BACK_OUTER_WALL * 3,
            INFINITY,
            center=False,
        ).translate(
            -USB_CABLE_DIAMETER / 2 + PRINT_BED / 2,
            PRINT_BED - BACK_OUTER_WALL * 2,
            LETTER_DEPTH
            + BAFFLE_DEPTH
            + LED_PLATE_DEPTH
            + BACKEND_DEPTH
            + BACKWALL_THICKNESS
            - SCREW_HEAD_DEPTH
            - SCREW_SPACING,
        ),
    ]
)

white = union(baffle_liners + letters)

if False:
    # Add a single clear layer to the front
    black = black.translate(z=LAYER_HEIGHT)
    white = white.translate(z=LAYER_HEIGHT) + cube(
        PRINT_BED, PRINT_BED, LAYER_HEIGHT + EPSILON, center=False
    )


screw_holes = [
    (
        cylinder(
            h=INFINITY,
            d=SCREW_THREAD_DIAMETER,
            center=False,
            fn=20,
        )
        + cylinder(h=SCREW_HEAD_DEPTH, d=SCREW_HEAD_DIAMETER, center=False, fn=20)
    ).translate(x, y, 0)
    for x, y in [(CLOSE, CLOSE), (CLOSE, FAR), (FAR, CLOSE), (FAR, FAR)]
]

# The extra terms in PCB_Y to account for the cable guide are supery hacky. I should fix that whole part.
pcb_posts = [
    cylinder(h=PCB_PAD_HEIGHT, d=PCB_PAD_DIAMETER, fn=40)
    .translate(z=PCB_PAD_HEIGHT / 2)
    .union(
        cylinder(h=PCB_POST_HEIGHT, d=PCB_POST_DIAMETER, fn=40).translate(
            z=PCB_POST_HEIGHT / 2
        )
    )
    .translate(x, y, 0)
    for x, y in [
        (PCB_X, PCB_Y),
        (PCB_X - PCB_POST_OFFSET_LONG, PCB_Y),
        (PCB_X, PCB_Y + PCB_POST_OFFSET_SHORT),
        (PCB_X - PCB_POST_OFFSET_LONG, PCB_Y + PCB_POST_OFFSET_SHORT),
    ]
]

extra_supports = [
    cylinder(
        h=BACKWALL_THICKNESS + BACKEND_DEPTH,
        d=LED_SUPPORT_THICKNESS * 2,
        center=False,
        fn=40,
    ).translate(x, y, 0)
    for x, y in [
        (140, 120),
        (40, 110),
        (PRINT_BED / 2, 105),
        (PRINT_BED * 3 / 4, BACK_INNER_OFFSET + LED_SUPPORT_THICKNESS * 1.3),
    ]
]


back_plate = (
    (
        cube(
            PRINT_BED - 2 * BACK_OUTER_WALL - BACK_TOLERANCE,
            PRINT_BED - 2 * BACK_OUTER_WALL - BACK_TOLERANCE,
            SCREW_HEAD_DEPTH + SCREW_SPACING,
            center=False,
        )
        .translate(
            BACK_OUTER_WALL + BACK_TOLERANCE / 2,
            BACK_OUTER_WALL + BACK_TOLERANCE / 2,
            0,
        )
        .union(
            [
                cube(
                    LEDS * LED_PITCH + LED_PLATE_TOLERANCE - BACK_TOLERANCE,
                    LEDS * LED_PITCH + LED_PLATE_TOLERANCE - BACK_TOLERANCE,
                    BACKWALL_THICKNESS + BACKEND_DEPTH,
                    center=False,
                ).translate(
                    PANEL_START - LED_PLATE_TOLERANCE / 2 + BACK_TOLERANCE / 2,
                    PANEL_START - LED_PLATE_TOLERANCE / 2 + BACK_TOLERANCE / 2,
                    0,
                ),
            ]
        )
    )
    .difference(
        screw_holes
        + [
            cube(  # the area behind the led plate for electronics
                LEDS * LED_PITCH
                + LED_PLATE_TOLERANCE
                - BACK_TOLERANCE
                - LED_SUPPORT_THICKNESS,
                LEDS * LED_PITCH
                + LED_PLATE_TOLERANCE
                - BACK_TOLERANCE
                - LED_SUPPORT_THICKNESS,
                INFINITY,
                center=False,
            ).translate(
                PANEL_START
                - LED_PLATE_TOLERANCE / 2
                + BACK_TOLERANCE / 2
                + LED_SUPPORT_THICKNESS / 2,
                PANEL_START
                - LED_PLATE_TOLERANCE / 2
                + BACK_TOLERANCE / 2
                + LED_SUPPORT_THICKNESS / 2,
                BACKWALL_THICKNESS,
            ),
            cube(  # usb cable hole
                USB_CABLE_DIAMETER,
                2
                * (
                    PANEL_START
                    - LED_PLATE_TOLERANCE / 2
                    + BACK_TOLERANCE / 2
                    + LED_SUPPORT_THICKNESS / 2
                    + USB_CABLE_DIAMETER / 2
                ),
                INFINITY,
                center=True,
            ).translate(PRINT_BED / 2, 0, 0),
            cylinder(  # usb cable hole (rounding so it looks nice)
                h=INFINITY, d=USB_CABLE_DIAMETER, fn=40
            ).translate(
                PRINT_BED / 2,
                PANEL_START
                - LED_PLATE_TOLERANCE / 2
                + BACK_TOLERANCE / 2
                + LED_SUPPORT_THICKNESS / 2
                + USB_CABLE_DIAMETER / 2,
                0,
            ),
        ]
    )
    .union(
        pcb_posts
        + extra_supports
        + [
            # Nail holders
            cube(
                NAIL_CHAMBER_DIAMETER + EPSILON,
                NAIL_MAGIC_B + EPSILON,
                BACKWALL_THICKNESS + BACKEND_DEPTH,
                center=False,
            ).translate(
                BACK_INNER_OFFSET, PRINT_BED - BACK_INNER_OFFSET - NAIL_MAGIC_B, 0
            ),
            cube(
                NAIL_CHAMBER_DIAMETER + EPSILON,
                NAIL_MAGIC_B + EPSILON,
                BACKWALL_THICKNESS + BACKEND_DEPTH,
                center=False,
            ).translate(
                PRINT_BED - BACK_INNER_OFFSET - NAIL_CHAMBER_DIAMETER,
                PRINT_BED - BACK_INNER_OFFSET - NAIL_MAGIC_B,
                0,
            ),
            # Cable guide
            cube(
                CABLE_WALL_LENGTH,
                CABLE_GUIDE_WALL_SIZE,
                BACKWALL_THICKNESS + BACKEND_DEPTH,
                center=False,
            ).translate(BACK_INNER_OFFSET, CABLE_WALL_Y, 0),
            cylinder(
                h=BACKWALL_THICKNESS + BACKEND_DEPTH,
                d=CABLE_GUIDE_DIAMETER,
                center=False,
                fn=40,
            )
            .difference(
                cylinder(
                    h=INFINITY,
                    d=CABLE_GUIDE_DIAMETER - 2 * CABLE_GUIDE_WALL_SIZE,
                    center=False,
                    fn=40,
                )
            )
            .translate(CABLE_GUIDE_X, CABLE_GUIDE_Y, 0),
            cylinder(
                h=BACKWALL_THICKNESS + BACKEND_DEPTH,
                d=CABLE_GUIDE_DIAMETER
                + 2 * USB_CABLE_DIAMETER
                + 2 * CABLE_GUIDE_WALL_SIZE,
                center=False,
                fn=40,
            )
            .difference(
                [
                    cylinder(
                        h=INFINITY,
                        d=CABLE_GUIDE_DIAMETER + 2 * USB_CABLE_DIAMETER,
                        center=False,
                        fn=40,
                    ),
                    cube(INFINITY, INFINITY, INFINITY, center=True).translate(
                        x=-INFINITY / 2
                    ),
                    cube(INFINITY, INFINITY, INFINITY, center=True)
                    .translate(y=INFINITY / 2)
                    .rotate(z=-35),
                ]
            )
            .translate(CABLE_GUIDE_X, CABLE_GUIDE_Y, 0),
            # Wago placement guides
            cube(
                TOTAL_WAGO_WIDTH,
                WAGO_DEPTH + WAGO_WALL_THICKNESS,
                WAGO_HEIGHT + BACKWALL_THICKNESS,
                center=False,
            )
            .difference(
                [
                    cube(
                        WAGO_WIDTH_SMALL, WAGO_DEPTH, INFINITY, center=False
                    ).translate(WAGO_WALL_THICKNESS, 0, 0),
                    cube(
                        WAGO_WIDTH_SMALL, WAGO_DEPTH, INFINITY, center=False
                    ).translate(WAGO_WALL_THICKNESS * 2 + WAGO_WIDTH_SMALL, 0, 0),
                    cube(
                        WAGO_WIDTH_LARGE, WAGO_DEPTH, INFINITY, center=False
                    ).translate(WAGO_WALL_THICKNESS * 3 + WAGO_WIDTH_SMALL * 2, 0, 0),
                    cube(
                        WAGO_WIDTH_LARGE, WAGO_DEPTH, INFINITY, center=False
                    ).translate(
                        WAGO_WALL_THICKNESS * 4
                        + WAGO_WIDTH_SMALL * 2
                        + WAGO_WIDTH_LARGE,
                        0,
                        0,
                    ),
                ]
            )
            .translate(
                PRINT_BED / 2
                - TOTAL_WAGO_WIDTH
                + WAGO_WIDTH_LARGE
                + 1.5 * WAGO_WALL_THICKNESS,
                PRINT_BED
                - WAGO_DEPTH
                - WAGO_WALL_THICKNESS
                - PANEL_START
                - WAGO_LED_OFFSET,
                0,
            ),
            # cable guide (this is gross. I'm sorry.)
            circle(r=BACKEND_DEPTH - USB_CABLE_DIAMETER, fn=40)
            .translate(x=BACKEND_DEPTH - USB_CABLE_DIAMETER / 2)
            .rotate_extrude(convexity=10, fn=40)
            .difference(
                [
                    cube(INFINITY, INFINITY, INFINITY).translate(z=-INFINITY / 2),
                    cube(INFINITY, INFINITY, INFINITY).translate(y=-INFINITY / 2),
                ]
            )
            .intersection(cylinder(h=INFINITY, d=BACKEND_DEPTH * 2, center=True, fn=40))
            .translate(y=USB_CABLE_DIAMETER / 2)
            .union(
                [
                    cylinder(
                        h=USB_CABLE_DIAMETER / 2,
                        r=BACKEND_DEPTH - USB_CABLE_DIAMETER,
                        fn=40,
                        center=False,
                    )
                    .rotate(x=-90)
                    .translate(x=BACKEND_DEPTH - USB_CABLE_DIAMETER / 2),
                    cylinder(
                        h=USB_CABLE_DIAMETER / 2,
                        r=BACKEND_DEPTH - USB_CABLE_DIAMETER,
                        fn=40,
                        center=False,
                    )
                    .rotate(x=-90)
                    .translate(x=-(BACKEND_DEPTH - USB_CABLE_DIAMETER / 2)),
                ]
            )
            .difference(
                [
                    cube(INFINITY, INFINITY, INFINITY).translate(z=-INFINITY / 2),
                    cube(INFINITY, INFINITY, INFINITY).translate(
                        x=INFINITY / 2 + BACKEND_DEPTH
                    ),
                    cube(INFINITY, INFINITY, INFINITY).translate(
                        x=-INFINITY / 2 - BACKEND_DEPTH
                    ),
                ]
            )
            .translate(
                PRINT_BED / 2,
                PANEL_START
                - LED_PLATE_TOLERANCE / 2
                + BACK_TOLERANCE / 2
                + LED_SUPPORT_THICKNESS / 2,
                BACKWALL_THICKNESS - EPSILON,
            ),
        ]
    )
    .difference(
        [
            cylinder(h=INFINITY / 2, d=NAIL_HOLE_DIAMETER, fn=40)
            .rotate(x=-45)
            .difference(
                [
                    cube(INFINITY).translate(z=-INFINITY / 2 - 1),
                    cube(INFINITY).translate(
                        z=INFINITY / 2 + BACKWALL_THICKNESS + BACKEND_DEPTH - 2
                    ),
                ]
            )
            .translate(x, PRINT_BED - BACK_INNER_OFFSET - NAIL_MAGIC_A, 0)
            for x in [
                BACK_INNER_OFFSET + NAIL_CHAMBER_DIAMETER / 2,
                PRINT_BED - BACK_INNER_OFFSET - NAIL_CHAMBER_DIAMETER / 2,
            ]
        ]
    )
)

write_scad(back_plate, name="clock-back.scad")
write_scad(black, name="clock-black.scad")
write_scad(white, name="clock-white.scad")

# Files for the 3 color print done by ultimaker
# write_scad(back_plate, name="clock-3-color-back-black.scad")
# write_scad(black, name="clock-3-color-black.scad")
# write_scad(union(baffle_liners), name="clock-3-color-white.scad")
# write_scad(union(letters), name="clock-3-color-clear.scad")
