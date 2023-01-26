#!/usr/bin/python3
"""
Fabric script that generates a tgz archive from the contents of the web_static
folder of the AirBnB Clone repo
"""
import os.path
from datetime import datetime
from fabric.api import local


def do_pack():
    "creates tar gzipped archive"
    dn = datetime.utcnow()
    file = "versions/web_static_{}{}{}{}{}{}.tgz".\
        format(dn.year, dn.month, dn.day,
               dn.hour, dn.minute, dn.second)
    if os.path.isdir("versions") is False:
        if local("mkdir -p versions").failed is True:

            return None
    if local("tar -cvzf {} web_static".format(file)).failed is True:
        return None
    return file
