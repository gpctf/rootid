# Polecenia aby uruchomić obraz
## Budowa obrazu
```bash
sudo docker build -t rootid ./
```
## Uruchomienie obrazu
```bash
sudo docker run -p 1000:1000 -e "password=password" -it rootid
```