//http://velonews.competitor.com/2016/01/bikes-and-tech/technical-faq/tech-faq-chain-width-explained-compatibility-queries-answered_392163
function inches_to_mm(inches) = inches * 25.4;
default_pitch = inches_to_mm(1/2);
default_roller_diameter = inches_to_mm(5/16);
default_outer_width = 5.9;
default_pin_diameter = 4;

$fn = 72;

chain_link();

module chain_link(
    pitch = undef,
    outer_width = undef,
    pin_diameter = undef,
    roller_diameter = undef,
)
{
    function _pitch() = (pitch != undef) ? pitch : default_pitch;
    function _outer_width() = (outer_width != undef) ? outer_width : default_outer_width;
    function _pin_diameter() = (pin_diameter != undef) ? pin_diameter : default_pin_diameter;
    function _roller_diameter() = (roller_diameter != undef) ? roller_diameter : default_roller_diameter;


    _chain_link(
        pitch = _pitch(),
        outer_width = _outer_width(),
        pin_diameter = _pin_diameter(),
        roller_diameter = _roller_diameter());
}

module _chain_link(
    pitch,
    outer_width,
    pin_diameter,
    roller_diameter
)
{
    difference()
    {
        _body();
        _holes();
    }

    module _body()
    {
        translate([-pitch/2,0,0])
        hull()
        {
            _roller();

            translate([pitch, 0, 0])
            _roller();
        }
    }

    module _holes()
    {
        translate([-pitch/2,0,0])
        _pin_hole();

        translate([pitch/2, 0, 0])
        _pin_hole();

        _bite();

        rotate(180)
        _bite();
    }

    module _roller()
    {
        difference()
        {
            cylinder(d = roller_diameter, h = outer_width);            
        }
    }

    module _pin_hole()
    {
        translate([0,0,-1])
        cylinder(d = pin_diameter, h = outer_width + 2);
    }

    module _bite()
    {
        bite_radius = pitch;

        translate([0, (pin_diameter / 2) + bite_radius, -1])
        cylinder(r = bite_radius, h = outer_width + 2);
    }
}

