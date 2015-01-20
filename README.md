# Class untuk konsumsi API dari rajaongkir.com

## Requirement
unirest ([unirest ruby] (http://unirest.io/ruby.html))

# Instalasi
gem install rajaongkir

# Cara penggunaan
Request:
```ruby
require "rajaongkir"

rajaongkir = Rajaongkir.new "API-KEY"

# mengambil data city (kota), jika params kosong maka akan menampilkan seluruh kota
params = {'province' => '6'}
response = rajaongkir.city params
puts response.content

# mengambil data provinsi jika params kosong maka akan menampilkan seluruh provinsi
params = {'id' => '6'}
response = rajaongkir.province params
puts response.content

# mengambil harga 
# cost(origin, destination, weight, courier)
# origin 		ID kota asal
# destination 	ID kota tujuan
# weight 		Berat kiriman dalam gram
# courier 		Kode kurir (jne, pos, tiki)
puts rajaongkir.cost(501, 114, 1000, "jne").content

# fungsi untuk mendapatkan API-KEY
puts rajaongkir.key

# fungsi untuk mendapatkan base_url
puts rajaongkir.base_url
```

Response:
```ruby
# untuk melihat response code
response.code

# untuk melihat header dari response
response.headers

# object respon
response.content

# respon dalam format json
response.content.to_json
```

Untuk keterangan lebih lanjut silahkan kunjungi [Dokumentasi RajaOngkir](http://rajaongkir.com/dokumentasi)