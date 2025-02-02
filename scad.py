# TODO: set special variables: $fa $fs $fn

# ---------- Primitives -----------------


def circle(r=None, d=None, **kwargs):
    return _base_object("circle", r=r, d=d, **kwargs)


def square(*args, center=True, **kwargs):
    if len(args) == 1:
        size = args[0]
    elif len(args) == 2:
        size = list(args)
    else:
        raise Exception("Must specify either one or two lengths")
    return _base_object("square", size, center=center, **kwargs)


def polygon(points, paths=None, convexity=None, **kwargs):
    return _base_object("polygon", points, paths=paths, convexity=convexity, **kwargs)


def text(text, **kwargs):
    return _base_object("text", text, **kwargs)


def sphere(r=None, d=None, **kwargs):
    return _base_object("sphere", r=r, d=d, **kwargs)


def cube(*args, center=True, **kwargs):
    if len(args) == 1:
        size = args[0]
    elif len(args) == 3:
        size = list(args)
    else:
        raise Exception("Must specify either one or three lengths")
    return _base_object("cube", size, center=center, **kwargs)


def cylinder(h=None, r1=None, r2=None, d=None, center=True, **kwargs):
    return _base_object("cylinder", h=h, r1=r1, r2=r2, d=d, center=center, **kwargs)


def polyhedron(points, faces=None, convexity=None, **kwargs):
    return _base_object(
        "polyhedron", points, faces=faces, convexity=convexity, **kwargs
    )


def surface(**kwargs):
    kwargs["center"] = kwargs.get("center", True)
    return _base_object("surface", **kwargs)


def import_stl(filename, **kwargs):
    return _base_object("import", filename, **kwargs)


def union(*args):
    inputs = _params_or_list(args)
    return inputs[0].union(*inputs[1:])


# ---------- Utils ----------------------


def write_scad(world, name="relp.scad", render=False):
    if render:
        world = world.render()
    with open(name, "w") as f:
        print(world.scad(), file=f)


# ---------- Internals ------------------


def _params_or_list(args):
    ret = []
    for arg in args:
        if type(arg) is _OpenSCADObject:
            ret.append(arg)
        else:
            ret.extend(arg)
    return ret


def _stringify(s):
    if isinstance(s, bool):
        return str(s).lower()
    elif isinstance(s, str):
        return f'"{s}"'
    elif isinstance(s, list):
        return "[" + ", ".join(_stringify(x) for x in s) + "]"
    elif isinstance(s, (int, float)):
        return str(s)
    else:
        raise Exception(f"Unknown argument type {type(s)=}, {s=}")


def _specialify(k):
    if k in {"fa", "fs", "fn"}:
        return "$" + k
    return k


def _base_object(name, *args, **kwargs):
    cmd = name + "("
    prefix = []
    for arg in args:
        prefix.append(_stringify(arg))
    for k, v in kwargs.items():
        if v is None:
            continue
        else:
            v = _stringify(v)
        prefix.append(_specialify(k) + "=" + v)
    cmd += ", ".join(map(str, prefix))
    cmd += ");"

    return _OpenSCADObject(cmd, "", [])


