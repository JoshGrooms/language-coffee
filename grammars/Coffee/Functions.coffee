# CHANGELOG
# Written by Josh Grooms on 20151218

Patterns = require('./Utilities')



simpleFunction =
    match:
        ///
            (?: (\w+) (\:\:) )?
            (\w+) \s* ([\:\=]) \s*
            ( [\-\=] \> )
        ///;
    captures:
        1: name: 'type.name.coffee';
        2: name: 'operator.character.resolution.coffee'
        3: name: 'function.name.coffee';
        4: name: 'operator.character.coffee';
        5: name: 'operator.character.coffee';

functions =
    begin:
        ///
            (?: (\w+)(\:\:) )?
            (\w+) \s* ( [\:\=] ) \s*
            (\()
        ///;
    captures:
        1: name: 'type.name.coffee';
        2: name: 'operator.character.resolution.coffee'
        3: name: 'function.name.coffee';
        4: name: 'operator.character.coffee';
        5: name: 'enclosure.group.open.coffee';

    end: /(\))\s*([\-\=]\>)/;
    endCaptures:
        1: name: 'enclosure.group.close.coffee';
        2: name: 'operator.character.coffee';

    patterns:
        [
            Patterns.Booleans,
            Patterns.Nulls,
            Patterns.Numbers,
            Patterns.Separator,

            {
                match: /(\w+)\s*(\=)\s*/
                captures:
                    1: name: 'variable.argument.input.coffee';
                    2: name: 'operator.character.coffee';
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
        # simpleMethod,
    ];
