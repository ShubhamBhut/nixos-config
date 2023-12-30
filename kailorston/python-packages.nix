{ pkgs }:

pkgs.python311.withPackages (p: with p; [
  pip 
  aiohttp # async HTTP
  beautifulsoup4 # web scraping
  ipython # interactive shell
  jupyter # interactive notebooks
  matplotlib # plots
  numpy # numerical computation
  pandas # data analysis
  pylint # static checking
  pwntools
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
])
