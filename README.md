## This is gem for Haml support for jQuery plugin [role](https://github.com/kossnocorp/role) by [@kossnocorp](https://github.com/kossnocorp)

Sponsored by [Evil Martians](http://evilmartians.com/).

## Usage

`app/views/home/index.html`

```haml
%a@some-role@another-role...
```

Will produce:

```html
<a role='some-role another-role'...
```

## Install

In your `Gemfile`:

`gem 'role-haml'`

## Contributors

* [@kossnocorp](http://github.com/kossnocorp)
* @gazay

## License

MIT (look into repo LICENSE)

# jQuery plagin role readme

This project uses [Semantic Versioning](http://semver.org/) for release numbering.

## Downloads

* [jquery.role.min.js](https://raw.github.com/kossnocorp/role/master/lib/jquery.role.min.js)
* [role.min.js](https://raw.github.com/kossnocorp/role/master/lib/jquery.role.min.js)
* [jquery.role.js](https://raw.github.com/kossnocorp/role/master/lib/jquery.role.js)
* [role.js](https://raw.github.com/kossnocorp/role/master/lib/role.js)

Also you can add jquery.role.js and role.js by bundle `role-rails` gem. For futher details see *installation* section below.

## Use `role` attribute FTW

```
Use cases for a role attribute for HTML5, include:

* accessibility,
* device adaptation,
* server-side processing, and
* complex data description.
```

This is a quote from [W3C Specification on Role attribute](http://www.w3.org/wiki/PF/XTech/HTML5/RoleAttribute#A_Role_Attribute_for_HTML5).

In [Evil Martians](http://evilmartians.com/) we came up with a way to use this attribute for our own purposes.

Say you have to update your website page design. HTML markup is done and you have to apply it to the existing site. Of course this marvelous page is crammed with Javascript code tied to an existing structure.

``` javascript
$('.list .item img')
    .mouseenter(function () {
        $(this).rotateTo(30, 300)
    })
    .mouseleave(function () {
        $(this).rotateTo(0, 300)
    });
```

Obviously, you'll have to rewrite all the selectors for the new layout. And it would be nice if you had to fix only one (or even ten) of these selectors. In reality, most likely, there will be several dozen of them.

Another issue is that refactoring process requires you to change the names or a number of classes. You'll have to muddle through every JS file to find all classes you are going to change.

And, of course, in both cases the end result is absolutely unpredictable, because layout alone is not enougn to figure out if a class is actualy used in JS.

The `.js-class_name` prefix use may seem like a good idea, except that someone will surely add styles to this class in a future... Let alone the difficulty to spot, among a large of number of classes, one with a prefix.

In order to avoid this problems, we can "attach" JS to DOM elements by a `role` attribute.

It's a lot safer then prefixes, beacause it's much harder to attach styles to `role` and it feals morally difficult to break the `role` use convention.

With the use of `role`, layout update becomes very straightforward: you just have to add roles to a new element, and if you are not tied to the "magic numbers" -- it will work with no further hassle.

To make life easier (shoutout to [@alex_chrome](https://twitter.com/#!/alex_chrome) for the great idea) we also extended jQuery selector syntax:

``` javascript
$('@list @item @image')
    .mouseenter(function () {
        $(this).rotateTo(30, 300)
    })
    .mouseleave(function () {
        $(this).rotateTo(0, 300)
    });
```

`$('@list @item @image')` is the same as `$('[role="list"] [role="item] [role="image"]')` and you can use "multirole": `$('@list@coupons')`.

In addition to the jQuery plug-in, I also wrote a version that extends `querySelectorAll` of [Zepto.js](http://zeptojs.com/) with a Role functionality.

Using of 'role' in a query may work a bit slower compared to usual selectors, but it's neglectable even in a large number of queries.

In addition to `role`, I sometimes use `id`, but only in very extraodinary cases — because if there is only single element on a page today, it may happen that there will be a few tomorrow, even if that wasn't planned.

## Usage

### Using selectors

You can use shortcut `@` in jQuery selectors to find elements with roles.

Will select all elements in document with `role="ajax-link"`:

``` js
$('@ajax-link')
```

Also you can combinate roles:

`<form role="form login_form"></form>`:

``` js
$('@form@login_form')
```

Will select all forms with "form" as role `<form role="form login_form"></form><form role="form registration_form"></form>`:

``` js
$('@form')
```

You can combine role with other selectors, but that is not recommended:

`<form class="dark" role="login_form" method="post"></form>`:

``` js
$('form.dark@login_form[method=post]')
```
