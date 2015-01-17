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
response = rj.city params
puts response.raw_body

# mengambil data provinsim jika params kosong maka akan menampilkan seluruh provinsi
params = {'id' => '6'}
response = rj.province params
puts response.raw_body

# mengambil harga 
# cost(origin, destination, weight, courier)
# origin 		ID kota asal
# destination 	ID kota tujuan
# weight 		Berat kiriman dalam gram
# courier 		Kode kurir (jne, pos, tiki)
puts rj.cost(501, 114, 1000, "jne").raw_body

# fungsi untuk mendapatkan API-KEY
puts rj.key

# fungsi untuk mendapatkan base_url
puts rj.base_url
```

Response:
```ruby
# untuk melihat response code
response.code

# untuk melihat header dari response
response.headers

# object respon
response.body

# respon dalam format json
response.raw_body
```

Untuk keterangan lebih lanjut silahkan kunjungi [Dokumentasi RajaOngkir](http://rajaongkir.com/dokumentasi)