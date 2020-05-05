
# Intro to CSS

Topics:

1. Advice on Learning CSS
2. Big concepts in CSS
3. CSS demo: styling the robot index page

## Advice on Learning CSS

- 





## Big concepts in CSS

### Some vocabulary

- *HTML* is a markup language, which provides *tags* that allow us to display various kinds of media in a browser.

- *CSS* is a styling language, which provides the means to adjust the appearances of HTML tags.

- To change the appearance of an HTML tag, we make a *declaration*. The declaration targets some *proprty* of a tag and sets its *value*.

### Ways to make declarations

1. Inline: a declaration attaches directly to a specific tag.
2. Style sheet: a declaration attaches to all tags of a certain type, defined using a *selector* (tag, class, id). 
    - Internal: written in the HTML header.
    - External: written in a seperate file, which is linked to the header.

What are the pros and cons of these approaches?

### How CSS works

Key thing to understanding HTML/CSS: HTML tags form a tree and CSS is built to exploit this tree structure.

- Some properties are inherited. By default, children will have the same value as their parent.
- The positioning of an element can depend on its own styles and the styles of its ancesetors.
- CSS selectors can be written to explicitly care about the positions of tags in the tree.

### Specificity

When two declarations would style the attribute of a tag with two different values, what wins? Some rules:

1. Inline styling overrides stylesheets.
2. When using selectors, ID > Class > tag.
3. Being more explicit about tree structure adds to specificity.
4. Later code overrides earlier code.

### Responsive Design

Design the works no matter the screen shape or type that it's viewed on.

Tools:

- Media Queries
- Responsive units (%, vw/vh, rem)
- Flexbox and Grid

### Accessible Design

Design that works no matter how the user access your content.

Some guidelines:

- Use image alt text
- Use approprate levels of contrast.
- Use semantic HTML tags / generally don't display site content exclussively by css.
- Use focus styles




## CSS demo: styling the robot index page




### Making Cards


### Adding Colors and Fonts


### Adding Images


### Organizing Elements


### Arranging the Cards


### Making the Cards Interactive


### Overlaying Elements
