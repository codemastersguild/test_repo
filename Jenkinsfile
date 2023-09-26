pipeline {
    agent any

    environment {
        GOPATH = '/go'
    }

    stages {
        stage('Checkout') {
            steps {
                // Ambil kode dari repositori Git
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Menggunakan image Golang sebagai alat pembangunan
                container('golang') {
                    // Kompilasi aplikasi Go
                    sh 'go get -d -v ./...'
                    sh 'go build -o app'
                }
            }
        }

        stage('Test') {
            steps {
                // Menjalankan pengujian jika diperlukan
                container('golang') {
                    sh 'go test ./...'
                }
            }
        }

        stage('Deploy') {
            when {
                // Konfigurasi kapan tahap ini harus dijalankan
                // Contoh: hanya ketika ada perubahan pada branch master
                expression {
                    currentBuild.changeSets.any { entry ->
                        entry.branch == 'master'
                    }
                }
            }
            steps {
                // Tempatkan perintah untuk mendeploy aplikasi ke lingkungan produksi di sini
                // Anda dapat menggunakan perintah shell atau alat CI/CD lain yang Anda pilih.
                // Contoh: deploy ke server produksi dengan SSH atau melalui Docker
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            // Tindakan yang akan dijalankan jika pipeline berhasil
            // Contoh: Kirim notifikasi, laporan ke Slack, dsb.
            echo 'Deployment berhasil!'
        }
        failure {
            // Tindakan yang akan dijalankan jika pipeline gagal
            // Contoh: Kirim notifikasi kesalahan ke Slack, laporan bug, dsb.
            echo 'Deployment gagal!'
        }
    }
}
