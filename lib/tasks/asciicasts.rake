namespace :asciicasts do

  desc "Fill database with dummy asciicasts"
  task populate: :environment do

    print "Creating dummy asciicasts..."

    asciicasts = [
      {
        content: "# Учим рельсы

## С жирафиком Рафиком это тааак просто!

[классные ребята](http://spalmalo.com)

```javascript
var s = \"JavaScript syntax highlighting\";
alert(s);
```
"
      },
      {
        content: "1. First ordered list item
2. Another item
⋅⋅* Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
⋅⋅1. Ordered sub-list
4. And another item.

⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).

⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

* Unordered list can use asterisks
- Or minuses
+ Or pluses
        "
      },
      {
        content: "> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.
        "
      },
      {
        content: "Here's our logo (hover to see the title text):

Inline-style:
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png \"Logo Title Text 1\")

Reference-style:
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png \"Logo Title Text 2\"
        "
      },
      {
        content: "```javascript
var s = \"JavaScript syntax highlighting\";
alert(s);
```

```python
s = \"Python syntax highlighting\"
print s
```

```
No language indicated, so no syntax highlighting.
But let's throw in a <b>tag</b>.
```
        "
      }
    ]

    Screencast.find_each do |screencast|
      screencast.create_asciicast asciicasts.sample
    end

    print "done\n"

  end

end