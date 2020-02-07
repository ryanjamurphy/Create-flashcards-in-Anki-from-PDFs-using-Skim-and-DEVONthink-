# Create flashcards from PDF highlights using Skim (and DEVONthink)

I created this script to help automate the creation of flash cards while I was studying for my PhD comprehensive exams. I'm happy to report that something must have worked, as I passed in May 2019.

Two versions of the core script are included here. Both do the same basic thing:
- Take a PDF
- Scan the PDF for highlights
- For each highlight found, import the highlight, its paragraph, and some metadata into an Anki flash card.

The basic version simply uses PDFs found on your file system. The second version uses DEVONthink (described below) to provide a link directly to the page of the relevant PDF—useful when you're extracting highlights from a long article or even a textbook!

## Applications used

The script uses three applications on macOS:

- [Anki](https://apps.ankiweb.net)
  - Anki is a robust flashcard app. It allows you to create flash cards with any kind of content on them, and you can customize card and deck metadata and style to your tastes.
- [Skim](https://skim-app.sourceforge.io)
  - Skim is a free, powerful PDF tool for macOS. It lets you do a lot more with your PDF files than conventional PDF apps. In this use case, it provides a scriptable interface for us to extract highlights and paragraphs from target PDFs in order to create flash cards.
- [DEVONthink](https://devontechnologies.com)
  - DEVONthink is a database software that makes managing a lot of files, notes, annotations, and more easy. In this use case, I used DEVONthink to create links on each flash card I created directly to the page of the relevant PDF.

## How to use this script

### Install the apps
First, install Anki and Skim—and DEVONthink if you want to use that version of the script.

### Download the scripts and template deck
Download the files in this directory by clicking the green `Clone or download` button above, and then selecting `Download ZIP`.

### Install the Anki note type and card templates
Open Anki. Click `File → Import`, and select `Template deck for highlights extracted from PDFs.apkg`. This will import a deck with one sample card to your Deck list. In addition, it will import the Note Type compatible with the extracted highlights and a styled flashcard that features the relevant components for each card.

### Run the script on a PDF with highlighted text
Watch the magic happen. (If Anki isn't already open when you run the script, you may get a "Anki is not open"-type error, requiring you to run the script again.)

Anki will prompt you with some settings on import. A few notes:
- Make sure that the Type is `Article Highlights review`
- You can import the highlights into the same deck or create a new deck. I recommend creating a new deck for each reading, just for organization's sake.
- Make sure that the field separator is the "pipe" (`|`).
- Field **1** should be mapped to **Paragraph**.
- Field **2** should be mapped to **Highlight**.
- Field **3** should be mapped to **Document info**.
- Field **4** should be mapped to **File path**.

You can close the PDF in Skim after it the import is completed. No need to save the file.

### Study up!
That's it. Good luck and/or have fun!

## Misgivings
### Why didn't you use clozes?
When I created this script, I was new to Anki. If you're not new, you'll know that Anki has a built-in Cloze functionality. I didn't realize this when I created this script, and I used `<mark>` HTML to indicate extracted highlights instead. I regret the error, as the Cloze feature works better than my brute-force approach. Maybe I'll fix this in the future—or let me know if you get to it first!

### Isn't automatic flashcard creation a poor approach to studying?
It's true. The best way to learn using flash cards probably involves the following steps:
1. Carefully read the text.
2. Select the important concepts in the text.
3. Identify a variety of questions and answers about those concepts.
4. Write up each of those questions and answers.

That's right—the approach above doesn't even necessarily involve flash cards. Deep reading and self-directed inquiry about whatever you're learning is really what's important. Flash cards simply help reinforce your memory on whatever concepts you represent in them.

As my studies progressed I found myself manually creating flash cards more often than I automatically generated them using this tool. Still, there's something nice about making something useful from all those highlights. If you're new to flash cards, this might be a nice way to generate a bunch from something you've read. As you study the auto-generated cards, I advise you to re-create them, maybe creating multiple for each card. This way you get the best of both worlds.
