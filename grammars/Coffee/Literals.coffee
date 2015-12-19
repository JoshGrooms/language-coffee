# CHANGELOG
# Written by Josh Grooms on 20151218
# DEBLANK - Removes all whitespace from a string.
String::deblank = ->
    return @replace(/(\s*|\r|\n)/gm, '');

booleans =
    match:
        ///\b(
            false   |
            no      |
            off     |
            on      |
            true    |
            yes
        )\b///;
    name: 'literal.boolean.cpp';

numbers =
    match:
        ///\b(
            \d+
            (?: \.\d+ )?
            (?:
                [eE]
                [\+\-]?  \d+
            )?
        )\b///;
    name: 'literal.number.coffee';

others =
    match: /\b(null|undefined)\b/;
    name: 'literal.null.cpp';



## STRINGS ##
emptyStrings =
    match: /([\'\"])([\'\"])/;
    captures:
        1: name: 'enclosure.string.open.coffee';
        2: name: 'enclosure.string.close.coffee';

inlineStrings =
    match:
        '''
            (?<! \\\\ )
            ( [\\'\\"] )
            (\\.*)
            (?:
                [^\\\\] |
                \\\\ \\\\
            )?
            ( [\\'\\"] )
        '''.deblank();
    captures:
        0: name: 'literal.string.coffee';
        1: name: 'enclosure.string.open.coffee';
        2: name: 'literal.string.content.coffee';
        3: name: 'enclosure.string.close.coffee';

blockStrings =
    begin:
        '''
            (?<! \\\\ )
            ( [\\'\\"]+ )
        '''.deblank();
    beginCaptures:
        1: name: 'enclosure.string.open.coffee';
    contentName: 'literal.string.coffee';
    end:
        '''
            (?<! \\\\ )
            ( [\\'\\"]+ )
        '''.deblank();
    endCaptures:
        1: name: 'enclosure.string.close.coffee';



## REGULAR EXPRESSIONS ##
blockRXP =
    begin: /\/\/\//;
    beginCaptures: 'enclosure.string.regex.open.coffee';
    end: /\/\/\//;
    endCaptures: 0: name: 'enclosure.string.regex.close.coffee';
    contentName: 'literal.string.regex.coffee';

inlineRXP =
    match: /(\/)(.*)(\/)/;
    captures:
        1: name: 'enclosure.string.regex.open.coffee';
        2: name: 'literal.string.regex.coffee';
        3: name: 'enclosure.string.regex.close.coffee';


module.exports =
    [
        blockRXP,
        booleans,
        inlineRXP,
        numbers,
        others,

        emptyStrings,
        inlineStrings,
        blockStrings,
    ];
