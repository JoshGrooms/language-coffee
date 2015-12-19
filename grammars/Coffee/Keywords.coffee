# CHANGELOG
# Written by Josh Grooms on 20151218


keywordTypes =
    match: /\b(class|debugger|super|this)\b/;
    name: 'keyword.type.coffee';

keywordControls =
    match:
        ///\s*\b(
            break       |
            catch       |
            continue    |
            do          |
            else        |
            finally     |
            for         |
            if          |
            new         |
            return      |
            switch      |
            then        |
            try         |
            unless      |
            until       |
            when        |
            while
        )\b///;
    name: 'keyword.control.coffee';

keywordOperators =
    match:
        ///\s* \b(
            and         |
            delete      |
            by          |
            extends     |
            in          |
            instanceof  |
            is          |
            isnt        |
            loop        |
            not         |
            of          |
            or          |
            throw       |
            typeof
        )\b///;
    name: 'operator.word.coffee';

keywordQualifiers =
    match:
        ///\b(
            !important
        )\b///;
    name: 'keyword.qualifier.coffee';

module.exports =
    [
        keywordControls,
        keywordOperators,
        keywordQualifiers,
        keywordTypes,
    ];
