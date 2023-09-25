# -*- coding: utf-8 -*-
import os
from service import application

if __name__ == "__main__":

    config = {
        "production": "service.config.ProductionConfig",
        "development": "service.config.DevelopmentConfig",
        "staging": "service.config.StagingConfig",
        "testing": "service.config.TestingConfig",
        "default": "service.config.DevelopmentConfig"
    }

    config_name = os.getenv('SASG_ENV', 'default').lower()
    application.config.from_object(config[config_name]) # object-based default configuration

    print("ENV: ", config_name)

    #application.run(host='0.0.0.0', use_reloader=False)
    application.run(host='0.0.0.0', threaded=True)
