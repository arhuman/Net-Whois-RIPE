can_ok $class,

    # Constructor
    qw( new ),

    # OO Support
    qw( dump attributes attribute_is filtered_attributes displayed_attributes );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with $class tests" );

for my $a ( $object->attributes('mandatory') ) {
    ok( $object->attribute_is( $a, 'mandatory' ), "Attribute $a is mandatory" );
    ok( !$object->attribute_is( $a, 'optionnal' ), "Attribute $a is not optionnal");
}

for my $a ( $object->attributes('optionnal') ) {
    ok( !$object->attribute_is( $a, 'mandatory' ), "Attribute $a is not mandatory" );
    ok( $object->attribute_is( $a, 'optionnal' ), "Attribute $a is optionnal");
}

for my $a ( $object->attributes('single') ) {
    ok( $object->attribute_is( $a, 'single' ), "Attribute $a is single valued" );
    ok( !$object->attribute_is( $a, 'multiple', "Attribute $a is multi valued" ) );
}

for my $a ( $object->attributes('multiple') ) {
    ok( !$object->attribute_is( $a, 'single' ), "Attribute $a is single valued" );
    ok( $object->attribute_is( $a, 'multiple', "Attribute $a is multi valued" ) );
}

# Check that all attributes have been tested

for my $a ( $object->attributes('all') ) {
    # Check that each attribute has been tested
    ok ($tested{ $a }, "Attribute $a has been tested");

    # Check that each attribute is set either to 'single' or 'multiple'
    ok ($object->attribute_is($a, 'single') or $object->attribute_is($a, 'multiple'), "$a is either single or multiple");
    ok ($object->attribute_is($a, 'single') != $object->attribute_is($a, 'multiple'), "$a can't be both single".$object->attribute_is($a,'single')." and multi".$object->attribute_is($a,'multiple'));
}
