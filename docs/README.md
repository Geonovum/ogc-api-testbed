# Documentation Website

The PGC API Testbed [website](https://apitestdocs.geonovum.nl) is powered
by [MkDocs](https://www.mkdocs.org) which facilitates easy management
of website content and publishing.

## Setting up the website environment locally

```bash
# build a virtual Python environment in isolation
python3 -m venv apitestdocs-website
cd apitestdocs-website
# download the website from GitHub
git clone https://github.com/geonovum/ogc-api-testbed.git
cd ogc-api-testbed/docs
# install required dependencies
pip install -r requirements.txt
# build the website
mkdocs build
# serve locally
mkdocs serve  # website is made available on http://localhost:8000/
```

## Content Management Workflow

### Overview

To manage content you require an account on GitHub.  From here you can either
1. fork the repository, make your own changes and issue a pull request, or 2.
edit the content directly.  For option 2 the necessary permissions are required.

The basic workflow is as follows:

- manage content
- commit updates
- publish to the live site

### Adding a page

```bash
vi docs/new-page.md  # add content
vi mkdocs.yml  # add to navigation section
# edit any other files necessary which may want to link to the new page
git add docs/new-page.md
git commit -m 'add new page on topic x' docs/new-page.md mkdocs.yml
git push origin master
```

### Updating a page

```bash
vi content/page.md  # update content
git commit -m 'update page' content/page.md
git push origin master
```

## Publishing updates to the live site

Website updates are automatically published via GitHub Actions, but just in case:

```bash
# NOTE: you require access privileges to the GitHub repository
# to publish live updates
mkdocs gh-deploy -m 'add new page on topic x'
```
