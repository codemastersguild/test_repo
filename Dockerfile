# Gunakan image resmi Golang sebagai base image
FROM golang:1.20.2-buster as builder

# Set variabel lingkungan GOPATH
ENV GOPATH /go

# Menyalin kode aplikasi Anda ke dalam container
COPY . /go/src/app
WORKDIR /go/src/app

# Menginstal dependensi dan mengkompilasi aplikasi
RUN go get -d -v ./...
RUN go build -o app

# Port yang akan digunakan oleh aplikasi
EXPOSE 9000

# Perintah untuk menjalankan aplikasi ketika container berjalan
CMD ["./app"]