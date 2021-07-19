# Fonts

> Fonts for the Guardian Digital.

## License

The font files in this repo and the CDN URLs at which they are hosted may only be used by Guardian websites or apps. No one is licensed to use them anywhere else.

All fonts are the property of Schwartzco, Inc., t/a Commercial Type (https://commercialtype.com/), and may not be reproduced without permission.

See the [Commercial Type EULA](legal/Commercial%20Type%20EULA%20Web-general.pdf) for full details.

## CDN

All of the files in the [`fonts/web`](fonts/web) directory are available from `https://assets.guim.co.uk/static/frontend/fonts/`.

## NPM package

For production sites, you can get the recommended `@font-face` rules via the `@guardian/fonts` NPM package:

```shell
$ yarn install @guardian/fonts
```

> See which `font-face` rules are recommended [below](#which-fonts-are-recommended).

It exports the recommended `@font-face` rules as a string of CSS for use in JavaScript, and also  provides them in a CSS file and a Sass partial if that's easier for your project.

### Example

#### JavaScript

```js
import { fontFaceCSS } from '@guardian/fonts';

export default `
    <html>
        <head>
            <style>
                ${fontFaceCSS}
            </style>
        </head>
    </html>
`;
```

#### Sass

```scss
@import './node_modules/@guardian/fonts/font-faces';
```

#### Other

```php
/*  e.g. index.php */
<?php
    <style>
        <?php include 'node_modules/@guardian/fonts/font-faces.css'; ?>
    </style>
?>
```

## ⚠️ Stylesheet

_Not for production use!_

If you want quick and dirty access to fonts and performance does not matter, you can link to a stylesheet containing the recommended `font-face` rules directly on a page:

```html
<!-- this is slow - do not use it for production Guardian sites -->
<link
    href="https://assets.guim.co.uk/static/frontend/fonts/font-faces.css"
    rel="stylesheet"
/>
```

🚨 Honestly, this method is the least performant and _not_ what you should be using in production code.

## Which fonts are recommended?

The NPM package and CDN stylesheet will provide you with the recommended `@font-face` rules.

> For the full CSS, see the [`fonts/web/font-faces.css`](fonts/web/font-faces.css) stylesheet.

These rules will make the `noalts-not-hinted` versions of the following fonts available to your page:

| Typeface                   | font-family                | font-weight | font-style |
| :------------------------- | :------------------------- | :---------: | :--------: |
| **Guardian Headline**      | `"GH Guardian Headline"`   |    `300`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `300`    |  `italic`  |
|                            | `"GH Guardian Headline"`   |    `400`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `400`    |  `italic`  |
|                            | `"GH Guardian Headline"`   |    `500`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `500`    |  `italic`  |
|                            | `"GH Guardian Headline"`   |    `600`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `600`    |  `italic`  |
|                            | `"GH Guardian Headline"`   |    `700`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `700`    |  `italic`  |
|                            | `"GH Guardian Headline"`   |    `900`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `900`    |  `italic`  |
| **Guardian Text Egyptian** | `"GuardianTextEgyptian"`   |    `400`    |  `normal`  |
|                            | `"GuardianTextEgyptian"`   |    `400`    |  `italic`  |
|                            | `"GuardianTextEgyptian"`   |    `500`    |  `normal`  |
|                            | `"GuardianTextEgyptian"`   |    `500`    |  `italic`  |
|                            | `"GuardianTextEgyptian"`   |    `700`    |  `normal`  |
|                            | `"GuardianTextEgyptian"`   |    `700`    |  `italic`  |
|                            | `"GuardianTextEgyptian"`   |    `900`    |  `normal`  |
|                            | `"GuardianTextEgyptian"`   |    `900`    |  `italic`  |
| **Guardian Text Sans**     | `"GuardianTextSans"`       |    `400`    |  `normal`  |
|                            | `"GuardianTextSans"`       |    `400`    |  `italic`  |
|                            | `"GuardianTextSans"`       |    `500`    |  `normal`  |
|                            | `"GuardianTextSans"`       |    `500`    |  `italic`  |
|                            | `"GuardianTextSans"`       |    `700`    |  `normal`  |
|                            | `"GuardianTextSans"`       |    `700`    |  `italic`  |
|                            | `"GuardianTextSans"`       |    `900`    |  `normal`  |
|                            | `"GuardianTextSans"`       |    `900`    |  `italic`  |
| **Guardian Titlepiece**    | `"GT Guardian Titlepiece"` |    `700`    |  `normal`  |

## Custom `@font-face` rules

If the recommended rules are not appropriate for your project, you can use any of the font files from the CDN.

### Which version of a font should I use?

You should use the `noalts-not-hinted` version unless you really cannot.

It provides the best balance between character range and file size, and is highly likely to already be in your user’s cache.

### How do the font file weights map to CSS weights?

| Font name |         CSS         |
| --------- | :-----------------: |
| Light     | `font-weight: 300;` |
| Regular   | `font-weight: 400;` |
| Medium    | `font-weight: 500;` |
| Semibold  | `font-weight: 600;` |
| Semibold  | `font-weight: 600;` |
| Bold      | `font-weight: 700;` |
| Black     | `font-weight: 900;` |

### Example

```css
@font-face {
    font-family: 'GuardianTextEgyptian';
    src: url('https://assets.guim.co.uk/static/frontend/fonts/guardian-textegyptian/noalts-not-hinted/GuardianTextEgyptian-Regular.woff2')
            format('woff2'),
        url('https://assets.guim.co.uk/static/frontend/fonts/guardian-textegyptian/noalts-not-hinted/GuardianTextEgyptian-Regular.woff')
            format('woff'),
        url('https://assets.guim.co.uk/static/frontend/fonts/guardian-textegyptian/noalts-not-hinted/GuardianTextEgyptian-Regular.ttf')
            format('truetype');
    font-weight: 400;
    font-style: normal;
    font-display: swap;
}
```

## Deployment

### Assets

All of the files in [`fonts/web`](fonts/web) are continuously deployed to the CDN after a successful build of the main branch.

### `@guardian/fonts`

To release a new version of the NPM package, run:

```shell
$ yarn release
```

## Caching

The cache control value for the font files is set to `max-age=315360000` (10 years).
