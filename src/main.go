package main

import (
	"database/sql"
	"fmt"
	"repository"

	_ "github.com/go-sql-driver/mysql"
)

type UsersData struct {
	ID              int
	CitizenID       string
	Firstname       string
	Lastname        string
	BirthYear       int
	FirstnameFather string
	LastnamrFather  string
	FirstnameMother string
	LastnameMother  string
	SoldierID       int
	AddressID       int
}

func main() {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/testsck")
	defer db.Close()
	if err != nil {
		fmt.Println("Connect fail")
		fmt.Printf("Error : %s", err)
		return
	}

	fmt.Println("Connet Success")

	//fmt.Println(add(db))
	fmt.Println(repository.ReadAll(db))
	//fmt.Println(delete(db, 6))
	fmt.Println(repository.Edit(db, 4, "มาร์ค"))
	fmt.Println(repository.ReadById(db, 4))
}
