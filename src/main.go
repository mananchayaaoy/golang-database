package main

import (
	"database/sql"
	"fmt"

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

	if err != nil {
		fmt.Println("Connect fail")
		fmt.Printf("Error : %s", err)
		return
	}

	fmt.Println("Connet Success")

	defer db.Close()

	result, _ := db.Query("SELECT * FROM users")

	for result.Next() {
		var userData UsersData //เนื่องจากไม่ได้ประกาศเป็นอาร์เรย์ เลยให้วนใน for

		err := result.Scan(&userData.ID, &userData.CitizenID, &userData.Firstname, &userData.Lastname,
			&userData.BirthYear, &userData.FirstnameFather, &userData.LastnamrFather,
			&userData.FirstnameMother, &userData.LastnameMother, &userData.SoldierID, &userData.AddressID)

		if err != nil {
			panic(err)
		}

		fmt.Println(userData)
	}
}
