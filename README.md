# Telepítési dokumentáció

Készítette: [Vajda Máté Csaba](https://github.com/csipetcsabi)

Homework for create Highway Vignette.

## APK telepítése  [Download APK](release/app-release.apk)

    - A release mappába  megtalálható az app-release.apk fájl, amit fel tudsz tölteni a telefonodra. (fentil link)
    - Indítás után az alkalmazás próbál csatlakozni a localhost:8080-ra, ahol
     sikertelen csatlakozás-t követően, egy dialog-ban javíthatod a server IP-t.

## Build + run
    - flutter pub get  (dependenciák letöltése)
    - flutter run (futtatás)

    (Az alkalmazás android és windows alkalmazásként futtatható)  

## Alkalmazás módosítása

    - flutter pub get  (dependenciák letöltése)
    - flutter pub run build_runner build --delete-conflicting-outputs (kód generálás)
    - flutter pub run easy_localization:generate --source-dir ./assets/lang (nyelvi elemek generálása)
    - flutter pub run easy_localization:generate -S assets/lang -f keys -o locale_keys.g.dart (nyelvi kulcsok generálás)


# Javaslatok

### Ui:
    - Icon és app név beállítása 
    - Dark theme hozzáadása
    - Képernyők scrollozhatósága, hogy fektetve is használható legyen

### Code:
    - Vaktérképet általánossá tenni, nem dedikáltan csak a Magyarország térképét használni
    - Vaktérképet kiszerverezni, akár a /packages mappába mint önálló csomag
    - swagger_parser -t configurálni: api Client név, folders, postfix ...
    - Létrehozott TextStyle -okat hozzárendelni a TextTheme-hoz
    - Hibák kezelése
    - Formattereket használni, pl pénznem
    - county_vignette_page átírása bloc-ra
    - bloc-okat injektálni
    - PageShell-t megszüntetni, háttérszín más az oldalaknál és ez AppBar-nál is kiütközik
    - Unit test, Integration test írása

#### Hibák:
    - Success oldalról back-el való visszalépés hibás, nem a home-ra tér vissza



