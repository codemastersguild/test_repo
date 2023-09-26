package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	// Membuat instance Gin
	router := gin.Default()

	// Rute sederhana
	router.GET("/health-check", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Health check success",
		})
	})

	// Menjalankan server pada port 8080
	router.Run(":9000")
}
