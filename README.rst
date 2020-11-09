#####
dpkgs
#####

|License: MIT|

Debian packaging for as-of-now unpackaged software that I personally
use.

Uploaded to `packagecloud.io <https://packagecloud.io/chuahou/dpkgs>`_.

Building
========

Download upstream to build directory using::

	./prepare.sh <package-name> <tag>

This will clone upstream <package-name> at <tag>, copying
<package-name>/debian over appropriately. Then, build by entering
build/<package-name> and running::

	debuild -us -uc -b

Warning
=======

Use my packages at your own risk. Often, the upstreams are rather easy
to install yourself, so these packages are not worth the risk.

.. |License: MIT| image:: https://img.shields.io/badge/License-MIT-yellow.svg
	:target: https://opensource.org/licenses/MIT
