# Fonts

> Fonts for the Guardian’s digital platforms.

## License

The font files in this repo and the CDN URLs at which they are hosted may only be used for Guardian websites or apps. No one is licensed to use them anywhere else.

All fonts are the property of Schwartzco, Inc., t/a Commercial Type (https://commercialtype.com/), and may not be reproduced without permission.

See the [Commercial Type EULA](legal/Commercial%20Type%20EULA%20Web-general.pdf) for full details.

## CDN

All of the files in the [`fonts/web`](fonts/web) directory are available from `https://assets.guim.co.uk/static/frontend/fonts/`.

## 👍 Recommended `@font-face` rules

You can see/copy-and-paste a complete example of the recommended rules in [`fonts/web/font-faces.css`](fonts/web/font-faces.css).

These are based on the Source typography guidelines and map to the helpers in [`@guardian/src-foundations/typography`](https://theguardian.design/2a1e5182b/p/95d5d0-code).

They will make the following typefaces and font variants available on the page:

| Typeface                   | font-family                | font-weight | font-style |
| :------------------------- | :------------------------- | :---------: | :--------: |
| **Guardian Headline**      | `"GH Guardian Headline"`   |    `300`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `300`    |  `italic`  |
|                            | `"GH Guardian Headline"`   |    `500`    |  `normal`  |
|                            | `"GH Guardian Headline"`   |    `500`    |  `italic`  |
|                            | `"GH Guardian Headline"`   |    `700`    |  `normal`  |
| **Guardian Text Egyptian** | `"GuardianTextEgyptian"`   |    `400`    |  `normal`  |
|                            | `"GuardianTextEgyptian"`   |    `400`    |  `italic`  |
|                            | `"GuardianTextEgyptian"`   |    `700`    |  `normal`  |
|                            | `"GuardianTextEgyptian"`   |    `700`    |  `italic`  |
| **Guardian Text Sans**     | `"GuardianTextSans"`       |    `400`    |  `normal`  |
|                            | `"GuardianTextSans"`       |    `400`    |  `italic`  |
|                            | `"GuardianTextSans"`       |    `700`    |  `normal`  |
|                            | `"GuardianTextSans"`       |    `700`    |  `italic`  |
| **Guardian Titlepiece**    | `"GT Guardian Titlepiece"` |    `700`    |  `normal`  |

_Note that some web font formats compress better than others (e.g. `woff2` is much smaller than `ttf`). Therefore, not all characters are available on every platform._

_You may notice less common characters are rendered in a different, fallback font, particularly on older browsers._

_This is deliberate in order to balance performance and design fidelity with technical constraints._

### ⚠️ Stylesheet

_Not for production use!_

If you want quick and dirty access to fonts and performance does not matter, you can link to a stylesheet containing the recommended `font-face` rules directly on a page:

```html
<!-- this is slow - do not use it for production Guardian sites -->
<link
    href="https://assets.guim.co.uk/static/frontend/fonts/font-faces.css"
    rel="stylesheet"
/>
```

🚨 Seriously, this method is the least performant and _not_ what you should be using in production code.

## Custom `@font-face` rules

If the recommended rules are not appropriate for your project, you can use any of the font files from the CDN.

> Be certain you _need_ custom fonts. Your users almost definitely have the recommended fonts already in their cache. Using the recommended fonts will ensure your users see your content and designs _much_ sooner.

### Which version of a font should I use?

You should use the `noalts-not-hinted` version, unless you really cannot.

It provides the best balance between character range and file size.

### How do the font file weights map to CSS weights?

| Font name |         CSS         |
| --------- | :-----------------: |
| Light     | `font-weight: 300;` |
| Regular   | `font-weight: 400;` |
| Medium    | `font-weight: 500;` |
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

All of the files in the [`fonts/web`](fonts/web) directory are continuously deployed on a successful build of the main branch.

## Caching

The cache control value for the font files is set to `max-age=315360000` (10 years).
