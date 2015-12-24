# CHANGELOG
# Written by Josh Grooms on 20151224



String::Deblank = ->
    return @replace(/\s*|\r|\n/gm, '')



module.exports =
    Booleans:
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

    Numbers:
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

    Nulls:
        match: /\b(null|undefined)\b/;
        name: 'literal.null.cpp';

    Separator:
        match: /\,/;
        name: 'operator.character.separator.coffee';
