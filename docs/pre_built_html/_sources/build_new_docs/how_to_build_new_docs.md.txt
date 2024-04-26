# How to Update Documentation

This documentation is generated using the [Sphinx build system](https://www.sphinx-doc.org/en/master/tutorial/index.html) to build an HTML, copied to a specific directory, and published to a ReadTheDocs website. The backend ReadTheDocs has been configured for you, and it will check on each push of the `master` branch if it is necessary to update the documentation. Familiarizing yourself with the build system of Sphinx is a must before progressing forward.

As an additional note, there is a great guide on using MyST as the language for Sphinx to read. [MyST overview ](https://myst-parser.readthedocs.io/en/latest/index.html) is a great guide on how the language works and how to reference and build the documentation. 

If you want to update the documentation, you need to follow the steps below:

1. Make necessary changes to docstrings. These follow the Google Python style guide. You'll find these littered throughout the codebase, and you likely are already familiiar with them.
2. Make sure docstrings are referenced within the `docs/source` directory using reStructuredText. You'll need to familirize yourself with the Sphinx build system if you have added additional classes/functions/nodes to the codebase.
3. Go to the `docs` directory and run `make html`. This will build the HTML documentation in the `docs/build` directory.
4. Copy the contents of the html to the `docs/pre_build_html`

The ReadTheDocs has a webhook connected to the repository, and it will automatically update the documentation on each push to the `master` branch. Again, this is all built off of the `docs/source` rst files from the `index.rst` file. Sphinx has some great tutorials so I recommend using that to change the repository.
