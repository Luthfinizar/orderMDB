package server

import (
	"database/sql"
)

func Koneksi() (*sql.DB, error) {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/mdbresto")
	if err != nil {
		return nil, err
	}
	return db, nil
}
