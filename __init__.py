# -*- coding: utf-8 -*-
"""
 This script initializes the plugin, making it known to QGIS.
"""


def serverClassFactory(serverIface):
    from . serversimplebrowser import ServerSimpleBrowser
    return ServerSimpleBrowser(serverIface)


def classFactory(iface):
    from . serversimplebrowser import SimpleBrowser
    return SimpleBrowser(iface)
