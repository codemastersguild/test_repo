pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Ambil kode dari repositori Git
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Membangun Docker image dengan Dockerfile yang ada di direktori konteks
                script {
                    docker.build("testRepo:latest", "-f Dockerfile .")
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                // Menjalankan Docker Compose
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            // Tindakan yang akan dijalankan jika pipeline berhasil
            // Contoh: Kirim notifikasi, laporan ke Slack, dsb.
            echo 'Pipeline berhasil!'
        }
        failure {
            // Tindakan yang akan dijalankan jika pipeline gagal
            // Contoh: Kirim notifikasi kesalahan ke Slack, laporan bug, dsb.
            echo 'Pipeline gagal!'
        }
    }
}
