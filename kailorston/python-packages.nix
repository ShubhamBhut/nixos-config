{ pkgs }:

pkgs.python311.withPackages (p: with p; [
  pyqt6
  pytest
  mutagen
  flake8
  pip 
  charset-normalizer
  aiohttp # async HTTP
  beautifulsoup4 # web scraping
  ipython # interactive shell
  jupyter # interactive notebooks
  matplotlib # plots
  numpy # numerical computation
  pandas # data analysis
  pylint # static checking
  pwntools
  levenshtein
  requests # HTTP library
  setuptools # setup.py
  neo4j
  psycopg2
  pygraphviz
  python-dotenv
  mysql-connector
  pyrituals
  black
  debugpy
  adblock
  # streamlit
  redis
  flask
  flask-caching
  torchvision
  scikit-learn
  jaxlib
  jax
  # flax
  equinox
  transformers
  datasets
  faker
  numba
  networkx
])
