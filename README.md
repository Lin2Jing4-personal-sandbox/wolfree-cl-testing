# Wol[free](https://wolfreealpha.github.io/)Alpha

### Free Wolfram Alpha Step-by-Step Solutions
- [**Try it now**](https://wolfreealpha.github.io/), it's gratis!
- Unlock FREE access to full [Wolfram|Alpha Step-by-Step Solutions](https://www.wolframalpha.com/examples/pro-features/step-by-step-solutions/).
- Facilitate the use of [Wolfram|Alpha Show Steps API](https://products.wolframalpha.com/show-steps-api/documentation/).

### Public instances
- https://wolfreealpha.github.io/

### Building from source
1. Install [Portacle](https://portacle.github.io/).
2. Put [cl-wget.asd](https://github.com/cl-wget/cl-wget/blob/main/cl-wget.asd), [cl-wget.lisp](https://github.com/cl-wget/cl-wget/blob/main/cl-wget.lisp), [wolfree.asd](/), and [wolfree.lisp](/) in the [/portacle/projects/](https://common-lisp.net/project/asdf/asdf.html#Configuring-ASDF) directory.
3. Run [Portacle](https://portacle.github.io/#use).
4. Type in [`(ql:quickload :wolfree)`](https://www.quicklisp.org/beta/#basic-commands) after [`CL-USER>`](https://gigamonkeys.com/book/programming-in-the-large-packages-and-symbols.html#three-standard-packages) and hit [`⏎ Enter`](https://en.wikipedia.org/wiki/Enter_key).
5. Browse http://localhost:8080/.

### Contributing
- Start a [discussion](https://docs.github.com/en/discussions/collaborating-with-your-community-using-discussions/collaborating-with-maintainers-using-discussions) to ask questions and collaborate with maintainers.
- Create an [issue](https://docs.github.com/en/github/managing-your-work-on-github/creating-an-issue) to request new features or report bugs.
- Open a [pull request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/proposing-changes-to-your-work-with-pull-requests) to submit a patch.

### License
AGPL-3.0-or-later
```
    Wolfree gives everyone free access to Wolfram|Alpha Pro.
    Copyright (C) 2021  Lin2Jing4

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
