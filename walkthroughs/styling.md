
# Intro to CSS

Topics:

1. Advice on Learning CSS
2. Big concepts in CSS
3. CSS demo: styling the robot index page



## Advice on Learning CSS

- Set aside time to invest practicing CSS (labs, side projects)
- Build it yourself to develop your understanding
- Once you build a foundation, it gets much easier
- Approach CSS as a developer, not just as a designer (build ugly designs with clean code)
- Prioratize usability over aesthetics
  


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

Examples: 

```html

    <!-- Inline -->
    <div style="color:red">Content</div>    

    <!-- Style Sheet -->

    <head>
        <style>
            /* Options: */
            #red-id {
                color: red
            }
            .red-class {
                color: red
            }
            div {
                color: red
            }
        </style> 
    </head>
    <body>
        <div class="red-class" id="red-id"> Content</div>
    </body>
```

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
- Flexbox (for 1D layouts) and Grid (for 2D layouts)

### Accessible Design

Design that works no matter how the user accesses your content.

Some guidelines:

- Use image alt text
- Use approprate levels of contrast.
- Use semantic HTML tags / generally don't display site content exclussively by css.
- Don't remove focus styles



## CSS demo: styling the robot index page

We'll be working on the index page styling, which we'll keep in `application.css` and `robot-index.css`

### Making Cards

- Box Model: content, padding, border, margin.
- Make your life easier with `*{ box-sizing: border-box }`
- Spice things up with `border-radius` and `box-shadow`.

### Adding Colors and Fonts

- Color: `color`, `background`, `border`, `box-shadow`
- Font: `font-family`, `font-size`, `font-style`, `font-weight`, `text-decoration`, `text-align`
- Use external tools to generate CSS values (Coolors, CSS Gradient, Google Fonts)
- Store colors and fonts in variables

### Adding Images

- Have a plan for how you'll deal with images of different proportions.
- Make sure imgages don't get too big. Some options:
  - Set image `width` / `height` relative to parent (top-down sizing)
  - Constrain size with `max-width` / `max-height` (bottom-up sizing)
- Style images with `filter`

### Organizing Elements in the Card

- Flexbox basics ( `display: flex`, `flex-direction`, `justify-content`, `align-items`)
- Nest flexboxes to make simple 2d arrangements (though in many cases you'll be better served using grid instead)
- Useful flex child attributes: `align-self`, `flex-grow`, `flex-shrink`

### Arranging the Cards

- Responsive arrangement with `flex-wrap: wrap`. 

### Building a Button

- Use pseudo selectors like `:hover`, `:active`, and `:focus` to respond to user interaction.
- Perform various transformations on elements using the `transform` attribute.
- Animate between two states using the `transition` attribute.

### Building a Status Bar

- Overlay elements by pairing a `position: relative` parent with a `position: absolute` child.
- Position elements using `top`, `bottom`, `left`, `right`, and the `translate` transformation.
- Use `calc` to mix and match different unit types.
- Render visuals dynamically using inline styling.
