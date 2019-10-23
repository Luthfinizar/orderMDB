package handler

import (
	"fmt"
	"net/http"
	"order/server"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
)

type menu struct {
	IDMenu    string
	NamaMenu  string
	Deskripsi string
	URLGambar string
	Jenis     string
	Harga     string
	// NamaPemesan string
	// Phone       string
	// Alamat      string
	// JumlahPesan string
}

var data []menu

func BacaData(c echo.Context) error {
	MenuMakanan()

	return c.JSON(http.StatusOK, data)
}

//ORDER MAKANANNNN
func InputOrder(c echo.Context) error {
	db, err := server.Koneksi()

	defer db.Close()
	var id = c.FormValue("id")
	var NamaPemesan = c.FormValue("NamaPemesan")
	var Phone = c.FormValue("Phone")
	var Alamat = c.FormValue("Alamat")
	var JumlahPesan = c.FormValue("JumlahPesan")
	//INSERT INTO `order`(`IDMenu`, `NamaPemesan`, `Phone`, `Alamat`, `JumlahPesan`) VALUES (2, 'aaa', '098','078',9)

	_, err = db.Exec("INSERT INTO `order`(`IDMenu`, `NamaPemesan`, `Phone`, `Alamat`, `JumlahPesan`) values (?,?,?,?,?)", id, NamaPemesan, Phone, Alamat, JumlahPesan)
	fmt.Println(err)
	if err != nil {
		fmt.Println("Pesanan Gagal Dibuat")
		return c.HTML(http.StatusOK, "<strong> Gagal melakukan pesanan</strong>")
	} else {
		fmt.Println("Pesanan Berhasil Dibuat")
		return c.HTML(http.StatusOK, "<script>alert('Berhasil Melakukan Pesanan, Mohon Tunggu. Terima Kasih! :D'); window.location = 'http://localhost:1323'; </script>")
	}
	return c.Redirect(http.StatusSeeOther, "/")
}

func menu_populer() {

}

//NAMBAH MENU MAKANAN
func TambahData(c echo.Context) error {
	db, err := server.Koneksi()
	defer db.Close()
	var Nama = c.FormValue("NamaMenu")
	var Deskripsi = c.FormValue("Deskripsi")
	var Harga = c.FormValue("Harga")
	var Jenis = c.FormValue("Jenis")
	var URLGambar = c.FormValue("URLGambar")

	_, err = db.Exec("insert into Menu values (?,?,?,?,?,?)", nil, Nama, Deskripsi, URLGambar, Jenis, Harga)

	if err != nil {
		fmt.Println("Menu Gagal Ditambahkan")
		return c.JSON(http.StatusOK, "Gagal Menambahkan Menu")
	} else {
		fmt.Println("Menu Berhasil Ditambahkan")
		return c.JSON(http.StatusOK, "Berhasil Menambahkan Menu")
	}
}

//MANGGIL MENU MAKANAN
func MenuMakanan() {
	data = nil
	db, err := server.Koneksi()
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	defer db.Close()

	rows, err := db.Query("select * from Menu")
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	defer rows.Close()

	for rows.Next() {
		var each = menu{}
		var err = rows.Scan(&each.IDMenu, &each.NamaMenu, &each.Deskripsi, &each.URLGambar, &each.Jenis, &each.Harga)
		if err != nil {
			fmt.Println(err.Error())
			return
		}
		data = append(data, each)
		fmt.Println(data)
	}
	if err = rows.Err(); err != nil {
		fmt.Println(err.Error())
		return
	}
}
