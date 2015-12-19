# CHANGELOG
# Written by Josh Grooms on 20151218



simpleFunction =
    match: /^\s*(\w+)(\:)\s*(\-\>)/;
    captures:
        1: name: 'function.name.coffee';
        2: name: 'operator.character.coffee';
        3: name: 'operator.character.coffee';

functions =
    begin: /^\s*(\w+)(\:)\s*(\()/;
    captures:
        1: name: 'function.name.coffee';
        2: name: 'operator.character.coffee';
        3: name: 'enclosure.group.open.coffee';

    end: /(\))\s*(\-\>)/;
    endCaptures:
        1: name: 'enclosure.group.close.coffee';
        2: name: 'operator.character.coffee';

    patterns:
        [
            {
                match: /\,/;
                name: 'operator.character.separator.coffee';
            }
            {
                match: /\w+/;
                name: 'variable.argument.input.coffee';
            }
            {
                match: /\@/;
                name: 'operator.character.coffee';
            }
        ];

module.exports =
    [
        functions,
        simpleFunction,
    ];
