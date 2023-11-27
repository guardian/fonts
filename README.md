# Fonts

> Fonts for the Guardian’s digital platforms.

## License

The font files in this repo and the CDN URLs at which they are hosted may only be used for Guardian websites or apps. No one is licensed to use them anywhere else.

All fonts are the property of Schwartzco, Inc., t/a Commercial Type (https://commercialtype.com/), and may not be reproduced without permission.

See the [Commercial Type EULA](legal/Commercial%20Type%20EULA%20Web-general.pdf) for full details.

## CDN

All of the files in the [`fonts/web`](fonts/web) directory are available from `https://assets.guim.co.uk/static/frontend/fonts/`.


# Using fonts on Web

## 👍 Recommended `@font-face` rules

You can see/copy-and-paste a complete example of the recommended rules in [`fonts/web/font-faces.css`](fonts/web/font-faces.css).

These are based on the Source typography guidelines and map to the helpers in [`@guardian/source-foundations`](https://guardian.github.io/csnx/?path=/docs/source-foundations_typography--docs).

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

🚨 Seriously, this method is the least performant and _not_ what you should use for public-facing production code!

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

The cache control value for the font files is set to `max-age=315360000; immutable` (fresh for 10 years).


# Using Fonts on iOS

## Adding the Swift Package To Xcode

To add the `GuardianFonts` Swift Package to your project, follow these steps:

1. Open your project in Xcode.

2. Go to `File` > `Swift Packages` > `Add Package Dependency...`.

3. In the search bar, enter the URL `https://github.com/guardian/fonts.git` click `Next`.

4. Select the version rule that suits your needs, then click `Next`.

5. Choose the `GuardianFonts` library and click `Finish`.

Now, the `GuardianFonts` Swift Package should be added to your project and you can import it wherever you need it.

## Using in Another Swift Package

If you're developing a Swift Package and want to use `GuardianFonts`, you can add it as a dependency in your `Package.swift` file.

Here's how you can do it:

1. Open your `Package.swift` file.

2. Add `GuardianFonts` to the dependencies array:

```swift
dependencies: [
    .package(url: "https://github.com/guardian/fonts.git", branch: "main")
]
```

3. Add `GuardianFonts` as a dependency for your target:

```swift
targets: [
    .target(
            name: "YourPackageName",
            dependencies: [
                .product(name: "GuardianFonts", package: "fonts")
            ]),
]
```

4. Now, you can import `GuardianFonts` in any Swift file in your package.

## Registration 
Custom fonts are registered differently in Swift Packages due to the lack of an info.plist. 
You should use `GuardianFonts.registerFonts()` function to register the fonts contained in this swift package to use in your application. 

If using this from within another **module**, you can do the registration within the module's `init()` function. 

Otherwise, from within a **project** this can be done within the App Delegate `application(_:willFinishLaunchingWithOptions:)` function.

## Usage

Wherever you want to use the module you can import it using: 
`import GuardianFonts`

### UIKit
This swift package contains a convenience initialiser on UIFont, allowing you to create a font using a GuardianFontStyle in UIKit. 

Example: 
`let font = UIFont(style: .headlineRegular, size: 30)`

### SwiftUI
This swift package contains a modifier on `View`, allowing you to apply a font using a GuardianFontStyle in SwiftUI. 

Example: 
`Text("Hello World").font(.headlineRegular, size: 30, lineHeight: 34, verticalTrim: .standard)`
