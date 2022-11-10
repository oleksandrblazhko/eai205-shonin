class User:
    def __init__(self, user_id, name, surname, nickname):
        self.user_id = user_id
        self.name = name
        self.surname = surname
        self.nickname = nickname

    def name_change(self):
        self.name = input("Введіть новій нікнейм: ")
        return self.nickname


class Tracks:
    def __init__(self, track_name):
        self.track_name = track_name
        self.album_name = "null"
        self.track_date = 0
        self.termination = 0

    def create_album(self):
        album_name = input("Введіть назву альбому")
        track_date = input("Дата випуску ")
        termination = input("Тривалість")
        return track_date, termination, album_name

    def data_change(selfself):
        self.track_date = input("Нова дата треку")
        return self.track_date

    def termination_change(self):
        self.termination = input("Новий тривалість")
        return self.termination

    def album_change(self):
        self.album_name = input("Нова назва альбому")
        return self.album_name

    def track_info(self):
        return self.track_name, self.track_date, self.album_name, self.termination

    def machine_check(self):
        return self.track_info

class Final(User):

    def create_description(self):
        description = input("Введіть опис треку: ")
        return print(description)

