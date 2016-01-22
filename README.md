# <a href="#" id="top"></a>leaf-typography

[![Build]](https://circleci.com/gh/leafui/leaf-typography/tree/master) [![SemVer]](http://semver.org/)
[![License]](LICENSE)

[![Tests](https://saucelabs.com/browser-matrix/leafui.svg)](https://saucelabs.com/u/leafui)

Part of the core of the Leaf UI.

A basic typography reset and useful classes to use as base on a web project. It tries to keep up with best practices in web typography such as vertical rhythm and proper line length.

## <a href="#" id="install"></a>Install

We recommend using [Bower](http://bower.io/) to manage front-end dependencies:

`bower install leaf-typography`

If you don't use bower you can manually use it by just grabbing the file inside the `dist` folder.

Also available on [NPM](http://npmjs.com):

`npm install leaf-typography`

## <a href="#" id="impl"></a>Details on implementation

### Leaf philosophy

As with other Leaf core components this one is written in SCSS and uses [hyphenated BEM](http://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/) syntax. Please check the [CONTRIBUTING](CONTRIBUTING.md) guide for info on code style.

### Vertical Rhythm?

One should try to keep the spacing between lines and text elements uniform. It's called [vertical rhythm](). `leaf-typography` cannot guarantee that every element on your page will follow that, but it's designed to help achieving it.

### No typeface?

`leaf-typography` does not come with a pre-chosen typeface. You must provide your own. The concepts here presented must work with any typeface.

One once said that **"Choosing a typeface is not typography"**.

## <a href="#" id="usage"></a>Usage

### The default elements

`leaf-typography` comes with the default headings `h1` to `h6` are properly styled to follow a consistent [ratio of growth]() in font-size.

So you can just use them as usual and get the results.

Also, `p` and table elements has a good consistent margin and line-height by default.

### .lf-text and .lf-type

Those are special types of classes that come with `leaf-typography`.

The `.lf-text` classes refer to the **text** attributes such as the **text** color and **text** size.

On the other hand, `.lf-type` classes refer to the **typeface** attributes such as the **font** style and weight.

By default any text block renders with the following properties:
  - The font color is **dark** and must be visible in light backgrounds.
  - The font weight is **normal** and the font version used is **regular**.
  - The letter spacing is the one provided by the font.

Both class types come with modifiers that you can use to change the rendering:

  - Modifiers for `.lf-text`:
    - `.lf-text--light`: indicates that the text background is dark, therefore the text must be white or a **light** color.
  - Modifiers for `lf-type`:
    - `.lf-type--condensed`: lower the default letter spacing in the font. Useful for large headings.
    - `.lf-type--light`: uses a thinner version of the font if available.
    - `.lf-type--bold`: uses the bold version of the font.
    - `.lf-type--italic`: uses the italic version of the font.

### The special element .lf-text__block

This class assures the block will have a maximum length suitable for optimal line reading.

```html
<div class="lf-text__block">
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum vehicula commodo. In id augue quam. Cras non maximus purus. Donec auctor sapien purus. Donec malesuada mi facilisis pretium feugiat. Phasellus vestibulum massa a nisi tempus, at sodales enim dapibus. Maecenas et sapien nec ex sodales aliquet sit amet sed tortor. Sed ac elit urna. Curabitur eu ipsum nibh. Ut in augue hendrerit, feugiat erat eget, congue quam.
</p>
<p>
  Nunc in vestibulum quam. Pellentesque a tempus eros. Praesent sed est leo. Nullam efficitur ac est eget aliquam. In non purus nec enim finibus rutrum. Morbi porta, ipsum nec dapibus finibus, mi eros tincidunt purus, ut finibus lorem mi sed augue. Vivamus molestie ex vel metus rutrum, vitae rhoncus magna auctor. Nulla ultrices enim in neque suscipit, non facilisis quam vehicula. Quisque sit amet ligula est. Sed finibus quam id pretium mollis. Donec vehicula magna eu dictum bibendum. Nulla dictum risus non orci tristique porttitor.
</p>
</div>
```

Both paragraphs inside the code block above will have their max-width defined by the `.lf-text__block.`

#### .lf-text__block modifiers

This special class also has its own modifiers, you can use them to change the font-size while keeping the vertical rhythm of the page.

The classes follow the same logic as in HTML headings, the lower the number the larger the font size. There are 9 modifiers provided. Going from `lf-text__block--1` for the largest one to `lf-text__block--9` for the smallest one.

Notice that the smallest one is still larger that the font-size of the original `p`.

Take a look:

```html
<section>
  <h1 class="lf-text__block--1">I'm a extra large heading</h1>
  <p class="lf-text__block--9">I'm a leading paragraph.</p>
  <p>I'm a normal paragraph.</p>
</section>
```

## <a href="#" id="demo"></a>Demo

You can see `leaf-typography` in action by cloning and running the built-in demo located on the `demo` folder.

## <a href="#" id="browsersupport"></a>Browser support

You can use it everywhere as long as it supports font-related CSS, REM and EM CSS units.

We test support on most evergreen browsers with [Sauce Labs](https://saucelabs.com/).

| <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/chrome/chrome_64x64.png" width="32px" height="32px"> | <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/internet-explorer/internet-explorer_64x64.png" width="32px" height="32px"> | <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/firefox/firefox_64x64.png" width="32px" height="32px"> | <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/opera/opera_64x64.png" width="32px" height="32px"> | <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/safari/safari_64x64.png" width="32px" height="32px"> | <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/edge/edge_64x64.png" width="32px" height="32px">  | Android | iOS |
| :---:  |:---:|  :---:  | :---: | :---:  | :---:|  :---:  |:---:|
|   31+  | 9+ |   31+   |  28+  |   7+   |  12+ |   4.1+  |  7+ |

## <a href="#" id="license"></a>License

[MIT License](LICENSE)

[Build]: https://img.shields.io/circleci/project/leafui/leaf-typography/master.svg
[SemVer]: https://img.shields.io/:semver-%E2%9C%93-brightgreen.svg
[License]: https://img.shields.io/github/license/leafui/leaf-typography.svg
