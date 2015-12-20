# CHANGELOG
# Written by Josh Grooms on 20151218


commentBlock =
    begin: /\#\#\#/;
    beginCaptures: 'comment.block.open.coffee';
    contentName: 'comment.block.content.coffee';
    end: /\#\#\#/;
    endCaptures: 'comment.block.close.coffee';

# COMMENTLINE - Captures any valid single-line comment in Stylus.
commentLine =
    match: '(?<!\\\\)\\#[^\\{].*';
    captures:
        1: name: 'comment.line.open.coffee';
        2: name: 'comment.line.content.coffee';
    name: 'comment.line.coffee';
# COMMENTSECTION - Captures comments that are intended to denote broad sections of code.
commentSection =
    match: /(\#\#)(.*)(\#\#)\r?\n/;
    captures:
        1: name: 'comment.section.open.coffee';
        2: name: 'comment.section.title.coffee';
        3: name: 'comment.section.close.coffee';
    name: 'comment.section.coffee';



## DOCUMENTATION COMMENTS ##
docSyntax =
    match: /^\s*\#\s*SYNTAX/;
    name: 'comment.documentation.syntax.coffee';

docOutput =
    match: /^\s*\#\s*OUTPUT[S]?/;
    name: 'comment.documentation.output.coffee';

docInput =
    match: /^\s*\#\s*INPUT[S]?/;
    name: 'comment.documentation.input.coffee';

docProperties =
    match: /^\s*\#\s*PROPERTY|PROPERTIES/;
    name: 'comment.documentation.properties.coffee';

docContent =
    match: /^\s*\#.*/;
    name: 'comment.documentation.content.coffee';

# DOCUMENTATION - Captures any documentation comments written according to my personal standard.
documentation =
    begin:
        ///
            ^\s* (\#) \s*
            ( [A-Z0-9_]+ ) \s*
            (?:
                \- \s*
                ([^\r\n]*)
            )?
            $
        ///;
    beginCaptures:
        1: name: 'comment.documentation.open.coffee';
        2: name: 'comment.documentation.title.coffee';
        3: name: 'comment.documentation.summary.coffee';
    contentName: 'comment.documentation.content.coffee';
    end:
        ///
            ^\s* (?! [\s\#] )
        ///;
    endCaptures:
        0: name: 'comment.documentation.close.coffee';
    name: 'comment.documentation.coffee';
    patterns:
        [
            docSyntax,
            docOutput,
            docInput,
            docProperties,
            docContent
        ];



# Ordering is important here
module.exports =
    [
        commentBlock,
        commentSection,
        documentation,
        commentLine
    ];
