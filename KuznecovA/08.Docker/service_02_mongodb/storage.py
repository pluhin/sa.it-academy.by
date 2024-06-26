from pymongo import MongoClient

class MongodbService(object):
    _instance = None
    _client = None
    _db = None

    @classmethod
    def get_instance(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls, *args, **kwargs)
            cls.__init__(cls._instance, *args, **kwargs)
        return cls._instance

    def __init__(self):
        self._client = MongoClient("localhost", 27017)
        self._db = self._client.youtube_db

    def get_data(self):
        return list(self._db.statistics.find())

    def save_data(self, dto):
        return self._db.statistics.insert_one(dto)