class _OpenSCADObject:
    def __init__(self, prefix, postfix, objects):
        self.prefix = prefix
        self.postfix = postfix
        # Filter other types out of objects, e.g., sum(...) will introduce an int.
        self.objects = [obj for obj in objects if isinstance(obj, _OpenSCADObject)]
        self.module_name = None
        self.uses = set()

    def scad(self):
        uses = set()
        lines, _ = self._traverse(uses)
        self._clear_name()
        lines.append("m0();")
        return "\n".join(list(uses) + lines)

    def _traverse(self, uses, c=0):
        """Returns (lines, new counter)"""
        uses.update(self.uses)
        if self.module_name is not None:
            return ([], c)
        self.module_name = "m" + str(c)
        c += 1
        lines = []

        for x in self.objects:
            line, c = x._traverse(uses, c)
            lines.extend(line)

        lines.append("module " + self.module_name + "() {")
        lines.append(" " * 4 + self.prefix)

        for obj in self.objects:
            assert obj.module_name is not None
            lines.append(" " * 8 + obj.module_name + "();")

        if self.postfix:
            lines.append(" " * 4 + self.postfix)

        lines.append("}")
        lines.append("")

        return (lines, c)

    def _clear_name(self):
        self.module_name = None
        for x in self.objects:
            x._clear_name()

    def __add__(self, x):
        return self.union(x)

    def __radd__(self, x):
        return self.union(x)

    def __mul__(self, x):
        return self.intersection(x)

    def __sub__(self, x):
        return self.difference(x)

    def __pow__(self, x):
        return self.minkowski(x)

    def use(self, path):
        self.uses.add(f"use <{path}>")
        return self

    def union(self, *others):
        inputs = _params_or_list(others)
        return _OpenSCADObject("union() {", "}", [self] + inputs)

    def difference(self, *others):
        inputs = _params_or_list(others)
        return _OpenSCADObject("difference() {", "}", [self] + inputs)

    def intersection(self, *others):
        inputs = _params_or_list(others)
        return _OpenSCADObject("intersection() {", "}", [self] + inputs)

    def translate(self, x: float = 0, y: float = 0, z: float = 0):
        return _OpenSCADObject("translate([{}, {}, {}])".format(x, y, z), "", (self,))

    def up(self, x):
        return self.translate(z=x)

    def down(self, x):
        return self.translate(z=-x)

    def right(self, x):
        return self.translate(x=x)

    def left(self, x):
        return self.translate(x=-x)

    def forward(self, x):
        return self.translate(y=x)

    def back(self, x):
        return self.translate(y=-x)

    def rotate(self, x=0, y=0, z=0):
        return _OpenSCADObject("rotate([{}, {}, {}])".format(x, y, z), "", (self,))

    def scale(self, *args, **kwargs):
        if len(args) == 1:
            prefix = "scale({})".format(args[0])
        elif len(args) == 3:
            prefix = "scale([{}, {}, {}])".format(*args)
        else:
            x = kwargs.get("x", 1)
            y = kwargs.get("y", 1)
            z = kwargs.get("z", 1)
            prefix = "scale([{}, {}, {}])".format(x, y, z)
        return _OpenSCADObject(prefix, "", (self,))

    def resize(self, x=0, y=0, z=0):
        # differ from spec: negative values get 0,auto=false
        return _OpenSCADObject(
            "resize([{}, {}, {}], auto=[{}, {}, {}])".format(
                max(0, x),
                max(0, y),
                max(0, z),
                str(x < 0).lower(),
                str(y < 0).lower(),
                str(z < 0).lower(),
            ),
            "",
            (self,),
        )

    def mirror(self, x=0, y=0, z=0):
        return _OpenSCADObject("mirror([{}, {}, {}])".format(x, y, z), "", (self,))

    def multmatrix(self, m):
        return _OpenSCADObject("multmatrix(m={})".format(m), "", (self,))

    def color(self, r=1, g=1, b=1, a=1):
        if isinstance(r, str):
            prefix = 'color("{}", {})'.format(r, g)
        else:
            prefix = "color([{}, {}, {}, {}])".format(r, g, b, a)
        return _OpenSCADObject(prefix, "", (self,))

    def offset(self, **kwargs):
        return self._dictargs("offset", kwargs)

    def hull(self, *others):
        return _OpenSCADObject("hull() {", "}", (self,) + others)

    def minkowski(self, *others):
        return _OpenSCADObject("minkowski() {", "}", (self,) + others)

    def disable(self):
        return _OpenSCADObject("*", "", (self,))

    def show_only(self):
        return _OpenSCADObject("!", "", (self,))

    def highlight(self):
        return _OpenSCADObject("#", "", (self,))

    def debug(self):
        return self.highlight()

    def transparent(self):
        return _OpenSCADObject("%", "", (self,))

    def background(self):
        return self.transparent()

    def linear_extrude(self, **kwargs):
        kwargs["center"] = kwargs.get("center", True)
        return self._dictargs("linear_extrude", kwargs)

    def rotate_extrude(self, **kwargs):
        return self._dictargs("rotate_extrude", kwargs)

    def projection(self, **kwargs):
        return self._dictargs("projection", kwargs)

    def render(self, **kwargs):
        return self._dictargs("render", kwargs)

    def set_special(self, **kwargs):
        return _OpenSCADObject(
            " ".join("${} = {};".format(*i) for i in kwargs.items()), "", (self,)
        )

    def _dictargs(self, name, args):
        return _OpenSCADObject(
            "{}({})".format(
                name,
                ", ".join(
                    f"{_specialify(i[0])}={_stringify(i[1])}" for i in args.items()
                ),
            ),
            "",
            (self,),
        )

    def shell(self, thickness, resolution=None):
        expand = self.minkowski(cube(1)) - self
        trace = (
            cube(thickness * 2)
            if resolution is None
            else sphere(thickness).set_special(fs=resolution)
        )
        return expand.minkowski(trace) * self
