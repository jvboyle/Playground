# -*- coding: utf-8 -*-
import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True
    WTF_CSRF_ENABLED = True
    PERMANENT_SESSION_LIFETIME = 60 * 60 * 24 * 30
    SECRET_KEY = 'nP6Ff7XeRsCjHgc03DU8q03m7TRwTVnF'

    MAIL_DEFAULT_SENDER = 'noreply@us.ibm.com'

class ProductionConfig(Config):
    DEBUG = False

class StagingConfig(Config):
    DEVELOPMENT = True
    DEBUG = True

class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True

class TestingConfig(Config):
    TESTING = True
