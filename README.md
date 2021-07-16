# Fonts

> Fonts for the Guardian Digital.

## License

The font files in this repo and the URLs below may only be used on Guardian websites or apps. No one is licensed to use them anywhere else.

All fonts are the property of Schwartzco, Inc., t/a Commercial Type (https://commercialtype.com/), and may not be reproduced without permission.

## Usage

### 👍 Recommened `@font-face` rules

You can see/copy-and-paste a complete example of the recommended rules in [`fonts/web/font-faces.css`](fonts/web/font-faces.css).

### 🖋️ Custom `@font-face` rules

All of the files in [`fonts/web`](fonts/web) are available from `https://assets.guim.co.uk/static/frontend/fonts/`.

#### Which version of a font should I use?

You should use the `noalts-not-hinted` version unless you really cannot.

It provides the best balance between character range and file size, and is highly likely to already be in your user’s cache.

#### How do the font file weights map to CSS weights?

| Font name |         CSS         |
| --------- | :-----------------: |
| Light     | `font-weight: 300;` |
| Regular   | `font-weight: 400;` |
| Medium    | `font-weight: 500;` |
| Semibold  | `font-weight: 600;` |
| Semibold  | `font-weight: 600;` |
| Bold      | `font-weight: 700;` |
| Black     | `font-weight: 900;` |

#### Example

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

### 🚨 Using the `font-faces.css` stylesheet

_This method is the least performant and probably **not** what you should be using in production code..._

Add a link to the font-face stylesheet to the page:

```html
<link
	href="https://assets.guim.co.uk/static/frontend/fonts/font-faces.css"
	rel="stylesheet"
/>
```

This will make the following `noalts-not-hinted` versions of the fonts available on the page:

| Typeface                   | font-family                | font-weight | font-style |
| :------------------------- | :------------------------- | :---------: | :--------: |
| **GH Guardian Headline**   | `"GH Guardian Headline"`   |    `300`    |  `normal`  |
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

## Deployment

All of the files in [`fonts/web`](fonts/web) are continuously deployed on a successful build of the main branch.

## Caching

The cache control value for the font files is set to `max-age=315360000` (10 years).
