name             'selenium-grid'
maintainer       'Quoin Inc.'
maintainer_email 'pavel.nabutovsky@quoininc.com'
license          'All rights reserved'
description      'Installs/Configures Selenium'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

supports 'debian'
supports 'ubuntu'

depends 'xvfb'
depends 'x11vnc'
depends 'java'
depends 'quoin'