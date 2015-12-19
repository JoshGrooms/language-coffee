# CHANGELOG
# Written by Josh Grooms on 20151218

# OPERATORS - Captures any valid character-based operators in C and C++.
operators =
    match:
        ///(
            \@ |
            \, |
            \; |
            \? |
            \~ |
            \. | \.\* |
            \: | \:\: |
            \^ | \^\= |
            \% | \%\= |
            \= | \=\= |
            \! | \!\= |
            \* | \*\= |
            \/ | \/\= |
            \& | \&\= | \&\& |
            \| | \|\= | \|\| |
            \+ | \+\= | \+\+ |
            \- | \-\= | \-\- |
            \> | \>\= | \>\> | \>\>\= |
            \< | \<\= | \<\< | \<\<\=
        )///
    name: 'operator.character.coffee';

# ENCLOSURES - Captures any valid enclosure characters in C and C++.
enclosures =
    [
        {
            match: /\[/;
            name: 'enclosure.index.open.coffee';
        }
        {
            match: /\]/;
            name: 'enclosure.index.close.coffee';
        }
        {
            match: /\(/;
            name: 'enclosure.group.open.coffee';
        }
        {
            match: /\)/;
            name: 'enclosure.group.close.coffee';
        }
        {
            match: /\{/;
            name: 'enclosure.block.open.coffee';
        }
        {
            match: /\}/;
            name: 'enclosure.block.close.coffee';
        }
    ];

module.exports = [ operators, enclosures ];
